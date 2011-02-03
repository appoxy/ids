module Ids
    class NoMoreResults < Exception
    end

    class ResponseParser
        def self.register_entity(entity)
            @entities ||= []
            @entities << entity
        end

        def self.parse(response, result)
            doc = LibXML::XML::Parser.string(response).parse
            Ids::ResponseParser.recursive_parse(doc, result)
        end

        def self.recursive_parse(doc, result)
            gathered = false
            doc.root.find('*').each do |el|
                entity = @entities.find { |e| e.will_parse?(el.name) }
                if entity
                    value = result.find { |v| v.class == entity }
                    if value
                        gathered ||= value.from_xml(el)
                    else
                        value = entity.new
                        gathered ||= value.from_xml(el)
                        result << value
                    end
                end
            end

            raise Ids::NoMoreResults.new unless gathered

            result
        end
    end
end
