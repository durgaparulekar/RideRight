var map;
var imgUniqueId = 0;
var tempMarker;
var markerIDs = [];

/*
load() variables
c_str = country
zoom = bool has zoom
mypop = has automatic popup on load
cid = country id
zid = id of thing zooming to
*/

function loadmap(mypop, cid, zid) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("adminmap"));
    if(zid>0){
      map.addControl(new GSmallMapControl());
    }else{
      map.addControl(new GLargeMapControl());
      map.addControl(new GScaleControl());
      map.addControl(new GOverviewMapControl());
    }

    map.addControl(new GMapTypeControl());
    //map.enableScrollWheelZoom();
    map.setCenter(new GLatLng(51.533522879549786,-0.1263427734375), 10);
  }

  //(51.533522879549786, -0.1263427734375)

}
function mapSearch(objFrm){
  strtxt = document.getElementById('strSearch').value;
  if(strtxt != ''){
    strtxt = strtxt + ', UK';
    usePointFromPostcode(strtxt);
  }
}

function load(c_str, zoom, mypop, cid, zid) {
  if (GBrowserIsCompatible()) {
  map = new GMap2(document.getElementById("map"));
  if(zid>0){
    map.addControl(new GSmallMapControl());
  }else{
    map.addControl(new GLargeMapControl());
    map.addControl(new GScaleControl());
    map.addControl(new GOverviewMapControl());
  }

  map.addControl(new GMapTypeControl());
  //map.enableScrollWheelZoom();
  //map.disableScrollWheelZoom();


  //var browserVer=navigator.appVersion;
  //alert(browserVer);
  if (map) {
    //2.213749&y=46.227638
    map.setCenter(new GLatLng(46.227638, 2.213749), 5);

    if(zid == 0){
      map.setMapType(G_HYBRID_MAP);
      usePointFromPostcode(c_str, zoom, searchzoom);
    }else{
      map.setMapType(G_NORMAL_MAP);
    }
      try{
        //alert('drawing');
        setTimeout('drawMarkers(' + cid + ', 0, 0, "", ' + zid + ')', 1000);
      }catch(err){
        //alert(err.description);
      }

    if(mypop > 0){
      //alert(mypop);
      setTimeout('popup(' + mypop + ')',3000);

    }

  }
  }
}

function getRandomPoint() {
  var lat = 48.25 + (Math.random() - 0.5)*14.5;
  var lng = 11.00 + (Math.random() - 0.5)*36.0;
  return new GLatLng(Math.round(lat*10)/10, Math.round(lng*10)/10);
}

function fn_search(){
  var strSearch = document.getElementById("strSearch").value;
  usePointFromPostcode(strSearch, searchzoom);
}

function searchzoom(point, zoom){
  //alert('zoom');
  //if(querySt('id') != null){
    map.setCenter(point, zoom);

  //}
}


function LocationSearch(zoom_level){
  objFrm = document.SearchForm;
  strCountry = objFrm.NewCountry.value;
  if(strCountry == 'United Kingdom'){
    strCountry = 'UK';
  }

  if(strCountry == 'San Marino, Europe'){
    strCountry = 'San Marino';
  }

  srchStr = strCountry; // + ', Europe';
  //zoom_level = 5;

  if(objFrm.NewRegion.value != '' && objFrm.NewRegion.value != 'Select'){
    srchStr = objFrm.NewRegion.value + ', ' + srchStr;
    zoom_level = zoom_level+5;
  }

  if(objFrm.NewSearch.value != '' && objFrm.NewSearch.value != 'Location'){
    srchStr = objFrm.NewSearch.value + ', ' + srchStr;
    zoom_level = 16;
  }

  //alert(srchStr);
  usePointFromPostcode(srchStr, zoom_level, searchzoom);
  return false;
}

