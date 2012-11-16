class AuthController < ApplicationController
	# This will force CAS authentication before the user
  # is allowed to access any action in this controller.
  
  def logout
    uri = URI.parse(self.request.referer)
    root_url = uri.scheme.to_s + '://' + uri.host.to_s + ':' + uri.port.to_s
    RubyCAS::Filter.logout(self, root_url)
  end

end