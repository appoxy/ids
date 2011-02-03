module Ids
    class BillPaymentHeader < Ids::BaseHeader
        column :entity_id, :type => Ids::Id
        column :entity_name
        column :entity_type
        column :ap_account_id, :name => 'APAccountId', :type => Ids::Id
        column :ap_account_name, :name => 'APAccountName'
        column :bank_account_id, :type => Ids::Id
        column :bank_account_name
        column :to_be_printed, :type => Ids::Boolean
        # TODO: CheckDetail
        column :payee_addr, :type => Ids::PhysicalAddress
        column :cc_account_id, :name => 'CCAccountId', :type => Ids::Id
        column :cc_account_name, :name => 'CCAccountName'
        # TODO: CCDetail
        column :total_amt, :type => Ids::Decimal
    end
end
