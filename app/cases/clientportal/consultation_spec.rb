#encoding: utf-8
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
		context 'page loading' do
			it 'should visit consultation page' do 
				consultation_page.my_profile?.should be_true
			end
		end
	end

	describe 'consultations module' do 
		context 'verify project list type' do 
			it 'should contains recommended and requested and arranged and completed' do 
				consultation_page.project_list_type.should match(/^(Recommended)|^(Requested)|^(Arranged)|^(Completed)/)
			end

			it 'should be recommended type by default selected' do 
				consultation_page.recommended_status_element.attribute(:class).should eql 'active'
			end

			it 'should be able to select requested type' do 
				consultation_page.requested_status
				sleep 2
				consultation_page.requested_status_element.attribute(:class).should eql 'active'
			end

			it 'should be able to select arranged type' do 
				consultation_page.arranged_status
				sleep 2
				consultation_page.arranged_status_element.attribute(:class).should eql 'active'
			end

			it 'should be able to select completed type' do 
				consultation_page.completed_status
				sleep 2
				consultation_page.completed_status_element.attribute(:class).should eql 'active'
			end
		end

		context 'verify right corresponding description' do 
			it 'should be right by recommended' do 
				# consultation_page.recommended_status
				consultation_page.blank_task_detail.should eql 'All the consultants we’ve recommended to you. Select the consultant you are interested in to see detailed information. Request a call and we will arrange the consultation for you.'
			end

			it 'should be right by requested' do 
				consultation_page.requested_status
				sleep 2
				consultation_page.blank_task_detail.should eql 'All the consultants you would like to speak to. We are currently working on arranging these consultations for you.'
			end

			it 'should be right by arranged' do 
				consultation_page.arranged_status 
				sleep 2
				consultation_page.blank_task_detail.should eql 'All the consultants that you have scheduled. Select the consultant to reschedule or cancel the call. Select the consultant and click "called" to confirm the call and give your valuable feedback.'
			end

			it 'should be right by completed' do 
				consultation_page.completed_status
				sleep 2
				consultation_page.blank_task_detail.should eql 'All the consultations you have completed.'
			end
		end

		context 'verify center project ' do 
			it 'should display center project when the number of left items >0' do 
				if consultation_page.recommended_count.to_i > 0
					consultation_page.project_num?.should be_true
				else
					consultation_page.project_num?.should_not be_true
				end
			end
		end

		context 'verify recommended type request consultation' do 
			before(:each) do 
				consultation_page.task_list_element.[](1).click 
				sleep 2
				consultation_page.request_consultation
				sleep 2
			end

			it 'should pop-up request consultation window' do
				
				consultation_page.background_element.should exist
			end

			it 'should close pop-up window when click x button' do
				consultation_page.closeX_element.double_click
				consultation_page.select_confirmation_element.attribute(:style).should eql 'display: block;'
			end

			it 'should close pop-up window when click close button' do 
				consultation_page.close_element.double_click
				consultation_page.select_confirmation_element.attribute(:style).should eql 'display: block;'
			end

			it 'should submit when inputs value in textarea' do 
				consultation_page.confirm_notes = 'tim test'
				consultation_page.confirm_button
				puts consultation_page.select_confirmation_element.attribute(:style).should eql 'display: block;'
			end
		end

		context 'verify recommended type submit commit' do 
			it 'should submit commit', :test do 
				consultation_page.task_list_element.[](1).click 
				sleep 2
				message = consultation_page.comment_message = 'tim test'+Time.new.to_s
				consultation_page.submit_comment
				sleep 2
				comment = consultation_page.comment_content
				comment.[](comment.length-1).text.should eql "#{message}"
			end
		end
		
	end

	describe 'new project module' do 
		context 'verify request new projevt' do 
			it 'should display a pop-up window when click "New Request" ' do 
				consultation_page.new_request
				consultation_page.background_element.should exist
			end
		end
		
	end
end

