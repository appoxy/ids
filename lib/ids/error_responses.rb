module Ids
    class ErrorResponses < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'Error'
        end

        def from_xml(data = {})
            super(Ids::ErrorResponse, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::ErrorResponses)
