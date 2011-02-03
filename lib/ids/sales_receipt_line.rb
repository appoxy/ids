module Ids
    class SalesReceiptLine < Ids::SalesLine
        column :service_date, :type => Ids::Date
    end
end
