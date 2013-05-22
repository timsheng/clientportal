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

	link "consultation_tab", text: "Consultations"
	link "my_profile_tab", text:"My Profile"
	link "compliance_tab", text:"Compliance Approvals"

	def direct_to_consultation_page
		self.consultation_tab

		turn_to ConsultationPage
	end

	def direct_to_my_profile_page
		self.my_profile_tab

		turn_to MyProfilePage
	end

	def direct_to_compliance_page
		self.compliance_tab

		turn_to CompliancePage
	end

end
