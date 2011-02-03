module Ids
    class PurchaseHeader < Ids::BaseHeader
        column :vendor_id, :type => Ids::Id
        column :vendor_name
        column :bill_email
        column :reply_email
        column :total_amt, :type => Ids::Decimal
    end
end
