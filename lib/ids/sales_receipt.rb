module Ids
    class SalesReceipt < Ids::BaseEntity
        @object_type = 'salesreceipt'

        column :header, :type => Ids::SalesReceiptHeader
        column :lines, :name => 'Line', :type => [Ids::SalesReceiptLine]
        column :tax_lines, :name => 'TaxLine', :type => [Ids::TaxLine]
    end
end
