module Ids
    class BaseLine < Ids::Base
        column :id, :type => Ids::Id
        column :desc
    end
end
