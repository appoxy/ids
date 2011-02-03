module Ids
    class PaymentDetail < Ids::Base
        column :cash, :type => Ids::CashPayment
        column :credit_card, :type => Ids::CreditCardPayment
        column :check, :type => Ids::CheckPayment
    end
end
