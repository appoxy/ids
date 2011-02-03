module Ids
    class BaseRole < Ids::BaseEntity
        column :party_reference_id, :type => Ids::Id
        column :type_of
        column :name
        column :addresses, :name => 'Address', :type => [Ids::PhysicalAddress]
        # TODO: Phone(s)
        # TODO: WebSite(s)
        # TODO: Email(s)
        column :external_id
        column :title
        column :given_name
        column :middle_name
        column :family_name
        column :suffix
        column :gender
        column :birth_date, :type => Ids::Date
        column :user_id
        column :org_id
        column :legal_name
        column :dba_name
        column :industry
        column :non_profit, :type => Ids::Boolean
        column :legal_structure
        column :category
        column :tax_identifier
        # TODO: Note(s)
    end
end
