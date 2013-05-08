#encoding: utf-8
class GooglePage < ClientportalPage
	page_url 'www.google.com.hk'
	
	text_field 'keyword', name: 'q'
	button 'search', name: 'btnK'

	def search_for kw
		self.keyword = kw
		self.keyword_element.send_keys :return
		# example show you how to use wait_until_present
		@browser.table(id: 'nav').wait_until_present
		turn_to GoogleSearchResultPage
	end

end
