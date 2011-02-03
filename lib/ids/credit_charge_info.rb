module Ids
    class CreditChargeInfo < Ids::Base
        column :number
        column :token
        column :type
        column :name_on_acct
        column :cc_expir_mn
        column :cc_expit_yr
        column :bill_addr_street
        column :zip_code
        column :cvv
        column :commercial_card_code
        column :cc_txn_mode, :name => 'CCTxnMode'
        column :cc_txn_type, :name => 'CCTxnType'
    end
end
