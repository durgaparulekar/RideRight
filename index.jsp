<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
<head>
 <h1>
        <img src="Ride-Right-Logo1.png" alt="logo" align="left" style="width:200px;height:100px;"></h1>
	<meta charset="utf-8"><script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,n,t){function r(t){if(!n[t]){var o=n[t]={exports:{}};e[t][0].call(o.exports,function(n){var o=e[t][1][n];return r(o||n)},o,o.exports)}return n[t].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<t.length;o++)r(t[o]);return r}({1:[function(e,n,t){function r(){}function o(e,n,t){return function(){return i(e,[c.now()].concat(u(arguments)),n?null:this,t),n?void 0:this}}var i=e("handle"),a=e(2),u=e(3),f=e("ee").get("tracer"),c=e("loader"),s=NREUM;"undefined"==typeof window.newrelic&&(newrelic=s);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],d="api-",l=d+"ixn-";a(p,function(e,n){s[n]=o(d+n,!0,"api")}),s.addPageAction=o(d+"addPageAction",!0),s.setCurrentRouteName=o(d+"routeName",!0),n.exports=newrelic,s.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(e,n){var t={},r=this,o="function"==typeof n;return i(l+"tracer",[c.now(),e,t],r),function(){if(f.emit((o?"":"no-")+"fn-start",[c.now(),r,o],t),o)try{return n.apply(this,arguments)}finally{f.emit("fn-end",[c.now()],t)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,n){m[n]=o(l+n)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,c.now()])}},{}],2:[function(e,n,t){function r(e,n){var t=[],r="",i=0;for(r in e)o.call(e,r)&&(t[i]=n(r,e[r]),i+=1);return t}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],3:[function(e,n,t){function r(e,n,t){n||(n=0),"undefined"==typeof t&&(t=e?e.length:0);for(var r=-1,o=t-n||0,i=Array(o<0?0:o);++r<o;)i[r]=e[n+r];return i}n.exports=r},{}],4:[function(e,n,t){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(e,n,t){function r(){}function o(e){function n(e){return e&&e instanceof r?e:e?f(e,u,i):i()}function t(t,r,o,i){if(!d.aborted||i){e&&e(t,r,o);for(var a=n(o),u=m(t),f=u.length,c=0;c<f;c++)u[c].apply(a,r);var p=s[y[t]];return p&&p.push([b,t,r,a]),a}}function l(e,n){v[e]=m(e).concat(n)}function m(e){return v[e]||[]}function w(e){return p[e]=p[e]||o(t)}function g(e,n){c(e,function(e,t){n=n||"feature",y[t]=n,n in s||(s[n]=[])})}var v={},y={},b={on:l,emit:t,get:w,listeners:m,context:n,buffer:g,abort:a,aborted:!1};return b}function i(){return new r}function a(){(s.api||s.feature)&&(d.aborted=!0,s=d.backlog={})}var u="nr@context",f=e("gos"),c=e(2),s={},p={},d=n.exports=o();d.backlog=s},{}],gos:[function(e,n,t){function r(e,n,t){if(o.call(e,n))return e[n];var r=t();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(e,n,t){function r(e,n,t,r){o.buffer([e],r),o.emit(e,n,t)}var o=e("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(e,n,t){function r(e){var n=typeof e;return!e||"object"!==n&&"function"!==n?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");n.exports=r},{}],loader:[function(e,n,t){function r(){if(!x++){var e=h.info=NREUM.info,n=d.getElementsByTagName("script")[0];if(setTimeout(s.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&n))return s.abort();c(y,function(n,t){e[n]||(e[n]=t)}),f("mark",["onload",a()+h.offset],null,"api");var t=d.createElement("script");t.src="https://"+e.agent,n.parentNode.insertBefore(t,n)}}function o(){"complete"===d.readyState&&i()}function i(){f("mark",["domContent",a()+h.offset],null,"api")}function a(){return E.exists&&performance.now?Math.round(performance.now()):(u=Math.max((new Date).getTime(),u))-h.offset}var u=(new Date).getTime(),f=e("handle"),c=e(2),s=e("ee"),p=window,d=p.document,l="addEventListener",m="attachEvent",w=p.XMLHttpRequest,g=w&&w.prototype;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:w,REQ:p.Request,EV:p.Event,PR:p.Promise,MO:p.MutationObserver};var v=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1026.min.js"},b=w&&g&&g[l]&&!/CriOS/.test(navigator.userAgent),h=n.exports={offset:u,now:a,origin:v,features:{},xhrWrappable:b};e(1),d[l]?(d[l]("DOMContentLoaded",i,!1),p[l]("load",r,!1)):(d[m]("onreadystatechange",o),p[m]("onload",r)),f("mark",["firstbyte",u],null,"api");var x=0,E=e(4)},{}]},{},["loader"]);</script>
	<meta name="viewport" content="width=device-width">
	

	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
		<link rel="stylesheet" href="css/jquery.qtip.min.css">
	<link rel="stylesheet" href="js/fancybox/jquery.fancybox-1.3.4.css">
	<link rel="stylesheet" href="../fast.fonts.net/cssapi/054d9370-62fe-43d9-977e-f988179d9525.css">
	<link rel="stylesheet" href="css/styled3de.css?1498561919">
	
	
	<script>
		var base_url = 'index.html';
		var loggedin = '';

		// some global config
		window.gocarshare = window.gocarshare || {};
		window.gocarshare.config = window.gocarshare.config || {};
		window.gocarshare.params = window.gocarshare.params || {};

		window.gocarshare.config.facebookAppId = '122762154417533';
		window.gocarshare.config.baseUrl = base_url;

		window.gocarshare.params.isWidget = false;
		if (window.location !== window.parent.location) {
			window.gocarshare.params.isWidget = true;
		}
	</script>

	<script src="../ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.js"></script>
	<script src="../ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="js/fancybox/jquery.easing-1.3.pack.js"></script>
	<script src="js/jquery.elastic.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.qtip.min.js"></script>
	<script src="js/jquery.cookie.min.js"></script>
	<script src="js/ICanHaz.min.js"></script>
	<script src="js/date.js"></script>
	<script src="js/lib/underscore.js"></script>

	<script src="../cdn.optimizely.com/js/6145518379991040.js"></script>

		<script src="http://www.google.com/uds/api?file=uds.js&amp;v=1.0&amp;key=ABQIAAAAsgrf3FNxqxcU3hjdhWl_hhSQouCK-o0XuEpDcJetGYrFuxu3OBQNC1ROZNhDSBX3iIQxVQJONrlYuQ"></script>
	<script src="http://maps.googleapis.com/maps/api/js?libraries=places&amp;sensor=false"></script>
	<script src="js/googled3de.js?1498561919"></script>
	<script src="../ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>

	<script src="js/gocarshared3de.js?1498561919"></script>
	<script src="js/logind3de.js?1498561919"></script>

	<!-- started moving to using requirejs -->
	<script src="js/require.js"></script>
	<script src="js/gocarshare/config.js"></script>

	<script id="mutual_friend" type="text/html">
		<a href="{{link}}">
			<img src="https://graph.facebook.com/{{id}}/picture?type=square"
				 width="32" height="32" alt="{{name}}" title="{{name}}" />
		</a>
	</script>

		<!-- start Mixpanel -->
	<script type="text/javascript">(function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src=("https:"===e.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f);b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");for(g=0;g<i.length;g++)f(c,i[g]);
		b._i.push([a,e,d])};b.__SV=1.2}})(document,window.mixpanel||[]);
		mixpanel.init("2fc77d38476fd991b7b8ad579fbb155d");</script>
	<!-- end Mixpanel -->
	
        
<body class="body avenir home" style="bgcolor: black">

<div id="fb-root"></div>
<script src="js/facebook.js"></script>


<div class="viewport">

	<header class="header cf" role="banner">
		<h1 class="widgetHide"><image.src="Ride-Right-Logo1.png"></a></h1>
		
	<div class="user widgetHide">
		<a href="login.jsp" class="">Sign in</a>
		<a href="joinus.jsp" class="">Join us</a>
	</div>

	
	</header>

		<main class="main" role="main">
	
		

	<div class="intro wrap">

		<div class="intro-headline">
			<p><strong>Journeys are better together</strong></p>
			<p>Save money. Meet new people. <b></b></p>
		</div>

		<div class="search cf tripSearch">
			<form action="login.jsp" method="GET" id="tripSearchForm" data-userloggedin="0"
			data-userverified="0">
				<input name="form" type="hidden" value="tripsearchform"/>
				<div class="search-type">
					<input type="radio" name="type" id="driver" value="driver" checked>
					<label for="driver">I am a driver</label>
					<input type="radio" name="type" id="passenger" value="passenger">
					<label for="passenger">I need a lift</label>
				</div>
				<div class="search-params">
					<div class="search-param">
						<input type="hidden" name="depart_event_id" class="place-event-id" value="">
						<input type="hidden" name="depart_organisation_id" class="place-organisation-id" value="">
						<label class="visuallyhidden" for="strFrom">Driving from</label>
						<input class="addressInput" type="text" autocomplete="off" name="from" id="strFrom" placeholder="Driving from" tabindex="1">
						<i class="icon-location"></i>
					</div>
					<div class="search-param">
						<input type="hidden" name="arrive_event_id" class="place-event-id" value="">
						<input type="hidden" name="arrive_organisation_id" class="place-organisation-id" value="">
						<label class="visuallyhidden" for="strTo">Going to</label>
						<input class="addressInput" type="text" autocomplete="off" name="to" id="strTo" value="" placeholder="Going to" style="" tabindex="2">
						<i class="icon-location"></i>
					</div>
				</div>
				<div class="search-submit">
					<button class="ir driver eventTaCopen" type="submit" id="buttonSearch" tabindex="3">Search</button>
				</div>

				<input type="hidden" name="place_id" value="">
				<input type="hidden" name="date" value="">
				<input type="hidden" name="private_organisation" value="0" >
				<input type="hidden" name="ownership_id" value="" >
							</form>
		</div>
	</div>

<script>

	require(["app/gautocomplete/gautocomplete"], function (gautocomplete) {
		gautocomplete(".tripSearch .addressInput");
	});

	$('#buttonSearch').click(function () {
		var f = $.trim($('#strFrom').val());
		var t = $.trim($('#strTo').val());
		if ((!f||f=='Driving from?'||f=='Travelling from') || (!t||t=='Going to?')) {
			alert('Please enter departure and arrival locations!');
			$('#strFrom').focus();
			return false;
		}

		if ($(this).hasClass('driver')) {
			try {
				__adroll.record_user({"adroll_segments": "http://gocarshare.com/trip/createjourney*"});
			} catch(err) {}
		}

		if ($(this).hasClass('passenger')) {
			try {
				__adroll.record_user({"adroll_segments": "http://gocarshare.com/search?type=passenger*"});
			} catch(err) {}
		}
	});

	$("input[type=radio][name=type]").click(function(){
		var mode = $("input[type=radio][name=type]:checked").val();
		var action = "passenger" == mode ? "search" : "/trip/createjourney";
		$("#tripSearchForm").attr("action", action);
		$("#tripSearchForm button[type=submit]").removeClass("passenger").removeClass("driver");
		$("#tripSearchForm button[type=submit]").addClass(mode);
		if (mode == 'passenger') {
			$('#strFrom').attr('placeholder', 'Travelling from');
		} else {
			$('#strFrom').attr('placeholder', 'Driving from');
		}
	});
</script>

<div class="entries">
	<div class="wrap cf">

		<section class="drivers col cf journeys-listing" id="yw0">
	<div class="entries-heading cf">
		<h2 class="pull-left entries-title">Looking for a ride?</h2>
		<!--<a href="#" class="pull-right button button-style1 scrollTo" data-scrollto=".tripSearch">Request a seat <i class="icon-navigateright"></i></a>-->
	</div>
	<div class="entryList">
									<a href="carshare/49693/travel-from-Zutphen-to-Amsterdam-on-23-12-2017.html" class="entry">
											<img src="https://graph.facebook.com/1961798277377363/picture?type=normal" alt="Zora" class="entry-avatar">
										<span class="entry-description">
													<strong>Priya</strong>
							is 						driving from <em rel="tooltip" title="Dadar">Dadar</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em>
					</span>
					<span class="entry-date">
						23rd December					</span>
											<span class="entry-price">
							Â£6						</span>
									</a>
							<a href="carshare/49691/travel-from-Cornwall-to-L%20Fest-on-13-07-2018.html" class="entry">
											<img src="https://graph.facebook.com/10155398382674317/picture?type=normal" alt="Frankie" class="entry-avatar">
										<span class="entry-description">
													<strong>Raj</strong>
							is 						driving from <em rel="tooltip" title="Marine Lines">Marine Lines</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em>
					</span>
					<span class="entry-date">
						Fr					</span>
											<span class="entry-price">
							Â£20						</span>
									</a>
							<a href="carshare/49689/travel-from-Northolt-to-Birmingham-on-04-12-2017.html" class="entry">
											<img src="https://graph.facebook.com/10156260346014415/picture?type=normal" alt="Asif" class="entry-avatar">
										<span class="entry-description">
													<strong>Asif</strong>
							is 						driving from <em rel="tooltip" title="Borivali">Borivali</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em>
					</span>
					<span class="entry-date">
						4th December					</span>
											<span class="entry-price">
							Â£10						</span>
									</a>
							<a href="carshare/49688/travel-from-Durham-to-Cambridge-on-23-12-2017.html" class="entry">
											<img src="https://graph.facebook.com/10102245843643743/picture?type=normal" alt="Hugh" class="entry-avatar">
										<span class="entry-description">
													<strong>Neville</strong>
							is 						driving from <em rel="tooltip" title="Nariman Point">Nariman Point</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em>
					</span>
					<span class="entry-date">
						23rd December					</span>
											<span class="entry-price">
							Â£16						</span>
									</a>
							<a href="carshare/49687/travel-from-Durham-to-Clevedon-on-20-12-2017.html" class="entry">
											<img src="https://graph.facebook.com/10159753573065717/picture?type=normal" alt="Heather" class="entry-avatar">
										<span class="entry-description">
													<strong>Navdeep</strong>
							is 						driving from <em rel="tooltip" title="Sion">Sion</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em>
					</s
					<span class="entry-date">
						20th December					</span>
											<span class="entry-price">
							Â£19						</span>
									</a>
						<script type="text/javascript">
				$(".journeys-listing [rel=tooltip]").qtip({position: {my: 'bottom center', at: 'top center'}});
			</script>
				<input type="hidden" id="listingOffset" value="0"/>
	</div>
	<a href="#" class="button-alt see-next">More</a>

<script>
	var seeMoreTrips = function (evt) {
		var offset   = parseInt($('#listingOffset').val(), 10);
		var locality = ($('.journeys-listing').attr('rel') || '');

		$('.journeys-listing .entryList').load(
			'livefeed/load .journeys-listing .entryList', {
				type        : 'TripsListing',
				count       : evt.data.count,
				offset      : (offset + evt.data.count),
				locality    : locality,
				header      : $('.journeys-listing .entries-heading h2').text()
			}, function() {
				$(".journeys-listing [rel=tooltip]").qtip({
					position: {
						my: 'bottom center',
						at: 'top center'
					}
				});
			}
		);
	};

	$('.journeys-listing .see-prev').on('click', function(e) {
		e.preventDefault();

		var evt = {
			data: {
				count: -5			}
		};

		seeMoreTrips(evt);
	});

	$('.journeys-listing .see-next').on('click', function(e) {
		e.preventDefault();

		var evt = {
			data: {
				count: 5			}
		};

		seeMoreTrips(evt);
	});
</script>
</section>
		 <section class="passengers col cf requests-listing" id="yw1">
	<div class="entries-heading cf">
		<h2 class="pull-left entries-title">Got a spare seat?</h2>
		<!--<a href="#" class="pull-right button button-style2 scrollTo" data-scrollto=".tripSearch">Rent your seats <i class="icon-navigateright"></i></a>-->
	</div>
	<div class="entryList">
										<a href="carsharerequest/24252/needs-a-lift-from-Longford-to-London-on-25-12-2017.html" class="entry">
						<img src="https://graph.facebook.com/10155305044739685/picture?type=normal" alt="Mark" class="entry-avatar">
						<span class="entry-description"><strong>Zeus</strong> needs a lift from <em rel="tooltip" title="Prabhadevi">Prabhadevi</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em></span>
						<span class="entry-date">
							25th December						</span>
												<span class="entry-price">
							Â£4						</span>
											</a>
												<a href="carsharerequest/24250/needs-a-lift-from-Thorne-to-Leeds-on-04-12-2017.html" class="entry">
						<img src="https://graph.facebook.com/10213052511901490/picture?type=normal" alt="Seraphina" class="entry-avatar">
						<span class="entry-description"><strong>Sneha</strong> needs a lift from <em rel="tooltip" title="Worli">Worli</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em></span>
						<span class="entry-date">
							4th December						</span>
												<span class="entry-price">
							Â£3						</span>
											</a>
												<a href="carsharerequest/24249/needs-a-lift-from-Thetford-to-King%27s%20Lynn-on-04-12-2017.html" class="entry">
						<img src="https://graph.facebook.com/10210748408449837/picture?type=normal" alt="Julie" class="entry-avatar">
						<span class="entry-description"><strong>Julie</strong> needs a lift from <em rel="tooltip" title="Mahim"></em> Mahim <em rel="tooltip" title="Jai Hind College">Jai Hind College</em></span>
						<span class="entry-date">
							4th December						</span>
												<span class="entry-price">
							Â£3						</span>
											</a>
												<a href="carsharerequest/24248/needs-a-lift-from-Leicester-to-Castle%20Donington-on-16-12-2017.html" class="entry">
						<img src="https://graph.facebook.com/1867489776902339/picture?type=normal" alt="Victoria" class="entry-avatar">
						<span class="entry-description"><strong>Rashmi</strong> needs a lift from <em rel="tooltip" title="Grant Road">Grant Road</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em></span>
						<span class="entry-date">
							16th December						</span>
												<span class="entry-price">
							Â£2						</span>
											</a>
												<a href="carsharerequest/24247/needs-a-lift-from-Cardiff-to-Kent-on-09-12-2017.html" class="entry">
						<img src="https://graph.facebook.com/10101375694151927/picture?type=normal" alt="Louis" class="entry-avatar">
						<span class="entry-description"><strong>Rahul</strong> needs a lift from <em rel="tooltip" title="Bandra">Bandra</em> to <em rel="tooltip" title="Jai Hind College">Jai Hind College</em></span>
						<span class="entry-date">
							9th December						</span>
												<span class="entry-price">
							Â£25						</span>
											</a>
										<script type="text/javascript">
				$(".requests-listing [rel=tooltip]").qtip({position: {my: 'bottom center', at: 'top center'}});
			</script>
				<input type="hidden" id="listingOffsetRequest" value="0"/>
	</div>
	<a href="#" class="button-alt see-next">More</a>

<script>
	var seeMoreRequests = function (evt) {
		var offset   = parseInt($('#listingOffsetRequest').val(), 10);
		var locality = ($('.requests-listing').attr('rel') || '');

		$('.requests-listing .entryList').load(
			'livefeed/load .requests-listing .entryList', {
				type        : 'RequestsListing',
				count       : evt.data.count,
				offset      : (offset + evt.data.count),
				locality    : locality,
				header      : $('.requests-listing .entries-heading h2').text()
			}, function() {
				$(".requests-listing [rel=tooltip]").qtip({
					position: {
						my: 'bottom center',
						at: 'top center'
					}
				});
			}
		);
	};

	$('.requests-listing .see-prev').on('click', function(e) {
		e.preventDefault();

		var evt = {
			data: {
				count: -5			}
		};

		seeMoreRequests(evt);
	});

	$('.requests-listing .see-next').on('click', function(e) {
		e.preventDefault();

		var evt = {
			data: {
				count: 5			}
		};

		seeMoreRequests(evt);
	});

</script>
</section>
	</div>
</div>


	</main>

		<aside class="aside widgetHide" role="complementary">
		<div class="wrap cf">

			<div class="col featureList">
				<ul>
					<li><i class="icon-buildings"></i> Share a lift back up to <a href="university.html"><b>uni</b></a></li>
	<!-- 				<li><i class="icon-pin"></i> Check out the <a href=""><b>popular destinations</b></a></li> -->
					<li><i class="icon-music"></i> Hitting any <a href="festival.html"><b>festivals</b></a> this year?</li>
					<li><i class="icon-pin"></i> Check out our <a href="sport.html"><b>sports events</b></a></li>
				</ul>
				<p class="faded">Lots of <a href="bristoluni.html">Bristol</a> journeys at the moment</p>
			</div>

			<div class="col featureList" style="text-align: center; padding-top: 95px">
				<a href="https://itunes.apple.com/us/app/gocarshare/id451042630?mt=8"><img src="images/buttons/AppStore.png"></a>
			</div>

			</div>
	</aside>

	<aside class="aside featured widgetHide" role="complementary">
		<div class="wrap">
			<h3>As featured on</h3>
			<a href="http://www.bbc.co.uk/news/business-23963516" title="BBC" class="ir bbc">BBC</a>
			<a href="http://www.guardian.co.uk/media/pda/2010/aug/23/digital-media-startups" title="TheGuardian" class="ir tg">TheGuardian</a>
			<a href="http://www.telegraph.co.uk/earth/greenertransport/8488197/The-car-share-champion.html" title="The Telegraph" class="ir tt">The Telegraph</a>
			<a href="http://techcitynews.com/2013/09/03/elevator-pitch-gocarshare-startup-of-the-week/" title="Tech City News" class="ir dm">Tech City News</a>
			<a href="http://cars.uk.msn.com/news/articles.aspx?cp-documentid=154417672" title="MSN" class="ir msn">MSN</a>
		</div>
	</aside>
	
</div>

<footer class="footer widgetHide" role="contentinfo">
	<div class="wrap">

		<nav class="nav" role="navigation">
			<a href="index.html" class="pull-left ir">Home</a>
			<a href="http://blog.gocarshare.com/">Our Blog</a>
			<a href="page/about.html">About us</a>
			<a href="page/going-green.html">Going Green</a>
			<a href="page/faq.html">Questions?</a>
			<a href="page/contact.html">Contact us</a>
			<!--<a href="/trip/createjourney" class="pull-right button button-style1">Rent your seats <i class="icon-navigateright"></i></a>-->
		</nav>

		<div class="cr text-center cf">
			<p><a href="page/privacy.html">Privacy Policy</a> & <a href="page/terms.html">Terms & Conditions</a></p>
			                                <p><small>Thanks to <a href="http://www.flickr.com/photos/goingslo/9017360551/in/gallery-userbraindamage-72157636144586704/" target="_blank">Linda Tanner on Flickr</a> for the photo in our header! <a href="#"></a></small></p>
                                		</div>

	</div>
</footer>

	<script>
		// not in widget
		if (window.location === window.parent.location) {
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-12516410-1']);
						_gaq.push(['_trackPageview']);
						(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();

			var GoSquared={};
			GoSquared.acct = "GSN-348887-H";
			(function(w){
				function gs(){
					w._gstc_lt=+(new Date); var d=document;
					var g = d.createElement("script"); g.async = true; g.src = "../d1l6p2sc9645hc.cloudfront.net/tracker.js";
					var s = d.getElementsByTagName("script")[0]; s.parentNode.insertBefore(g, s);
				}
				w.addEventListener?w.addEventListener("load",gs,false):w.attachEvent("onload",gs);
			})(window);

			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
				(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
				m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','../www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-12516410-1', 'gocarshare.com');

            // Send userId with page track if user is logged in
            
			ga('send', 'pageview');
		}
	</script>

	<!-- begin olark code -->
	<script data-cfasync="false" type='text/javascript'>
		// not in widget
		if (window.location === window.parent.location) {
			/*<![CDATA[*/window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){
			f[z]=function(){
			(a.s=a.s||[]).push(arguments)};var a=f[z]._={
			},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){
			f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={
			0:+new Date};a.P=function(u){
			a.p[u]=new Date-a.p[0]};function s(){
			a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){
			hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){
			return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){
			b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{
			b.contentWindow[g].open()}catch(w){
			c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{
			var t=b.contentWindow[g];t.write(p());t.close()}catch(x){
			b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({
			loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
			/* custom configuration goes here (www.olark.com/documentation) */
			olark.identify('2442-540-10-8578');/*]]>*/
		}
	</script><noscript><a href="https://www.olark.com/site/2442-540-10-8578/contact" title="Contact us" target="_blank">Questions? Feedback?</a> powered by <a href="http://www.olark.com/?welcome" title="Olark live chat software">Olark live chat software</a></noscript>
	<!-- end olark code -->

	<!-- begin SmartPixel code -->
	<script type="text/javascript">
		adroll_adv_id = "T74IQ2KWRBCL7C22IOQR6U";
		adroll_pix_id = "KBL3KMX4VNFMPAXBMJUOBO";
		(function () {
			var oldonload = window.onload;
			window.onload = function(){
			__adroll_loaded=true;
			var scr = document.createElement("script");
			var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
			scr.setAttribute('async', 'true');
			scr.type = "text/javascript";
			scr.src = host + "/j/roundtrip.js";
			((document.getElementsByTagName('head') || [null])[0] ||
			document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
			if(oldonload){oldonload()}};
		}());
	</script>
	<!-- end SmartPixel code -->


<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","licenseKey":"5caa605027","applicationID":"48663520","transactionName":"bgNXNkNTWkVTUUIIXldJdAFFW1tYHWFfFVR6CVsWQ11YWldAGQhfXQNN","queueTime":0,"applicationTime":1795,"atts":"QkRUQAtJSUs=","errorBeacon":"bam.nr-data.net","agent":""}</script></body>

<!-- Mirrored from gocarshare.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 04 Dec 2017 10:29:27 GMT -->
</html>
