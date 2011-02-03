module Ids
    class PaymentLine < Ids::BaseLine
        column :amount, :type => Ids::Decimal
        column :txn_id, :type => Ids::Id
        column :txn_num
        column :discount_amt, :type => Ids::Decimal
        column :discount_id, :type => Ids::Id
        column :discount_account_id, :type => Ids::Id
        column :discount_account_name
    end
end
