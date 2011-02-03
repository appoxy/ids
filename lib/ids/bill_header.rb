module Ids
    class BillHeader < Ids::PurchaseHeader
        column :payer_id, :type => Ids::Id
        column :payer_name
        column :ap_account_id, :name => 'APAccountId', :type => Ids::Id
        column :ap_account_name, :name => 'APAccountName'
        column :sales_term_id, :type => Ids::Id
        column :sales_term_name
        column :due_date, :type => Ids::Date
        column :remit_to_addr, :type => Ids::PhysicalAddress
        column :ship_addr, :type => Ids::PhysicalAddress
        column :balance, :type => Ids::Decimal
        column :txn_ids, :name => 'TxnId', :type => [Ids::Id]
    end
end
