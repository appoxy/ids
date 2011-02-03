module Ids
    class CheckPayment < Ids::Base
        column :check_num
        column :status
        column :name_on_acct
        column :acct_num
        column :routing_num
        column :bank_name
    end
end
