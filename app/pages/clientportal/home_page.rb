#encoding: utf-8
class HomePage < ClientportalPage
	page_url "#{$config.host}"

	link :login_text, :href=> "/index.php/user/login"
  link :client_portal, :text=> "Client Portal"

	def direct_to_login_page
		self.login_text

		turn_to LoginPage
  end

  def direct_to_consultation_page
    self.client_portal

    turn_to ConsultationPage
  end
end
