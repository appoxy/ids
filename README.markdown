#IDS - Ruby Interface for the Intuit IDS Cloud API

This library provides a super easy way to access all IDS objects from the new Intuit IDS Cloud.

For more information, visit the [Intuit IPP website](https://ipp.developer.intuit.com/ipp/federated).


##Usage

ids = Ids::Client.new(< your app token >, session[:saml_ticket], params['realm'])

@accounts = ids.accounts


##Authors

[Appoxy.com](http://www.appoxy.com)
Andrew Kirilenko
Chad Arimura


##Credits

Thanks to the folks at [Xaaps](http://www.xaaps.com) for the initial contribution of the library!