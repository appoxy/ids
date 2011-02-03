module Ids
    class SuccessResponses < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'Success'
        end

        def from_xml(data = {})
            super(Ids::SuccessResponse, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::SuccessResponses)
