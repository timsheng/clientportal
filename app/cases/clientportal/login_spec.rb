#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'

describe 'login page', :login=>false do 
	let(:login_page) do
		login_page = $navi.goto_login_page
	end

	let(:data) do
		data = test_data('user')
	end

	describe 'login by different users' do
		
		it 'should inactive contact be blocked' do
			login_page.login data['inactive']['email'], data['inactive']['password']
			login_failed_page = LoginPage.new login_page.browser
			login_failed_page.error_message.should eq data['inactive']['warning']
		end

		it 'should transferred contact be blocked' do
			login_page.login data['transferred']['email'], data['transferred']['password']
			login_failed_page = LoginPage.new login_page.browser
			login_failed_page.error_message.should eq data['transferred']['warning']
		end

		it 'should unregisterred contact fail to login' do
			login_page.login data['unregisterred']['email'], data['unregisterred']['password']
			login_failed_page = LoginPage.new login_page.browser
			login_failed_page.error_message.should eq data['unregisterred']['warning']
		end

		it 'should active contact succeed to login' do
			login_page.login data['active']['email'], data['active']['password']
		# 	login_failed_page = LoginPage.new login_page.browser
		# 	login_failed_page.error_message.should eq data['active']['warning']
		end


	end
	
end