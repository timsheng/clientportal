class ConsultationPage < ClientportalPage
	page_url "#{$config.host}consultation/project/index"

	link :my_profile, :text=>'My Profile'

end
