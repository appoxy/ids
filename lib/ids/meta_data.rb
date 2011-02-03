module Ids
    class MetaData < Ids::Base
        column :created_by
        column :created_by_id
        column :create_time, :type => Ids::Date
        column :last_modified_by
        column :last_modified_by_id
        column :last_updated_time, :type => Ids::Date
    end
end
