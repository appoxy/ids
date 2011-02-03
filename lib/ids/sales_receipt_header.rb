module Ids
    class SalesReceiptHeader < Ids::SalesHeader
        column :ship_addr, :type => Ids::PhysicalAddress
        column :ship_method_id, :type => Ids::Id
        column :ship_method_name
        column :deposit_to_account_id, :type => Ids::Id
        column :deposit_to_account_name
        column :payment_method_id, :type => Ids::Id
        column :payment_method_name
        column :detail, :type => Ids::PaymentDetail
        column :discount_amt, :type => Ids::Decimal
        column :discount_rate, :type => Ids::Decimal
        column :discount_account_id, :type => Ids::Id
        column :discount_account_name
        column :discount_taxable, :type => Ids::Boolean
    end
end