function addIncident()  {

   if (!map) {
    window.location = "/index.php";
    return;
  }
  //map.clearOverlays();

  if (tempMarker!=undefined){
      map.removeOverlay(tempMarker);
  }


  var tmpicon = new GIcon();
    tmpicon.image = "images/P_and_O_Ferries_flag_place.png";
    tmpicon.shadow = "images/P_and_O_Ferries_flag_place_shadow.png";
    tmpicon.iconSize = new GSize(57.0, 48.0);
    tmpicon.shadowSize = new GSize(57.0, 48.0);
    tmpicon.iconAnchor = new GPoint(22.0, 48.0);
    tmpicon.infoWindowAnchor = new GPoint(22.0, 10.0);

  tempMarker = new GMarker(map.getCenter(), {draggable:true, icon:tmpicon});

  GEvent.addListener(tempMarker, 'click', function() {
    tempMarker.openInfoWindowHtml(markerPopupHTML);
  });
  GEvent.addListener(tempMarker, 'drag', function() {
    tempMarker.openInfoWindowHtml(markerPopupHTML);
  });

  //map.addOverlay(tempMarker);
  //tempMarker.openInfoWindowHtml(markerPopupHTML);
  setTimeout('map.addOverlay(tempMarker)', 100);
  setTimeout('tempMarker.openInfoWindowHtml(markerPopupHTML)', 100);

}

function submitIncident(){
  var coordY = tempMarker.getPoint().lat();
    var coordX = tempMarker.getPoint().lng();
  cid = document.getElementById('NewCountry').value;
  rid = document.getElementById('NewRegion').options[document.getElementById('NewRegion').selectedIndex].value;
  title = document.getElementById('NewSearch').value;
  if(title == 'Location'){
    title = '';
  }
  //alert('x=' + coordX);
  //alert('y=' + coordY);
  window.location = '/post_form.php?x=' + coordX + '&y=' + coordY + '&c=' + cid + '&r=' + rid + '&title=' + title;
  return;
}

function drawMarkers(cid, cat, rid, stext, pid){
  if (!map) {
    alert('Error !');
    return;
  }
  //map.setMapType(G_HYBRID_MAP);
  //alert('this is where the markers would be drawn');
  obj = getHTTPObject();
  var url = 'includes/xmlhttp.php';
  url += '?cmd=listposts' + '&cid=' + cid + '&cat=' + cat + '&rid=' + rid + '&stext=' + stext + '&id=' + pid;

  if(obj){


  obj.onreadystatechange = function() {
    if (obj.readyState == 4)  {
      //stuff to make it work

      var xmldoc = obj.responseXML;
      var db_nodes = xmldoc.getElementsByTagName('db_record');
      var n_records = db_nodes.length;
      var p_x, p_y, p_html, p_marker_html;
      var noItems = GetXMLValue(xmldoc.getElementsByTagName('all_items'));
      map.clearOverlays();
      //var mgr = new GMarkerManager(map);
      //clear div
      if(document.getElementById('recent-posts-content') != null){
        document.getElementById('recent-posts-content').innerHTML = '';
        if(n_records == 0){
          document.getElementById('recent-posts-content').innerHTML = '<p class="recent-posts-link">Sorry there were no posts found, please try again.</p>';
        }
      }

      //alert('record='+n_records);
      var batch = [];
      for (i=0; i < n_records; i++) {
        p_x = GetXMLValue(db_nodes[i].getElementsByTagName('p_x'));
        p_y = GetXMLValue(db_nodes[i].getElementsByTagName('p_y'));
        p_html = GetXMLValue(db_nodes[i].getElementsByTagName('p_html'));
        p_marker_html = GetXMLValue(db_nodes[i].getElementsByTagName('p_marker_html'));
        id = GetXMLValue(db_nodes[i].getElementsByTagName('p_id'));
        cat_Category = GetXMLValue(db_nodes[i].getElementsByTagName('cat_Category'));
        if(document.getElementById('recent-posts-content') != null){
          document.getElementById('recent-posts-content').innerHTML += p_html;
        }
        point = new GLatLng(p_y, p_x);
        if(pid > 0){
          var marker = createMarker(point,p_marker_html, cat_Category)
        }else{
          var marker = createMarker(point,p_marker_html, cat_Category)
        }

        //if(i == 0){
        //  alert('|' + cat_Category + '|');
        //}

        //batch.push(marker);
        //alert('markerid=' + id);
        map.addOverlay(marker);
        markerIDs[id] = marker;
      }
      //mgr.addMarkers(batch, 4, 17);
      //mgr.refresh();
      //alert(mgr.getMarkerCount(4));
      if(pid > 0){
        //alert(p_y+'='+p_x)
        map.setCenter(new GLatLng(p_y, p_x), 15);
        //map.setMapType(G_NORMAL_MAP);
        //ViewIncident(pid, p_x, p_y);
      }

    }
   }
  obj.open('GET', url, true);
  obj.send(null);

  }
}


