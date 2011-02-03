module Ids
    class SalesHeader < Ids::BaseHeader
        column :customer_id, :type => Ids::Id
        column :customer_name
        column :job_id, :type => Ids::Id
        column :job_name
        column :remit_to_id, :type => Ids::Id
        column :remit_to_name
        column :class_id, :type => Ids::Id
        column :class_name
        column :sales_rep_id, :type => Ids::Id
        column :sales_rep_name
        column :sales_tax_code_id, :type => Ids::Id
        column :sales_tax_code_name
        column :po_number, :name => 'PONumber'
        column :fob, :name => 'FOB'
        column :ship_date, :type => Ids::Date
        column :sub_total_amt, :type => Ids::Decimal
        column :tax_id, :type => Ids::Id
        column :tax_name
        column :tax_group_id, :type => Ids::Id
        column :tax_group_name
        column :tax_rate, :type => Ids::Decimal
        column :tax_amt, :type => Ids::Decimal
        column :total_amt, :type => Ids::Decimal
        column :to_be_printed, :type => Ids::Boolean
        column :to_be_emailed, :type => Ids::Boolean
        column :custom
    end
end
