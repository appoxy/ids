module Ids
    class Money < Ids::Base
        column :currency_code
        column :amount, :type => Ids::Decimal
    end
end