function createMarker(point,html, cat_Category) {
  //alert(cat_Category);
  switch(cat_Category){
    case 'Search To':
      var icon = createIcon('search_to.png');
      break;
    case 'Search From':
      icon = createIcon('search_from.png');
      break;
    case 'Nearby To':
      icon = createIcon('nearby_to.png');
      break;
    case 'Nearby From':
      icon = createIcon('nearby_from.png');
      break;
    case 'Other':
    default :
      icon = createIcon('other.png');
      break;
  }
  var marker = new GMarker(point, icon);
  if(html != ''){
    GEvent.addListener(marker, "click", function() {
      marker.openInfoWindowHtml(html);
    });
  }
  return marker;
}

function createMarkerDynamicInfo(point, callback, cat_Category) {
  //alert(cat_Category);
  switch(cat_Category){
    case 'Search To':
      var icon = createIcon('search_to.png');
      break;
    case 'Search From':
      icon = createIcon('search_from.png');
      break;
    case 'Nearby To':
      icon = createIcon('nearby_to.png');
      break;
    case 'Nearby From':
      icon = createIcon('nearby_from.png');
      break;
    case 'Other':
    default :
      icon = createIcon('other.png');
      break;
  }
  var marker = new GMarker(point, icon);
  GEvent.addListener(marker, "click", function() {
    //marker.openInfoWindowHtml('');
    callback(marker);
  });
  return marker;
}

function ViewIncident(id, x, y)  {
  //map.closeInfoWindow();
  map.setCenter(new GLatLng(y,x));
  //map.setMapType(G_HYBRID_MAP);
  //force open of popup
  //alert(markerIDs[id]);
    //settimeout('GEvent.trigger(' + markerIDs[id] + ', "click")', 500);

  GEvent.trigger(markerIDs[id], "click");
}

function createIcon(strFile){
  var po_icon = new GIcon();
  po_icon.image = "images/map-icons/" + strFile;
  po_icon.shadow = "images/map-icons/shadow.png";
  po_icon.iconSize = new GSize(23.0, 32.0);
  po_icon.shadowSize = new GSize(46.0, 38.0);
  po_icon.iconAnchor = new GPoint(12.0, 32.0);
  po_icon.infoWindowAnchor = new GPoint(12.0, 32.0);
  return po_icon;
}

// JavaScript Document
var map;
var localSearch = new GlocalSearch();
var tempMarker;

//function loadmap(mypop, cid, zid) {
function loadmap(mypop, cid, zid) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("adminmap"));
    if(zid>0){
      map.addControl(new GSmallMapControl());
    }else{
      map.addControl(new GLargeMapControl());
      map.addControl(new GScaleControl());
      map.addControl(new GOverviewMapControl());
    }

    map.addControl(new GMapTypeControl());
    //map.enableScrollWheelZoom();
    map.setCenter(new GLatLng(51.533522879549786,-0.1263427734375), 10);
  }

  //(51.533522879549786, -0.1263427734375)

}

function adminSearch(objFrm){
  strtxt = document.getElementById('strSearch').value;
  strtxt = strtxt + ', UK';
  usePointFromPostcode(strtxt);
}

