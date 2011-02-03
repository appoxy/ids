module Ids
    class SalesOrderLine < Ids::SalesLine
        column :manually_closed, :type => Ids::Boolean
    end
end
