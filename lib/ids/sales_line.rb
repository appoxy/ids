module Ids
    class SalesLine < Ids::BaseLine
        column :amount, :type => Ids::Decimal
        column :class_id, :type => Ids::Id
        column :class_name
        column :taxable, :type => Ids::Boolean
        column :item_id, :type => Ids::Id
        column :item_name
        column :item_type
        column :unit_price, :type => Ids::Decimal
        column :rate_percent, :type => Ids::Decimal
        column :price_level_id, :type => Ids::Id
        column :price_level_name
        column :qty, :type => Ids::Decimal
        column :uom_id, :name => 'UOMId', :type => Ids::Id
        column :uom_abbrv
        column :override_item_account_id, :type => Ids::Id
        column :override_item_account_name
        column :discount_id, :type => Ids::Id
        column :discount_name
        column :sales_tax_code_id, :type => Ids::Id
        column :sales_tax_code_name
        column :custom1
        column :custom2
    end
end
