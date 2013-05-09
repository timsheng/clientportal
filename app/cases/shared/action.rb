require File.expand_path 'app/cases/spec_helper'

module Action	
	include PageObject
	
	text_field 'username', id:'LoginForm_email'
	text_field 'password', id:'LoginForm_password'
	button 'login_in', name:'yt0'
	def login usr,pwd
		self.username = usr
		self.password = pwd
		self.login_in
		turn_to HomePage
	end
end
