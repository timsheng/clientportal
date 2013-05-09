#encoding: utf-8
class HomePage < ClientportalPage
	page_url "http://www.capvision.com/"

	link :login_text, :href=> "/user/login"
  link :client_portal, :href=> "http://consultation.capvision.com/"
	def direct_to_login_page
		self.login_text
		turn_to LoginPage
  end

  def direct_to_consultation_page
    self.client_portal
    turn_to ConsultationPage
  end
end
