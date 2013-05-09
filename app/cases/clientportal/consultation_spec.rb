require File.expand_path 'app/cases/spec_helper'

describe 'consultation page', :consultation do 
	describe 'initialize page' do
    #let(:home_page){$navi.goto_home_page}

		context 'page loading' do
			it 'should visit consultation page' do
          home_page = $navi.goto_home_page
          login_page = home_page.direct_to_login_page
          home_page = login_page.login("contact00_ks@163.com","abcd1234")
          consultation_page = home_page.client_portal
          consultation_page.current_url.should eql "http://consultation.capvision.com/"

			end
		end
	end
end