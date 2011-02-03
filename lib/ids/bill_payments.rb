module Ids
    class BillPayments < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'BillPayments'
        end

        def from_xml(data = {})
            super(Ids::BillPayment, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::BillPayments)
