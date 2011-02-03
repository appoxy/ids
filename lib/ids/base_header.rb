module Ids
    class BaseHeader < Ids::Base
        column :doc_number
        column :txn_date, :type => Ids::Date
        column :currency
        column :msg
        column :note
        column :status
    end
end
