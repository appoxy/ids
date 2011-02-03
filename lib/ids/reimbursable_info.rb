module Ids
    class ReimbursableInfo < Ids::Base
        column :customer_id, :type => Ids::Id
        column :customer_name
        column :job_id, :type => Ids::Id
        column :job_name
    end
end