function usePointFromPostcode(postcode) {
  localSearch.setCenterPoint(map);
  //localSearch.setAddressLookupMode(ADDRESS_LOOKUP_DISABLED);
  localSearch.setSearchCompleteCallback(null,
  function() {
    document.getElementById('search-results').innerHTML = '<h2>Search Results:<h2>';
    if (localSearch.results[0]) {
    var resultLat = localSearch.results[0].lat;
    var resultLng = localSearch.results[0].lng;
    var point = new GLatLng(resultLat,resultLng);
    //map.setCenter(point, 10);
    for (x in localSearch.results){
      alertStr = 'title=' +localSearch.results[0].title + '\r\n address=' +localSearch.results[0].streetAddress + '\r\n city=' + localSearch.results[0].city + '\r\n region=' + localSearch.results[0].region + '\r\n country=' + localSearch.results[0].country;
      //alert(alertStr);
      document.getElementById('search-results').innerHTML +=  '<li><a class="blue" href="javascript:searchzoom(' + localSearch.results[x].lat +', ' + localSearch.results[x].lng + ')">' + localSearch.results[x].title + ', ' + localSearch.results[x].streetAddress +  ', ' + localSearch.results[x].city + ', '  + localSearch.results[x].region + ', ' +  localSearch.results[x].country +'</a></li>'
    }
    map.setCenter(point, 15);
    place_marker('From');
    }else{
    alert("Location not found");
    }
  });

  localSearch.execute(postcode);
}

function searchzoom(lat, lng, id){
  var point = new GLatLng(lat,lng);
  map.setCenter(point, 15);
  //GEvent.trigger(markerIDs[id], "click");
  place_marker('From');
}

function place_marker(strToFrom){
  if (map) {
    markerPopupHTML = "<div class='drag-me'><p>Drag me</p><p>Then click Save</p></div>";

    if (tempMarker!=undefined){
        map.removeOverlay(tempMarker);
    }

    tempMarker = new GMarker(map.getCenter(), {draggable:true});

    GEvent.addListener(tempMarker, 'click', function() {
      tempMarker.openInfoWindowHtml(markerPopupHTML);
    });
    GEvent.addListener(tempMarker, 'dragstart', function() {
      tempMarker.closeInfoWindow();
    });
    /*
    GEvent.addListener(tempMarker, 'dragend', function() {
      tempMarker.openInfoWindowHtml(markerPopupHTML);
    });
    */

    setTimeout('map.addOverlay(tempMarker)', 100);
    setTimeout('tempMarker.openInfoWindowHtml(markerPopupHTML)', 100);
  }
}

function geocode(input, callback) {
  var result = { status: 200 };
  var geocoder = new GClientGeocoder();
  geocoder.getLocations(input, function(response) {
    if (response.Status.code != "200") {
      result.status = 400;
      callback(result);
    }

    try {
      result.address = response.Placemark[0].address;
      if (response.Placemark[0].hasOwnProperty('AddressDetails')
        && response.Placemark[0].AddressDetails.hasOwnProperty('Country')
        && response.Placemark[0].AddressDetails.Country.hasOwnProperty('AdministrativeArea')
        && response.Placemark[0].AddressDetails.Country.AdministrativeArea.hasOwnProperty('SubAdministrativeArea')
        && response.Placemark[0].AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.hasOwnProperty('Locality')) {
        result.locality = response.Placemark[0].AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.LocalityName;
      } else {
        result.locality = address;
      }
      result.lat = response.Placemark[0].Point.coordinates[0];
      result.lng = response.Placemark[0].Point.coordinates[1]

      callback(result);
    } catch (e) {
      result.status = 401;
      callback(result);
    }
  });
}

/* new code for googleMaps V3 */
// passing just data, no references to objects!
function getMarkerIcon(type){
	if(type=='search_to') icon = 'search_to.png';
	else if(type=='search_from') icon = 'search_from.png';
	else if(type=='nearby_to') icon = 'nearby_to.png';
	else if(type=='nearby_from') icon = 'nearby_from.png';
	else icon = 'other.png';
	return [new google.maps.MarkerImage('images/map-icons/'+icon,new google.maps.Size(23,32),new google.maps.Point(0,0),new google.maps.Point(12,32)),new google.maps.MarkerImage('images/map-icons/shadow.png',new google.maps.Size(46,38),new google.maps.Point(0,0),new google.maps.Point(12,32))];
	}