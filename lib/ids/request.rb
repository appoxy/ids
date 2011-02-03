require 'rest_client'

module Ids
    class ResponseError < Exception
        attr_reader :reponse

        def initialize(response)
            @response = response
        end

        def to_s
            @response
        end
    end

    class Request
        def self.get(app_token, saml_ticket, realm, object_class, filters = {})
            payload = Ids::RequestGenerator.select_payload(object_class.to_s[5 .. -1], filters)
            result = []
            begin
                while true do
                    url = Ids::RequestGenerator.url(realm, object_class.object_type)

                    Ids::Log.log("URL: #{url}\n")
                    Ids::Log.log("REQUEST:\n#{payload}\n")

                    response = RestClient::Request.execute(:method => :post,
                                                           :url => url,
                                                           :payload => payload,
                                                           :headers => {'Content-Type' => 'text/xml', 'Authorization' => "#{Ids::RequestGenerator.authorization(app_token, saml_ticket)}"})
                    
                    Ids::Log.log("RESPONSE:\n#{response}\n")

                    raise Ids::ResponseError.new(response) if response.code != 200
                    result = Ids::ResponseParser.parse(response.body, result)
                    break if result.find { |v| v.class == Ids::ErrorResponses }
                end
            rescue Ids::NoMoreResults
            end

            result = nil if result.size == 0
            result = result[0] if result and result.size == 1
            
            Ids::Log.log("PARSED RESPONSE:\n#{result.to_s}\n\n")

            result
        end

        def self.add(app_token, saml_ticket, realm, object)
            response = RestClient::Request.execute(:method => :post,
                                                   :url => Ids::RequestGenerator.url(realm, object.class.object_type),
                                                   :payload => Ids::RequestGenerator.modification_payload(realm, 'add', object.to_xml),
                                                   :headers => {'Content-Type' => 'text/xml', 'Authorization' => "#{Ids::RequestGenerator.authorization(app_token, saml_ticket)}"})
            raise Ids::ResponseError.new(response) if response.code == 404
            result = Ids::ResponseParser.parse(response.body, [])

            result = nil if result.size == 0
            result = result[0] if result and result.size == 1
            result 
        end

        def self.del(app_token, saml_ticket, realm, object)
            dobject = object.class.new(:id => object.id)
            response = RestClient::Request.execute(:method => :post,
                                                   :url => Ids::RequestGenerator.url(realm, object.class.object_type),
                                                   :payload => Ids::RequestGenerator.modification_payload(realm, 'del', dobject.to_xml),
                                                   :headers => {'Content-Type' => 'text/xml', 'Authorization' => "#{Ids::RequestGenerator.authorization(app_token, saml_ticket)}"})
            raise Ids::ResponseError.new(response) if response.code == 404
            result = Ids::ResponseParser.parse(response.body, [])

            result = nil if result.size == 0
            result = result[0] if result and result.size == 1
            result 
        end
    end
end
