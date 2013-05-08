#encoding: utf-8

class ReportIssuePage < ClientportalPage
	include Menu

	page_url "#{$config.host}bug_report_page.php"

	select_list 'category', name: 'category_id'
	text_field 'summary', name: 'summary'
	text_field 'description', name: 'description'
	radio_button 'view_state', name: 'view_state', value: 50
	checkbox 'report_stay', name: 'report_stay'
	button 'submit', value: 'Submit Report'
	
	def create_issue category='', summary, description
		#self.category = category_text_to_value(category)
		self.category = category
		self.summary = summary
		self.description = description
		#class_eval &blk if block_given?
		yield self if block_given?
		self.submit
		turn_to ViewAllBugPage
	end

end
