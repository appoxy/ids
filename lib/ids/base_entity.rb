module Ids
    class BaseEntity < Ids::Base
        column :id, :type => Ids::Id
        column :sync_token
        column :meta_data, :type => Ids::MetaData
        column :external_key, :type => Ids::Id
        column :synchronized, :type => Ids::Boolean
        column :alternate_ids, :name => 'AlternateId', :type => [Ids::NameValue]
        # TODO: CustomField(s)
    end
end
