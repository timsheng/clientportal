class ConsultationPage < ClientportalPage
	page_url "#{$config.host}"
	def direct_to_login_page
		self.login 
		turn_to LoginPage
	end
end
