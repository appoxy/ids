module Ids
    class TaxLine < Ids::BaseLine
        column :amount, :type => Ids::Decimal
        column :tax_id, :type => Ids::Id
        column :tax_name
    end
end
