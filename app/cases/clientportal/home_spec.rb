require File.expand_path 'app/cases/spec_helper'

describe 'home page', :home=>false do 
	describe 'initialize page' do 
		context 'page loading' do 
			it 'should visit home page' do 
				home_page = $navi.goto_home_page
				# home_page.login_text?.should be_true
				# home_page.should be_login_text
				# home_page.title.should match(/Home*./)
				home_page.title.should include("Home")
			end
		end
	end
end