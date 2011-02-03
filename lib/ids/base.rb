module Ids
    class Base
        @columns = {}
        @object_type = nil

        def self.column(symbol, args = {})
            attr_accessor symbol
            @columns ||= {}
            name = args[:name] || Ids::Base.symbol_to_xml_name(symbol)
            type = args[:type] || Ids::Data
            @columns[symbol] = [name, type]
        end

        def self.columns
            return @columns if self == Ids::Base
            columns = @columns || {}
            self.superclass.columns.merge(columns)
        end

        def self.object_type
            @object_type
        end

        def self.symbol_to_xml_name(symbol)
            symbol.to_s.split('_').map { |s| s.capitalize }.join
        end

        def initialize(data = {})
            self.class.columns.each do |symbol, args|
                if data[symbol]
                    access_symbol = ('@' + symbol.to_s).to_sym
                    instance_variable_set(access_symbol, data[symbol])
                end
            end
        end

        def from_xml(el)
            column = self.class.columns.find { |symbol, args| args[0] == 'content' }
            if column
                symbol = column[0]
                type = column[1][1]
                access_symbol = ('@' + symbol.to_s).to_sym
                instance_variable_set(access_symbol, type.from_xml(el.content))
            end

            el.attributes.each do |a|
                column = self.class.columns.find { |symbol, args| args[0] == a.name }
                if column
                    symbol = column[0]
                    type = column[1][1]
                    access_symbol = ('@' + symbol.to_s).to_sym
                    instance_variable_set(access_symbol, type.from_xml(a.value))
                end
            end

            el.find('*').each do |e|
                column = self.class.columns.find { |symbol, args| args[0] == e.name }
                if column
                    symbol = column[0]
                    type = column[1][1]
                    access_symbol = ('@' + symbol.to_s).to_sym

                    if type.class == Array
                        current = instance_variable_get(access_symbol)
                        current ||= []
                        if type[0] == Ids::Data || type[0] == Ids::Boolean || type[0] == Ids::Decimal || type[0] == Ids::Date
                            current << type[0].from_xml(e.content)
                        else
                            current << type[0].new.from_xml(e)
                        end
                        instance_variable_set(access_symbol, current)
                    elsif type == Ids::Data || type == Ids::Boolean || type == Ids::Decimal || type == Ids::Date
                        instance_variable_set(access_symbol, type.from_xml(e.content))
                    else
                        instance_variable_set(access_symbol, type.new.from_xml(e))
                    end
                end
            end

            self
        end

        def to_xml
            r = {}
            self.class.columns.each do |symbol, args|
                access_symbol = ('@' + symbol.to_s).to_sym
                value = instance_variable_get(access_symbol)
                if value
                    name = args[0]
                    type = args[1]
                    if type.class == Array
                        r[name] = []
                        value.each do |v|
                            if type[0] == Ids::Data || type[0] == Ids::Boolean || type[0] == Ids::Decimal || type[0] == Ids::Date
                                r[name] << type[0].to_xml(v)
                            else
                                r[name] << v.to_xml
                            end
                        end
                    elsif type == Ids::Data || type == Ids::Boolean || type == Ids::Decimal || type == Ids::Date
                        r[name] = type.to_xml(value)
                    else 
                        r[name] = value.to_xml
                    end
                end
            end

            return {self.class.to_s[5 .. -1] => r} if self.class.object_type
            r
        end

        def to_s
            r = self.class.to_s + ' {'
            self.class.columns.each do |symbol, args|
                type = args[1]
                access_symbol = ('@' + symbol.to_s).to_sym
                value = instance_variable_get(access_symbol)
                if value
                    if value.class == Array
                        value = value.map { |v| v.to_s }
                    end
                    q = ''
                    q = '\'' if type == Ids::Data || type == Ids::Date
                    r += symbol.to_s + ' => ' + q + value.to_s + q + ', '
                end
            end

            r = r[0 .. -3] if r[-1] == ' ' && r[-2] == ','
            r += '}'
            r
        end

        def self.table_header
            r = ''

            depth = self.table_depth
            0.upto(depth - 1) do |cur_depth|
                r += '<tr>'
                r += self.table_header_row(cur_depth, depth - cur_depth)
                r += '</tr>'
            end

            r
        end

        def self.table_header_row(depth, row_span)
            r = ''

            if depth == 0
                self.columns.each do |symbol, args|
                    type = args[1]
                    if type.class == Array
                        type = type[0]
                    end
                    cur_row_span = 1
                    if type == Ids::Data || type == Ids::Boolean || type == Ids::Decimal || type == Ids::Date
                        cur_row_span = row_span
                    end
                    r += "<td colspan=\"#{type.table_num_cols}\" rowspan=\"#{cur_row_span}\">"
                    r += symbol.to_s
                    r += '</td>'
                end
            else
                self.columns.each do |symbol, args|
                    type = args[1]
                    if type.class == Array
                        type = type[0]
                    end
                    if type == Ids::Data || type == Ids::Boolean || type == Ids::Decimal || type == Ids::Date
                    else
                        r += type.table_header_row(depth - 1, row_span)
                    end
                end
            end
          
            r
        end

        def self.table_num_cols
            num = 0
            self.columns.each do |symbol, args|
                type = args[1]
                if type.class == Array
                    type = type[0]
                end
                num += type.table_num_cols
            end

            num
        end

        def self.table_depth
            depth = 0
            self.columns.each do |symbol, args|
                type = args[1]
                if type.class == Array
                    type = type[0]
                end
                cur_depth = type.table_depth + 1
                depth = cur_depth if cur_depth > depth
            end

            depth
        end

        def table_data(add_tr = true)
            r = ''

            more_data = true
            idx = 0
            while more_data
                more_data = false
                r += '<tr>' if add_tr
                self.class.columns.each do |symbol, args|
                    type = args[1]
                    access_symbol = ('@' + symbol.to_s).to_sym
                    value = instance_variable_get(access_symbol)
                    if type.class == Array
                        if value.nil? or idx >= value.size
                            type[0].table_num_cols.times do
                                r += '<td></td>'
                            end
                        else
                            more_data = true if idx < value.size - 1
                            if type[0] == Ids::Data || type[0] == Ids::Boolean || type[0] == Ids::Decimal || type[0] == Ids::Date
                                r += "<td>#{value[idx]}</td>"
                            else
                                r += value[idx].table_data(false)
                            end
                        end
                    elsif type == Ids::Data || type == Ids::Boolean || type == Ids::Decimal || type == Ids::Date
                        value = nil if idx != 0
                        v = value.nil? ? '' : value.to_s
                        r += "<td>#{v}</td>"
                    else
                        value = nil if idx != 0
                        if value.nil?
                            type.table_num_cols.times do
                                r += '<td></td>'
                            end
                        else
                            r += value.table_data(false)
                        end
                    end
                end

                idx += 1
            end

            r += '</tr>' if add_tr
            r
        end
    end
end
