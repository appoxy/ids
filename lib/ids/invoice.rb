module Ids
    class Invoice < Ids::BaseEntity
        @object_type = 'invoice'

        column :header, :type => Ids::InvoiceHeader
        column :lines, :name => 'Line', :type => [Ids::InvoiceLine]
        column :tax_lines, :name => 'TaxLine', :type => [Ids::TaxLine]
    end
end
