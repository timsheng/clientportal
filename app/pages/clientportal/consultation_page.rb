class ConsultationPage < ClientportalPage
	page_url "#{$config.host}consultation/project/index"

	link :my_profile, :text => 'My Profile'

	div :project_list_type, :id => 'project-list-type'

	link :recommended_status, :id => 'recommended-status'

	link :requested_status, :id => 'requested-status'

	#link :requested_status_active, :id => 'requested-status',:class => 'active'多属性定位

	link :arranged_status, :id => 'arranged-status'

	link :completed_status, :id => 'completed-status'

	span :recommended_count, :class => 'project-tasks-count'

    table :task_list, :id => 'tasks-list-items'

	cell :project_num, :xpath => '//tr[@class="tasks-list-item"]//td[2]'
	# table :task_num, :xpath => '//table[@id="tasks-list-items"]//tbody//tr[2]'

	div :blank_task_detail, :id => 'blank-task-detail'

	link :request_consultation, :id => 'select-button'

	div :select_confirmation, :id => 'select-confirmation'

	link :new_request, :css => 'div#client-project-sendrequest a'

	div :background, :class => 'modal-backdrop'

	textarea :confirm_notes, :id => 'select-confirm-notes'

	link :confirm_button, :id => 'select-confirm-button'

	link :closeX, :css => 'div.modal-header a'

	link :close, :class => 'btn'

	textarea :comment_message, :id => 'ProjectTaskComment_message' 

	button :submit_comment, :id => 'submit-comment'
    
    def comment_content
    	@browser.elements(:class,'comment-content')
    end
end
