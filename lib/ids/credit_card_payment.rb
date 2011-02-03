module Ids
    class CreditCardPayment < Ids::Base
        column :credit_charge_info, :type => Ids::CreditChargeInfo
        column :credit_charge_response, :type => Ids::CreditChargeResponse
    end
end
