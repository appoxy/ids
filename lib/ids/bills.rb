module Ids
    class Bills < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'Bills'
        end

        def from_xml(data = {})
            super(Ids::Bill, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::Bills)
