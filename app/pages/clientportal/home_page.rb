#encoding: utf-8
class HomePage < ClientportalPage
	page_url "#{$config.host}"

	link 'login', href: '/index.php/user/login'
end
