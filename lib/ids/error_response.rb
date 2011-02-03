module Ids
    class ErrorResponse < Ids::AbstractResponse
        column :error_code
        column :error_desc
        column :db_error_code, :name => 'DBErrorCode'
    end
end
