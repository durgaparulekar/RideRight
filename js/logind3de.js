function hideAll() {
	$('#signupLoginPopupOverlay').removeClass('active');
	$('body').removeClass('active-overlay');
}

if ("undefined" == typeof(afterLogin)) {
	var afterLogin = function () {
		if ($('#signupLoginPopupOverlay').data('autoreload') == 1) {
			window.location.reload(true);
		} else {
			if (typeof loggedIn !== 'undefined' && isPromise(loggedIn)) {
				// resolve the deffered object
				loggedIn.resolve(true);
			}
		}
	}
}

$(document).ready(function () {
	$('.loginPopupButton').click(function (e) {
		e.preventDefault();
		$('#signupLoginPopupOverlay').addClass('active').children('div').css('display', 'none');
		$('#signIn').css('display', 'block');
		$('body').addClass('active-overlay');
	});

	$('.signupPopupButton').click(function (e) {
		e.preventDefault();
		$('#signupLoginPopupOverlay').addClass('active').children('div').css('display', 'none');
		$('#signUp').css('display', 'block');
		$('body').addClass('active-overlay');
	});

	$('#signupLoginPopupOverlay').click(function (e) {
		var targetId = $(e.target).attr('id');

		if (typeof targetId !== 'undefined' && targetId == 'signupLoginPopupOverlay') {
			hideAll();
		}
	});

	$(".fb-connect-signup").click(function (e) {
		e.preventDefault();
		fblogin();
	});

	$("#fb-connect-login").click(function (e) {
		e.preventDefault();
		fblogin();
	});

	$("#email-login").click(function (e) {
		e.preventDefault();
		$("#email-login").hide();
		$('#registration-form').slideDown();
	});

	$("#not-on-facebook").click(function (e) {
		e.preventDefault();
		$('#facebook-emphasis').css('display', 'block');
		$('#signUp').css('display', 'none');
	});

	// if signupToken present, automatically open email signup
	if (typeof getQueryParams === 'function' && typeof getQueryParams().signupToken !== 'undefined') {
		// are we on a page where facebook emphasis - email registration is available
		if ($('#facebook-emphasis').length > 0) {
			$('#signupLoginPopupOverlay').addClass('active').children('div').css('display', 'none');
			$('#facebook-emphasis').css('display', 'block');
		}
	}

	$('#login-form').submit(function (event) {
		event.preventDefault();
		formData = new Object();
		$('#login-form [name]').each(function () {
			formData[$(this).attr('name')] = $(this).val();
		});
		$.post('yueuser/login/ajax/', formData, function (data) {
			if (data == 1) {
				if ("function" == typeof(checkMember)) {
					checkMember(afterLogin);
				} else {
					afterLogin();
				}
			}
			else {
				$('#errorNotifier').show();
				$('.login-button').removeAttr('disabled');
			}
		});
	});

	$("input.matchPassword").change(function(){
		var password1 = document.getElementById("RegistrationForm_password");
		var password2 = document.getElementById("RegistrationForm_verifyPassword");

		if (password1.value != password2.value) {
			password2.setCustomValidity("Passwords must match.");
		} else {
			password2.setCustomValidity("");
		}
	});

	$('#registration-form').submit(function (event) {
		event.preventDefault();
		var formData = new Object();
		$('#registration-form [name]').each(function () {
			formData[$(this).attr('name')] = $(this).val();
		});
		formData['optin'] = ($('#boolOptInYes:checked').val() ? 1 : 2);
		$.post('yueuser/registration/saveuserajax/', formData, function (data) {
			if (data == 1) {
				if ("function" == typeof(checkMember)) {
					checkMember(afterLogin);
				} else {
					afterLogin();
				}
			} else {
				$('#errorNotifierReg').show();
				$('#errorNotifierReg > div').html(data);
				$('.login-button').removeAttr('disabled');
			}
		});
	});

	$("form[name=verify-email]").submit(function (event) {
		event.preventDefault();
		var $form = $(this);
		if ("" == $form.find("input[name=email]").val() ) {
			return false;
		}
		$.post( $form.attr("action"), $form.serialize() )
		.done(function (response) {
			var $popup = $("#signupLoginPopupOverlay");
			$popup.find("div#verify").hide();
			switch (response) {
				case "ok":
					$popup.find("div.success").show();
					break;
				case "error" :
					$popup.find("div.error").show();
					break;
				default:
					location.reload();
					//hideAll();
					break;
			}
		});
	});

	$('.tooltip-facebook').qtip({
		content: {
			text: "We use Facebook as it helps keep GoCarShare an open and safe community."
		}
	});
	$('.tooltip-phonenumber').qtip({
		content: {
			text: "We'll contact you by phone to do a few security checks to keep the community safe. If you'd rather we didn't, you can always access the site via Facebook."
		}
	});
});
