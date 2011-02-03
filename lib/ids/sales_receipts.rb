module Ids
    class SalesReceipts < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'SalesReceipts'
        end

        def from_xml(data = {})
            super(Ids::SalesReceipt, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::SalesReceipts)
