module Ids
    class Id < Ids::Base
        column :domain, :name => 'idDomain'
        column :id, :name => 'content'

        def to_xml
            {'@idDomain' => @domain, '' => 'IDS_CONTENT_FIX_START' + @id.to_s + 'IDS_CONTENT_FIX_END'} # FIXME: hackish placeholder, will be fixed in payload generator
        end
    end
end
