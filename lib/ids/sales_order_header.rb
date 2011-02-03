module Ids
    class SalesOrderHeader < Ids::SalesHeader
        column :sales_term_id, :type => Ids::Id
        column :sales_term_name
        column :due_date, :type => Ids::Date
        column :bill_addr, :type => Ids::PhysicalAddress
        column :ship_addr, :type => Ids::PhysicalAddress
        column :bill_email
        column :ship_method_id, :type => Ids::Id
        column :ship_method_name
        column :balance, :type => Ids::Decimal
        column :manually_closed, :type => Ids::Boolean
    end
end
