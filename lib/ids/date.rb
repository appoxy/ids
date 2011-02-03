require 'date'
require 'time'

module Ids
    class Date < Ids::Data
        def self.from_xml(x)
            begin
                return DateTime.parse(x).to_time
            rescue
            end

            nil
        end

        def self.to_xml(x)
            x.gmtime.strftime('%Y-%m-%d')
        end
    end
end
