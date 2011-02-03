module Ids
    class PaymentHeader < Ids::BaseHeader
        column :customer_id, :type => Ids::Id
        column :customer_name
        column :job_id, :type => Ids::Id
        column :job_name
        column :remit_to_id, :type => Ids::Id
        column :remit_to_name
        column :ar_account_id, :name => 'ARAccountId', :type => Ids::Id
        column :ar_account_name, :name => 'ARAccountName'
        column :deposit_to_account_id, :type => Ids::Id
        column :deposit_to_account_name
        column :payment_method_id, :type => Ids::Id
        column :payment_method_name
        column :detail, :type => Ids::PaymentDetail
        column :total_amt, :type => Ids::Decimal
        column :unapplied_amt, :type => Ids::Decimal
        column :process_payment, :type => Ids::Decimal
    end
end
