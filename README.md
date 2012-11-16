rubycas-client-example
==========================

An example app to demonstrate how to use a CAS server

# Things Worth Highlighting
1. This app uses the `rubycas-client` gem and the `rubycas-client-rails` gem.  Note: there is an issue with the current version of the `rubycas-client-rails` gem (0.1.0).  You must point your gem path to the GitHub repo: `gem "rubycas-client-rails", :git => "git://github.com/rubycas/rubycas-client-rails.git"`.
2. To make a link to the CAS server login page, you can put this in the view: `<%= link_to("Login", RubyCAS::Filter.login_url(controller) %>`.
3. When a user is logged in, their information is stored in `session[:cas_user]`.
4. Any pages that are restricted to authorized users, must have `before_filter RubyCAS::Filter`.
5. Any page that is allowed to be accessed by anyone, but will show optional content if a user is authenticated should have `before_filter RubyCAS::GatewayFilter`.
6. To log out, call `RubyCAS::Filter.logout(self)` to logout and be redirected to the referrer url.  If you want the user to be redirected to another url, you can pass an optional parameter like `RubyCAS::Filter.logout(self, 'http://www.myDomain.com/')`.
7. For more documentation, see https://github.com/rubycas/rubycas-client and https://github.com/rubycas/rubycas-client-rails.
8. In order for Single Sign Out to work, you need to change the session store to use ActiveRecord.  In addition to that, add the following code to config/application.rb:

`config.rubycas.cas_base_url = 'http://localhost:3001/' # Set the url to the Ruby CAS server`

`config.rubycas.enable_single_sign_out = true # Enable single sign out`

`config.allow_forgery_protection = false # In order for the CAS single sign out to work, allow_forgery_protection must be set to false (at least for the actions behind the CAS filter)`
9. If you want the rubycas logger to use the default rails logger, add the following to config/application.rb:
`# Instruct the client to log to the default rails logger`
`config.rubycas.logger = Rails.logger`
