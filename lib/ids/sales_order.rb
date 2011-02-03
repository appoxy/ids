module Ids
    class SalesOrder < Ids::BaseEntity
        @object_type = 'salesorder'

        column :header, :type => Ids::SalesOrderHeader
        column :lines, :name => 'Line', :type => [Ids::SalesOrderLine]
        column :tax_lines, :name => 'TaxLine', :type => [Ids::TaxLine]
    end
end
