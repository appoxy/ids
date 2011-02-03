module Ids
    class InvoiceLine < Ids::SalesLine
        column :service_date, :type => Ids::Date
        column :txn_id, :type => Ids::Id
        column :txn_line_id, :type => Ids::Id
    end
end
