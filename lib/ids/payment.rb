module Ids
    class Payment < Ids::BaseEntity
        @object_type = 'payment'

        column :header, :type => Ids::PaymentHeader
        column :lines, :name => 'Line', :type => [Ids::PaymentLine]
    end
end
