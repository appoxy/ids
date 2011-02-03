require 'intuit_saml'

class SamlController < ApplicationController
    protect_from_forgery :except => :index

    def index
        saml_response = Base64.decode64(params['SAMLResponse'])
        saml_private_key = File.read('cert/intuit.key')
        saml = Intuit::Saml.new(:saml_xml => saml_response, :private_key => saml_private_key)
        session[:saml_ticket] = saml.ticket
        redirect_to saml.application_destination_url
    end
end
