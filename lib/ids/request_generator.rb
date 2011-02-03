require 'uuidtools'
require 'xmlsimple'

module Ids
    class RequestGenerator
        def self.url(realm, object_type)
            "https://services.intuit.com/sb/#{object_type}/v2/#{realm}"
        end

        def self.authorization(app_token, saml_ticket)
            "INTUITAUTH intuit-app-token=\"#{app_token}\",intuit-token=\"#{saml_ticket}\""
        end

        def self.uuid
            UUIDTools::UUID.timestamp_create().to_s.gsub('-', '')
        end

        def self.request_id
            Ids::RequestGenerator.uuid
        end

        def self.iterator_id
            Ids::RequestGenerator.uuid
        end

        def self.select_payload(object_type, filters)
            request_header = {'@xmlns' => 'http://www.intuit.com/sb/cdm/v2'}
            XmlSimple.xml_out({"#{object_type}Query" => request_header.merge({"IteratorId" => Ids::RequestGenerator.iterator_id}.merge(filters))},
                              {'KeepRoot' => true, 'AttrPrefix' => true}).gsub(/\nIDS_CONTENT_FIX_START(.*)IDS_CONTENT_FIX_END\n\s+/, '\1') 
        end

        def self.modification_payload(realm, method, for_xml = {})
            request_header = {'@RequestId' => Ids::RequestGenerator.request_id,
                              '@xmlns' => 'http://www.intuit.com/sb/cdm/v2',
                              '@xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
                              '@xsi:schemaLocation' => 'http://www.intuit.com/sb/cdm/v2/RestDataFilter.xsd'}
            XmlSimple.xml_out({method.capitalize => request_header.merge(for_xml)},
                              {'KeepRoot' => true, 'AttrPrefix' => true}).gsub(/\nIDS_CONTENT_FIX_START(.*)IDS_CONTENT_FIX_END\n\s+/, '\1')
        end
    end
end
