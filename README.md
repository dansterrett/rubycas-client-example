rubycas-client-example
==========================

An example app to demonstrate how to use a CAS server

# Notes
1. This app uses the `rubycas-client` gem and the `rubycas-client-rails` gem.  Note: there is an issue with the current version of the `rubycas-client-rails` gem (0.1.0).  You must point your gem path to the GitHub repo: `gem "rubycas-client-rails", :git => "git://github.com/rubycas/rubycas-client-rails.git"`.
2. The session store has been changed to use active record, so that Single Sign Out will work.
3. To make a link to the CAS server login page, you can put this in the view: `<%= link_to("Login", RubyCAS::Filter.login_url(controller) %>`.
4. When a user is logged in, their information is stored in `session[:cas_user]`.
5. Any pages that are restricted to authorized users, must have `before_filter RubyCAS::Filter`.
6. Any page that is allowed to be accessed by anyone, but will show optional content if a user is authenticated should have `before_filter RubyCAS::GatewayFilter`.
7. To log out, call `RubyCAS::Filter.logout(self)` to logout and be redirected to the referrer url.  If you want the user to be redirected to another url, you can pass an optional parameter like `RubyCAS::Filter.logout(self, 'http://www.myDomain.com/')`.
8. For more documentation, see https://github.com/rubycas/rubycas-client and https://github.com/rubycas/rubycas-client-rails.
