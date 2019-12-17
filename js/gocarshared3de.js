function ajax_do(url) {
	// Does URL begin with http?
	if (url.substring(0, 4) != 'http') {
		url = base_url + url;
	}
	// Create new JS element
	var jsel = document.createElement('SCRIPT');

	jsel.type = 'text/javascript';
	jsel.src = url;
	// Append JS element (therefore executing the 'AJAX' call)
	document.body.appendChild(jsel);
}

var makeMapsAutocomplete = function ($el) {
	if (!$el.length) {
		return;
	}
	var defaultBounds = new google.maps.LatLngBounds(new google.maps.LatLng(50.056669, -10.634766), new google.maps.LatLng(58.670845, 1.450195));
	return $el.map(function () {
		var el = this;
		return new google.maps.places.Autocomplete(el, {
			bounds: defaultBounds,
			types: ["geocode", "establishment"]
		});
	});
};

var reloadOnClose = 0;
$(document).ready(function () {
	// makeMapsAutocomplete($("#strTo, #strFrom"));

	$(".datepicker").datepicker({
		numberOfMonths: [1, 2],
		minDate: new Date(),
		onSelect: function (date, instance) {
			var relatedInputQuery = (" " + instance.input.attr("data-related_input")).replace(/ /g, ".");
			var relatedInput = $("input" + relatedInputQuery);
			relatedInput.datepicker(
				"option",
				"minDate",
				new Date( date.replace(/(\d{2})\/(\d{2})\/(\d{4})/, "$3-$2-$1") )
			);
		},
		showAnim: '',
		dateFormat: 'dd/mm/yy',
		defaultDate: 1,
		nextText: 'Next',
		prevText: 'Previous'
	});

	if (!$('.datepicker').val()) {
		$('.datepicker').datepicker('setDate', +1);
	}

	$("a.registrationPopup").click(function () {
		$.fancybox({'type': 'ajax', 'href': 'yueuser/registration/getform/' + ($(this).attr('data-noemail') == 1 ? '?noemail=1' : '')});
		if (!$(this).attr('data-noemail') && !$(this).attr('data-noreload')) reloadOnClose = 1;
		return false;
	});
});

$.fn.qtip.defaults.position.my = 'top center';
$.fn.qtip.defaults.position.at = 'bottom center';
$.fn.qtip.defaults.show.delay = 0;
$.fn.qtip.defaults.style.classes = 'ui-tooltip-shadow ui-tooltip-light ui-tooltip-rounded';

////////////////// JQUERY UI //////////////////
$(document).ready(function () {

	// http://jqueryui.com/demos/datepicker/


	// Search page Accordion
	/*
	 $("#accordion, .jq-accordion").accordion({header:".accordion-title"});

	 $('table.accordion tbody td.group').not('.login').click(function(){
	 $(this).parent().siblings().toggle();
	 return false;
	 })

	 $('table.accordion tbody tr.group').not('.login').click(function() {
	 $(this).siblings().toggle();
	 return false;
	 })
	 */
	$('table.accordion tr').click(function () {
		$('#c' + $(this).attr('data-tripId')).toggle();
		return false;
	});

	// Tabs
	// $('#tabs, #tabs1').tabs();

	$('#popup-content').dialog({
		autoOpen: false,
		width: 720,
		show: 'blind',
		buttons: {
			"Close": function () {
				$(this).dialog("close");
			}
		}
	});
	$('.popup-link').click(function () {
		$('#popup-content').dialog('open');
		$('#popup-content').dialog({ title: this.title });
		return false;
	});

	$("a.contact-user").fancybox({
		transitionIn: 'elastic',
		transitionOut: 'elastic',
		speedIn: 300,
		speedOut: 300,
		overlayShow: true,
		overlayOpacity: 0.3,
		overlayColor: '#000',
		scrolling: 'auto',
		type: 'ajax',
		centerOnScroll: true,
		padding: 0,
		iframe: {
			preload: false
		}

	}).css("pointer-events", "auto");


	$("a.location-picker-dialog").fancybox({
		'type': 'ajax',
		'onComplete': function () {
			loadFancyMap();
		}
	});

	$('form').submit(function () {
		$(this).find('input[type="submit"]').attr('disabled', 'disabled');
		$(this).find('input[type="image"]').attr('disabled', 'disabled');
	});

	$("a.contact-user-fresh").click(function () {
		trip_id = $(this).attr('data-trip_id');
		action = $(this).attr('data-action');
		$.fancybox({type: 'ajax', href: 'message/dialog?action=' + action + '&trip_id=' + trip_id});
	});

	$("a.booknow").click(function () {
		var button = $(this);
		if (button.hasClass("disabled")) {
			return;
		}
		var trip_id    = $(this).attr('data-trip_id');
		var message_id = (typeof $(this).attr('data-message_id') === 'undefined') ? '' : $(this).attr('data-message_id');
		var hash       = (typeof $(this).attr('data-hash') === 'undefined') ? '' : $(this).attr('data-hash');

		// Repeated journey data
		var seats = [];
		var bookDays = $("select[name=bookday]");
		bookDays.each(function (id, bookday) {
			var day = bookday.getAttribute("data-ui-day");
			var num = bookday.value;

			seats.push({day: day, seats: num});
		});
		var seatsReturn = [];
		var bookDaysReturn = $("select[name=bookday_return]");
		bookDaysReturn.each(function (id, bookday) {
			var day = bookday.getAttribute("data-ui-day");
			var num = bookday.value;

			seatsReturn.push({day: day, seats: num});
		});

		$.post("message/bookNow", { trip_id: trip_id, message_id: message_id, hash: hash, seats: seats, seatsReturn: seatsReturn})
			.done(function () {
				button.addClass("disabled");
				$.fancybox('<p>Thanks for booking the journey – you’ll get confirmation as to whether you have been accepted shortly.</p>', {});
				if (message_id == '' && hash == '') {
					setTimeout(function () {
						window.location.href = "/user/trips";
					}, 2000);
				}
			})
			.fail(function (xhr, error, code) {
				if (xhr.status === 412) {
					alert("You must choose at least one seat.");
				} else {
					alert("Oops. There has been a problem. Please try again later.");
				}
			});
		//$.fancybox({type:'ajax',href:'message/dialogBookNow?trip_id='+trip_id});
	});

	// scrollTo click
	$('.scrollTo').click(function(e) {
		e.preventDefault();

		var $t = $(this),
			elementToScrollTo = $t.data('scrollto');

		$('html, body').animate({
			scrollTop: $(elementToScrollTo).offset().top
		}, 1500);
	});

	$('.notification > .icon-x').click(function(e) {
		$(this).parent().fadeOut();
	});

	$('.sendAnalytics').on('click', function() {
		var category = $(this).data('analyticscategory'),
			action = $(this).data('analyticsaction'),
			label = $(this).data('analyticslabel');

		// check for PayPal if driver creating journey
		if (action == 'driver-create') {
			label = 'no-paypal';
			if ($('#TripForm_money_via_paypal').is(':checked') || (typeof $('input[name="email_paypal"]').val() !== 'undefined' && $('input[name="email_paypal"]').val() != '')) {
				label = 'paypal';
			}
		}

		sendAnalytics(category, action, label);
	});

	bindMessageValidator();

	// Handle css + operator in IE8
	if($('html').hasClass('ie8')) {
		var controls = $('input[type="radio"], input[type="checkbox"]');

		controls.each(function() {
			if($(this).prop('checked')) $(this).next('label').addClass('checked');
		});

		controls.on('change', function(e) {
			if($(this).attr('type') === 'radio')
				$(this).parent().find('label').removeClass('checked');

			$(this).next().toggleClass('checked');
		});
	}

    // check if we are in an iframe (widget access), if we are we hide things
    if (window.location !== window.parent.location) {
        $('.widgetHide').hide();
        $('main.wrap').addClass('wrap-iframe');
    }
});

