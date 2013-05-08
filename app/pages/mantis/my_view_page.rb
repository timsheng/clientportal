#encoding: utf-8

class MyViewPage < ClientportalPage
	include Menu

	page_url "#{$config.host}my_view_page.php"
	
end
