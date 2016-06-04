// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery
//= require notify.min
//= require_tree .
//= require_self
//= require bootstrap

if (typeof jQuery !== 'undefined') {
	(function($) {
		setTimeout(function(){
			$("#login .inner .cssform p").addClass("form-group");
			$("#login .inner .cssform input[type='text']").addClass("form-control");
			$("#login .inner .cssform input[type='password']").addClass("form-control");
			$("#remember_me_holder").hide();
			$('#login #submit').addClass("btn btn-primary");
		}, 150);
	})(jQuery);
}
