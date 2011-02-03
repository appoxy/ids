module Ids
    class CreditChargeResponse < Ids::Base
        column :cc_trans_id, :name => 'CCTransId'
        column :status
        column :result_code
        column :result_msg
        column :merchant_acct_num
        column :card_security_code_match
        column :auth_code
        column :avs_street
        column :avs_zip
        column :security_code
        column :recon_batch_id
        column :payment_grouping_code
        column :txn_authorization_time, :type => Ids::Date
        column :txn_authorization_stamp
        column :client_trans_id
    end
end
