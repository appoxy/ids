###############################################################################
# Copyright (c) 2009-06-26 VerticalResponse.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.opensource.org/licenses/eclipse-1.0.php
# Contributors:
#
#    Nathan Smith - initial AES-128-CBC-only, non-validating implementation
#
###############################################################################
require 'base64'
require 'openssl'
require 'xml'

module Intuit
  
  class MissingExpectedSamlNode < Exception; end
  class UnknownSymmetricEncryptionAlgorithmException < Exception; end
  class NoEncryptedKey < Exception; end
  class NoEncryptedTicket < Exception; end
  class NoDestinationURL < Exception; end
  
  # = Usage
  #
  #  saml = Intuit::Saml.new(
  #    :saml_xml => Base64.decode64( params[:SAMLResponse] ),
  #    :private_key => File.read( '/path/to/your/private/ssl.key' )
  #  )
  #  ipp_ticket = saml.ticket
  #  target_url = saml.application_destination_url
  class Saml
    
    @@namespaces = {
      'ds' => 'http://www.w3.org/2000/09/xmldsig#',
      'saml' => 'urn:oasis:names:tc:SAML:2.0:assertion',
      'samlp' => 'urn:oasis:names:tc:SAML:2.0:protocol',
      'xenc' => 'http://www.w3.org/2001/04/xmlenc#',
    }
    
    # sets up the tool with the SAML XML and the private key corresponding to the public key registered with IPP
    #
    #
    #  saml = Intuit::Saml.new(
    #    :saml_xml => Base64.decode64( params[:SAMLResponse] ),
    #    :private_key => File.read( '/path/to/your/private/ssl.key' )
    #  )
    def initialize params
      @saml_doc = LibXML::XML::Parser.string( params[:saml_xml] ).parse
      @private_key = OpenSSL::PKey::RSA.new( params[:private_key] )
    end
    
    # extracts the IPP API ticket from the SAML document
    def ticket
      # collect relevant parts of the saml document
      begin
        @encrypted_key = expected_saml_node_content( @saml_doc, '/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:EncryptedAttribute/xenc:EncryptedData/ds:KeyInfo/xenc:EncryptedKey/xenc:CipherData/xenc:CipherValue' )
      rescue Intuit::MissingExpectedSamlNode
        raise NoEncryptedKey.new
      end
      begin
        @encrypted_ticket = expected_saml_node_content( @saml_doc, '/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:EncryptedAttribute/xenc:EncryptedData/xenc:CipherData/xenc:CipherValue' )
      rescue Intuit::MissingExpectedSamlNode
        raise NoEncryptedTicket.new
      end
      
      # make sure the encryption algorithm is something that is recognized (currently only aes-128 is recognized)
      encryption_method_node = expected_saml_node( @saml_doc, '/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:EncryptedAttribute/xenc:EncryptedData/xenc:EncryptionMethod' )
      algorithm = encryption_method_node.attributes.to_h['Algorithm']
      unless algorithm.eql?( 'http://www.w3.org/2001/04/xmlenc#aes128-cbc' )
        raise Intuit::UnknownSymmetricEncryptionAlgorithmException.new( "unknown symmetric encryption algorithm #{ algorithm }" )
      end
      
      # decrypt aes-128 key using rsa
      @decrypted_key = @private_key.private_decrypt( Base64::decode64( @encrypted_key ) )
      
      # decrypt ticket using aes-128
      # http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/Overview.html#aes128-cbc
      cipher = OpenSSL::Cipher::Cipher.new( 'AES-128-CBC' )
      cipher.decrypt
      cipher.key = @decrypted_key
      cipher.padding = 0
      ciphertext = Base64::decode64( @encrypted_ticket )
      # remove the first 16 bytes and use them as the initialization vector
      cipher.iv = ciphertext[0,cipher.iv_len]
      ciphertext = ciphertext[cipher.iv_len..-1]
      @decrypted_ticket = cipher.update( ciphertext ) + cipher.final
      # number of padding bytes at the end of the cleartext is recorded in the last byte
      last_byte = @decrypted_ticket[-1].ord
      @decrypted_ticket = @decrypted_ticket[0..-last_byte-1]
      # decrypted value is itself an xml document
      ticket_doc = LibXML::XML::Parser.string( @decrypted_ticket ).parse
      @ticket = expected_saml_node_content( ticket_doc, '/saml:Attribute[@Name="ticket"]/saml:AttributeValue' )
    end
    
    # extracts the targetUrl from the SAML document -
    # this is referred to as "Application Destination URL" in the Federation Advanced Settings for your app
    def application_destination_url
      @application_destination_url = expected_saml_node_content( @saml_doc, '/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name = "targetUrl"]/saml:AttributeValue' )
       rescue Intuit::MissingExpectedSamlNode
          raise NoDestinationURL.new
      return @application_destination_url
    end
    
    # returns a hash full of intermediate data for debugging purposes
    def debug_info
      return {
        :saml_doc => @saml_doc,
        :encrypted_key => @encrypted_key,
        :encrypted_ticket => @encrypted_ticket,
        :decrypted_key => @decrypted_key,
        :decrypted_ticket => @decrypted_ticket,
        :ticket => @ticket,
      }
    end
    
    private
    
    def expected_saml_node doc, xpath_expression
      xpath = doc.find( xpath_expression, @@namespaces )
      node = xpath.first
      raise Intuit::MissingExpectedSamlNode.new( "expected node '#{ xpath_expression }' not found" ) if node.nil?
      return node
    end
    
    def expected_saml_node_content doc, xpath_expression
      node = expected_saml_node( doc, xpath_expression )
      return node.content
    end
    
  end
  
end
