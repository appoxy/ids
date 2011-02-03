module Ids
    class SalesOrders < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'SalesOrders'
        end

        def from_xml(data = {})
            super(Ids::SalesOrder, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::SalesOrders)
