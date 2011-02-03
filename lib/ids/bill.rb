module Ids
    class Bill < Ids::BaseEntity
        @object_type = 'bill'

        column :header, :type => Ids::BillHeader
        column :lines, :name => 'Line', :type => [Ids::BillLine]
    end
end
