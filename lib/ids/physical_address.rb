module Ids
    class PhysicalAddress < Ids::Base
        column :id, :type => Ids::Id
        column :line1
        column :line2
        column :line3
        column :line4
        column :line5
        column :city
        column :country
        column :country_code
        column :country_sub_division_code
        column :postal_code
        column :postal_code_suffix
        column :geo_code
        column :date_last_verified, :type => Ids::Date
        column :default, :type => Ids::Boolean
        column :tags, :name => 'Tag', :type => [Ids::Data]
    end
end
