#encoding: utf-8

class ViewAllBugPage < ClientportalPage
	include Menu

	page_url "#{$config.host}view_all_bug_page.php"

	table 'buglist', id: 'buglist'

	def first_row
		self.buglist_element[3]
	end

	def column_name_to_index(column_name)
		{id: 3, category: 7, status: 9, summary: 11}[column_name]
	end

	def summary_column
		column_name_to_index :summary
	end

end
