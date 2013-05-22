require File.expand_path 'app/cases/shared/action'

class CompliancePage < ClientportalPage
	include Action

	page_url "#{$config.host}consultation/compliance/index"

	text_field "start_date", id:"ComplianceFilter_startdate"
	text_field "end_date", id:"ComplianceFilter_enddate"
	text_field "keywords", id:"ComplianceFilter_keywords"
	checkbox "tba", id:"ComplianceFilter_status_0"
	checkbox "approved", id:"ComplianceFilter_status_1"
	checkbox "rejected", id:"ComplianceFilter_status_2"
	button "filter", name:"yt0"
	link "approve", id:"compliance-approve-button"
	link "reject", id:"compliance-reject-button"

	table "compliance_list", :class => "items table table-striped"
end