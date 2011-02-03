module Ids
    class Accounts < Ids::BaseContainer
        def self.will_parse?(key)
            key == 'Accounts'
        end

        def from_xml(data = {})
            super(Ids::Account, data)
        end
    end
end

Ids::ResponseParser.register_entity(Ids::Accounts)
