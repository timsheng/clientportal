require File.expand_path 'app/cases/shared/action'

class LoginPage < ClientportalPage
	#include Action
	page_url "http://www.capvision.com/user/login"
  text_field 'username', id:'LoginForm_email'
  text_field 'password', id:'LoginForm_password'
  button 'login_in', name:'yt0'
  def login(usr,pwd)
    self.username = usr
    self.password = pwd
    self.login_in
    turn_to HomePage
  end
  #def direct_to_home_page
  #  self.login(usr,pwd)
  #
  #end

	
	
end
