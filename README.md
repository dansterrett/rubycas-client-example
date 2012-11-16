rubycas-client-example
==========================

An example app to demonstrate how to use a CAS server

# Things Worth Highlighting

## Gems
* This app uses the `rubycas-client` gem and the `rubycas-client-rails` gem.  Note: there is an issue with the current version of the `rubycas-client-rails` gem (0.1.0).  You must point your gem path to the GitHub repo: `gem "rubycas-client-rails", :git => "git://github.com/rubycas/rubycas-client-rails.git"`.

## Authentication
* To make a link to the CAS server login page, you can put this in the view: `<%= link_to("Login", RubyCAS::Filter.login_url(controller) %>`.
* When a user is logged in, their information is stored in `session[:cas_user]`.
* Any pages that are restricted to authorized users, must have `before_filter RubyCAS::Filter`.
* Any page that is allowed to be accessed by anyone, but will show optional content if a user is authenticated should have `before_filter RubyCAS::GatewayFilter`.
* To log out, call `RubyCAS::Filter.logout(self)` to logout and be redirected to the referrer url.  If you want the user to be redirected to another url, you can pass an optional parameter like `RubyCAS::Filter.logout(self, 'http://www.myDomain.com/')`.

## Configuration (config/application.rb)
* To make the rubycas logger use the default rails logger, add `config.rubycas.logger = Rails.logger`
* Set the url of the Ruby CAS server by adding: `config.rubycas.cas_base_url = 'http://www.example.com/'`

## Single-Sign-Out
* In order for Single-Sign-Out to work, you need to change the session store to use ActiveRecord (in config/initializers/session_store.rb).
* In config/application.rb, add: `config.rubycas.enable_single_sign_out = true` and `config.allow_forgery_protection = false`

## More Documentation
See https://github.com/rubycas/rubycas-client and https://github.com/rubycas/rubycas-client-rails.