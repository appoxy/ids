module Ids
    class Invoices < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'Invoices'
        end

        def from_xml(data = {})
            super(Ids::Invoice, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::Invoices)
