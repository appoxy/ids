module Ids
    class AbstractResponse < Ids::Base
        # TODO: CdmObjectRef
        # TODO: CdmObject
        column :request_name
        column :processed_time, :type => Ids::Date
        column :request_id
    end
end
