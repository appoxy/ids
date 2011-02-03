module Ids
    class InvoiceHeader < Ids::SalesHeader
        column :ar_account_id, :name => 'ARAccountId', :type => Ids::Id
        column :ar_account_name
        column :sales_term_id, :type => Ids::Id
        column :sales_term_name
        column :due_date, :type => Ids::Date
        column :bill_addr, :type => Ids::PhysicalAddress
        column :ship_addr, :type => Ids::PhysicalAddress
        column :bill_email
        column :ship_method_id, :type => Ids::Id
        column :ship_method_name
        column :balance, :type => Ids::Decimal
        column :discount_amt, :type => Ids::Decimal
        column :discount_rate, :type => Ids::Decimal
        column :discount_account_id, :type => Ids::Decimal
        column :discount_account_name, :type => Ids::Decimal
        column :discount_taxable, :type => Ids::Boolean
        column :txn_ids, :name => 'TxnId', :type => [Ids::Id]
    end
end
