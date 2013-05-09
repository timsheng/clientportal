require File.expand_path 'app/cases/spec_helper'

describe 'home page', :home=>false do 
	describe 'initialize page' do 
		context 'page loading' do 
			it 'should visit home page' do 
				home_page = $navi.goto_home_page
				home_page.login?.should be_true
			end
		end
	end
end