module Ids
    class Account < Ids::BaseEntity
        @object_type = 'account'

        column :name
        column :account_parent_id, :type => Ids::Id
        column :account_parent_name
        column :desc
        column :active, :type => Ids::Boolean
        column :type
        column :subtype
        column :acct_num
        column :bank_num
        column :routing_num
        column :opening_balance, :type => Ids::Decimal
        column :opening_balance_date, :type => Ids::Decimal
        column :current_balance, :type => Ids::Decimal
        column :current_balance_with_sub_accounts, :type => Ids::Decimal
    end
end