function hasPhoneNumber(text) {
	// This will test for 5 consecutive digits, while ignoring delimiters.
	var digits = /\d{5}/;
	var delimiters = /[.,:;#\s]+/g;
	return digits.test(text.replace(delimiters, ""));
}

function hasEmail(text) {
	// Instead of using an extremely complicated regular expression I decided to use
	// a very simple one, based on a recommendation from David Celis, a New Relic developer.
	// http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/
	var email = /@/;
	return email.test(text);
}

function bindMessageValidator() {
	var element = $("textarea[name=message], textarea[name=strNotes], textarea[name='TripForm[strNotes]']");
	var warning = $("div#errorNotifier");
	var submit = element.closest("form").find("button[type=submit]");

	/* Sending the email address is temporarily allowed again (GCS-415)
	element.keyup(function() {
		var message = $(this).val();

		if (hasPhoneNumber(message) || hasEmail(message)) {
			warning.show();
			submit.attr("disabled", "disabled");
		} else {
			warning.hide();
			submit.removeAttr("disabled");
		}
	});
	*/
}

function sendAnalytics(category, action, label) {
	if (typeof ga !== 'undefined' && ga != null) {
		ga('send', 'event', category, action, label);
	}
}

function openInlinePopup(text, title) {
	$.post('inlinepopup/', {title: title, text: text}, function (data) {
		$.fancybox({
			content: data,
			padding: 0,
			hideOnOverlayClick: true,
			showCloseButton: true
		});
	});
}


function tripCost(distance) {
	var cost = 0;
	if (distance > 100) {
		cost = 100 * 0.09;
		if (distance > 200) {
			cost += 100 * 0.06;
			cost += (distance - 200) * 0.04;
		} else {
			cost += (distance - 100) * 0.06;
		}
	} else {
		cost = distance * 0.09;
	}

	return Math.round(cost).toFixed(2);
}

var gcs = {
	formFieldToggler: function (fieldSelector, toggleText) {
		toggleText = (
			((typeof toggleText == 'undefined') && toggleText) ||
				$(fieldSelector).val());
		var toggleAction = function (e) {
			if (this.value == e.data.check) {
				this.value = e.data.replacement;
			}
		};
		var settingParams = {
			check: toggleText,
			replacement: ''
		};
		var clearingParams = {
			check: '',
			replacement: toggleText
		};

		$(fieldSelector).click(settingParams, toggleAction);
		$(fieldSelector).keypress(settingParams, toggleAction);
		$(fieldSelector).blur(clearingParams, toggleAction);
	}
};

var isPromise = function(value) {
	if (typeof value.then !== "function") {
		return false;
	}
	var promiseThenSrc = String($.Deferred().then);
	var valueThenSrc = String(value.then);
	return promiseThenSrc === valueThenSrc;
};

// var query = getQueryParams(document.location.search);
// alert(query.foo);
var getQueryParams = function(p) {
	var qs = p || document.location.search;

	qs = qs.split("+").join(" ");

	var params = {}, tokens,
		re = /[?&]?([^=]+)=([^&]*)/g;

	while (tokens = re.exec(qs)) {
		params[decodeURIComponent(tokens[1])]
			= decodeURIComponent(tokens[2]);
	}

	return params;
};
