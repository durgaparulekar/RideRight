window.fbAsyncInit = function () {
	FB.init({
		appId: gocarshare.config.facebookAppId,
		channelUrl: gocarshare.config.baseUrl + '/lib/facebook/channel.php',
		cookie: true,
    version: 'v2.8',
		xfbml: true
	});
//	FB.Event.subscribe('auth.login', function (response) {
//		if (/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
//			if (response.authResponse) {
//				winloc = window.location.href;
//				window.location.href = winloc + (winloc.search('&') > 0 ? '&' : '?') + 'signed_request=' + response.authResponse.signedRequest;
//			}
//		} else {
//			window.location.reload(true);
//		}
//	});
	FB.Event.subscribe('auth.logout', function (response) {
		window.location.reload();
	});

	if ($('[data-role="mutual-friends-v2"]').size() > 0) {
		FB.getLoginStatus(function (res) {
			if (res.status === 'connected') {
				$('[data-role="mutual-friends-v2"]').each(function (index) {
					var obj = $(this);
					if (res.authResponse.userID != obj.attr('data-fid')) {
						picSize = (obj.attr('data-picsize') ? obj.attr('data-picsize') : 25);
						FB.api('/me/mutualfriends/' + obj.attr('data-fid') + '?auth_token=' + res.authResponse.accessToken, function (response) {
							if (response.data.length > 0) {
								var friendArray = [];
								$(response.data).each(function (i) {
									friendArray[i] = '<a target="_blank" href="https://www.facebook.com/' + this.id + '" title="' + this.name + '"><img width="' + picSize + '" src="https://graph.facebook.com/' + this.id + '/picture?type=square" alt="' + this.name + '" /></a>';
								});
								obj.find('.friendCount').html(response.data.length);
								obj.find('.friendList').html(friendArray.join(' '));
								obj.show();
							}
						});
					}
				});
			}
		});
	}

	if (FB.getUserID()) {

		$('[data-role="mutual-friends"]').each(function () {
			var element = $(this);
			var amount = element.data('amount');
			var target_uid = element.data('fid');
			var source_uid = FB.getUserID();

			if (target_uid != source_uid) {
				FB.api({
					method: 'friends.getMutualFriends',
					target_uid: target_uid,
					source_uid: source_uid
				}, function (response) {
					if (response.length > 0) {
						element.fadeIn();
						//if limiting number of friends to show, pick some at random
						if (!_.isUndefined(amount)) {
							response = _.sortBy(response, function (num) {
								return Math.random();
							});
							response.length = amount;
						}
						//load them all up
						_.each(response, function (id) {
							FB.api('/' + id, {
								fields: ['id', 'name', 'link']
							}, function (person) {
								element.find('[data-role="list"]').append(ich.mutual_friend(person));
							});
						});
					}
				});
			}
		});
	}
};

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

var fblogin = function () {
    if (window.gocarshare.params.isWidget) {
        window.open("/site/fblogin", "Facebook login", "width=650, height=450, scrollbars=yes");
    } else {
        FB.login(function (response) {
            if (response.authResponse) {
                if ("function" == typeof(checkMember)) {
                    checkMember(afterLogin);
                } else {
                    afterLogin();
                }
            }
        }, {
            scope: "email, user_likes"
        });
    }
};

$(".login-fb-button").on("click", function (event) {
	fblogin();
	return false;
});
$(".fb-logout").on("click", function (event) {
	FB.logout();
	event.preventDefault();
	return false;
});

// load the actual facebook js
(function (d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/all.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
