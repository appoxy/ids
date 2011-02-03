module Ids
    class BillLine < Ids::PurchaseLine
        column :txn_id, :type => Ids::Id
        column :txn_line_id, :type => Ids::Id
    end
end
