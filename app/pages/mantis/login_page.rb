#encoding: utf-8
class LoginPage < ClientportalPage
	page_url "#{$config.host}login_page.php"
	
	text_field 'username', name: 'username'
	text_field 'password', name: 'password'
	button 'login_btn', value: 'Login'

	def login user, password
		self.username = user
		self.password = password
		login_btn_element.click

		turn_to MyViewPage
	end

end
