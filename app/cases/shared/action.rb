require File.expand_path 'app/cases/spec_helper'

module Action	
	include PageObject
	#login element
	text_field 'username', id:'LoginForm_email'
	text_field 'password', id:'LoginForm_password'
	button 'login_in', name:'yt0'
	def login(usr,pwd)
		self.username = usr
		self.password = pwd
		self.login_in
		turn_to HomePage
	end

	#def login_flow(usr,pwd)
	#	home_page = $navi.goto_home_page
	#	login_page = home_page.login
	#	login_page.login(usr,pwd)
	#end
end
