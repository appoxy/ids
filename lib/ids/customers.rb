module Ids
    class Customers < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'Customers'
        end

        def from_xml(data = {})
            super(Ids::Customer, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::Customers)
