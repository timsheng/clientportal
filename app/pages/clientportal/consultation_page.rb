class ConsultationPage < ClientportalPage
	page_url "#{$config.host}consultation/project/index"

	link :my_profile, :text => 'My Profile'

	div :project_list_type, :id => 'project-list-type'

	link :recommended_status, :id => 'recommended-status'

	link :requested_status, :id => 'requested-status'

	#link :requested_status_active, :id => 'requested-status',:class => 'active'多属性定位

	link :arranged_status, :id => 'arranged-status'

	link :completed_status, :id => 'completed-status'

	div :blank_task_detail, :id => 'blank-task-detail'
end
