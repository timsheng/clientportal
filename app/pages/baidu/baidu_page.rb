#encoding: utf-8
class BaiduPage < ClientportalPage
	page_url 'www.baidu.com'
	
	text_field 'keyword', id: 'kw'
	button 'search', id: 'su'

	def search_for kw
		self.keyword = kw
		search_element.click
		turn_to SearchResultPage
	end

end
