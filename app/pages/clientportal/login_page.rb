require File.expand_path 'app/cases/shared/action'

class LoginPage < ClientportalPage
	include Action

	page_url "#{$config.host}user/login"


	
	
end
