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

##License

The MIT License

Copyright (c) 2011

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.