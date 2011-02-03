module Ids
    class BillPayment < Ids::BaseEntity
        @object_type = 'billpayment'

        column :header, :type => Ids::BillPaymentHeader
        column :lines, :name => 'Line', :type => [Ids::BillPaymentLine]
    end
end
