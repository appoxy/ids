module Ids
    class PurchaseLine < Ids::BaseLine
        column :amount, :type => Ids::Decimal
        column :class_id, :type => Ids::Id
        column :class_name
        column :reimbursable_info, :type => Ids::ReimbursableInfo
        column :billable_status
        column :item_id, :type => Ids::Id
        column :item_name
        column :item_type
        column :unit_price, :type => Ids::Decimal
        column :qty, :type => Ids::Decimal
        column :uom_id, :name => 'UOMId', :type => Ids::Id
        column :uom_abbrv, :name => 'UOMAbbrv'
        column :override_item_account_id, :type => Ids::Id
        column :override_item_account_name
        column :account_id, :type => Ids::Id
        column :account_name
        column :account_type
    end
end
