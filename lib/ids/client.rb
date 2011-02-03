module Ids
    class Client
        def initialize(app_token, saml_ticket, realm)
            @app_token = app_token
            @saml_ticket = saml_ticket
            @realm = realm
        end

        def get(object_class, filters = {})
           Ids::Request.get(@app_token, @saml_ticket, @realm, object_class, filters)
        end

        def add(object)
           Ids::Request.add(@app_token, @saml_ticket, @realm, object)
        end

        def del(object)
           Ids::Request.del(@app_token, @saml_ticket, @realm, object)
        end

        def customers(filters = {})
           get(Ids::Customer, filters).values
        end

        def accounts(filters = {})
           get(Ids::Account, filters).values
        end

        def bills(filters = {})
           get(Ids::Bill, filters).values
        end

        def bill_payments(filters = {})
           get(Ids::BillPayment, filters).values
        end

        def payments(filters = {})
           get(Ids::Payment, filters).values
        end

        def sales_orders(filters = {})
           get(Ids::SalesOrder, filters).values
        end

        def sales_receipts(filters = {})
           get(Ids::SalesReceipt, filters).values
        end

        def invoices(filters = {})
           get(Ids::Invoice, filters).values
        end
    end
end
