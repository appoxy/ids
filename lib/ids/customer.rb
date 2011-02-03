module Ids
    class Customer < Ids::BaseRole
        @object_type = 'customer'

        column :active, :type => Ids::Boolean
        column :show_as
        column :customer_type_id, :type => Ids::Id
        column :customer_type_name
        column :sales_term_id, :type => Ids::Id
        column :sales_term_name
        column :sales_rep_id, :type => Ids::Id
        column :sales_rep_name
        column :sales_tax_code_id, :type => Ids::Id
        column :sales_tax_code_name
        column :tax_id, :type => Ids::Id
        column :tax_name
        column :tax_group_id, :type => Ids::Id
        column :tax_group_name
        column :payment_method_id, :type => Ids::Id
        column :payment_method_name
        column :price_level_id, :type => Ids::Id
        column :price_level_name
        column :open_balance, :type => Ids::Money
        column :open_balance_date, :type => Ids::Date
        column :open_balance_with_jobs, :type => Ids::Money
        column :credit_limit, :type => Ids::Money
        column :acct_num
        column :over_due_balance, :type => Ids::Money
        column :total_revenue, :type => Ids::Money
        column :total_expense, :type => Ids::Money
        # TODO: JobInfo
    end
end
