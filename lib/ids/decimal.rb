module Ids
    class Decimal < Ids::Data
        def self.from_xml(x)
            x.to_f
        end

        def self.to_xml(x)
            x.to_s
        end
    end
end
