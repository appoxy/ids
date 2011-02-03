module Ids
    class Payments < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'Payments'
        end

        def from_xml(data = {})
            super(Ids::Payment, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::Payments)
