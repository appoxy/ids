module Ids
    class BaseContainer
        attr_accessor :values

        def initialize
            @values = []
        end

        def self.will_parse?(key)
            false
        end

        def from_xml(klass, el)
            name = klass.to_s[5 .. -1]
            gathered = false
            el.find('*').each do |e|
                if e.name == name
                    @values << klass.new.from_xml(e)
                    gathered = true
                end
            end

            gathered
        end

        def to_s
            self.class.to_s + ' [' + (@values.map { |v| v.to_s }.join(', ')) + ']'
        end
    end
end
