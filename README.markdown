#Appoxy IDS - Ruby Interface for the Intuit IDS Cloud API

This library provides a super easy way to access all IDS objects from the new Intuit IDS Cloud.



##Usage

ids = Ids::Client.new(<your app tocken>, session[:saml_ticket], params['realm'])

@accounts = ids.accounts