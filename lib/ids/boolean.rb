module Ids
    class Boolean < Ids::Data
        def self.from_xml(x)
            x == 'true'
        end

        def self.to_xml(x)
            x.to_s
        end
    end
end
