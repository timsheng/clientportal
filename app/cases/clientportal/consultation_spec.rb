require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'consultation page', :consultation=>false do 
	let(:consultation_page)do 
		    home_page = $navi.goto_home_page
			login_page = home_page.direct_to_login_page
			home_page = login_page.login "gzu@capvision.com","1234"
			consultation_page = home_page.direct_to_consultation_page
    end
	
	describe 'initialize page' do
    # let(:consultation_page){$navi.goto_home_page.direct_to_login_page.login("gzu@capvision.com","1234").direct_to_consultation_page}
    
		context 'page loading' do
			it 'should visit consultation page' do 
				# home_page = $navi.goto_home_page
				# login_page = home_page.direct_to_login_page
				# home_page = login_page.login "gzu@capvision.com","1234"
				# consultation_page = home_page.direct_to_consultation_page
				consultation_page.my_profile?.should be_true
			end

			xit 'should be xxx' do 

			end

			it 'should pending' do
				pending 
			end

			it 'should pass' do
			    consultation_page 
			end
		end
	end
end