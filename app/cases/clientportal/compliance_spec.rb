#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/action'

describe 'compliance page', :compliance=>false do 
	let(:compliance_page) do 
		    home_page = $navi.goto_home_page
			login_page = home_page.direct_to_login_page
			home_page = login_page.login "contact00_ks@163.com","abcd1234"
			consultation_page = home_page.direct_to_consultation_page
			compliance_page = consultation_page.direct_to_compliance_page
    end

    it 'should direct to compliance page clicking compliance' do
    	compliance_page.title.should eq "Compliance - Capvision"
    end

    it 'should filter tasks by start date' do 
    	start_date = "2013-03-01"
    	compliance_page.start_date = start_time
    	compliance_page.filter
    	compliance_page.compliance_list_element.each do |row|
    		row[2].text.to_time.to_i.should >= start_time.to_time.to_i if row[2].text != "Requested Time"
    	end
    end

    it 'should filter tasks by end date' do
    	end_date = "2013-06-01"
    	compliance_page.end_date = end_date
    	compliance_page.filter
    	compliance_page.compliance_list_element.each do |row|
    		row[2].text.to_time.to_i.should <= (end_date.to_time.to_i+60*60*24) if row[2].text != "Requested Time"
    	end
    end

    it 'should filter tasks by keywords' do
    	compliance_page.keywords = "维保生集团公司"
    	compliance_page.check_approved
    	compliance_page.check_rejected
    	compliance_page.filter
    	compliance_page.compliance_list_element[1][4].text.should include "维保生集团公司"
    end

    it 'should filter tasks by status TBA' do
    	compliance_page.check_tba
    	compliance_page.filter
    	compliance_page.compliance_list_element.each do |row|
    		row[1].text.should match(/Status|TBA/)
    	end
    end

    it 'should filter tasks by status approved' do
    	compliance_page.uncheck_tba
    	compliance_page.check_approved
    	compliance_page.filter
    	compliance_page.compliance_list_element.each do |row|
    		row[1].text.should match(/Status|Approved/)
    	end
    end

    it 'should filter tasks by status rejected' do
    	compliance_page.uncheck_tba
    	compliance_page.check_rejected
    	compliance_page.filter
    	compliance_page.compliance_list_element.each do |row|
    		row[1].text.should match(/Status|Rejected/)
    	end
    end

    xit 'should approve a TBA task' do
    	compliance_page.compliance_list_element[1][0].checkbox_element.check
    	compliance_page.approve
    end

    xit 'should reject a TBA task' do
    	compliance_page.compliance_list_element[1][0].checkbox_element.check
    	compliance_page.reject
    end

    it 'should not reject multiple TBA tasks' do
    	compliance_page.compliance_list_element[1][0].checkbox_element.check
    	compliance_page.compliance_list_element[2][0].checkbox_element.check
    	message = compliance_page.alert do
    		compliance_page.reject
    	end
    	message.should eql "Tip: You can only reject one once."
    end

    xit 'should reject an approved task' do
    	compliance_page.uncheck_tba
    	compliance_page.check_approved
    	compliance_page.filter
    	compliance_page.compliance_list_element[1][2].text.should == "Approved"
    	compliance_page.compliance_list_element[1][0].checkbox_element.check
    	compliance_page.reject
    end

    it 'should be read-only a rejected task' do
    	compliance_page.uncheck_tba
    	compliance_page.check_rejected
    	compliance_page.filter
    	compliance_page.compliance_list_element.each do |row|
    		row[0].checkbox_element.should_not be be_exists
    	end
    end


    xit 'should sort tasks by status' do
    	compliance_page.compliance_list_element[0][1].link_element.click
    	# compliance_page.compliance_list_element.each do |row|
    	
    end

    it 'should sort tasks by requested time' do
    	compliance_page.compliance_list_element[0][2].link_element.click
    	rows = compliance_page.compliance_list_element
    	rows.each_with_index do |row, index|
    		if row[2].text != "Requested Time" and rows[index+1].exists?
    			rows[index+1][2].text.to_time.to_i.should <= row[2].text.to_time.to_i
    		end
    	end

    	compliance_page.compliance_list_element[0][2].link_element.click
    	rows.each_with_index do |row, index|
    		if row[2].text != "Requested Time" and rows[index+1].exists?
    			rows[index+1][2].text.to_time.to_i.should >= row[2].text.to_time.to_i
    		end
    	end

    end


end