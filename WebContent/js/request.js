/**
 * 	Module
 */

var httpRequest = null;
function getXMLHttpRequest() {
	if( window.ActiveXObject ) {
		// IE의 경우
		try {
			return new ActiveXObject( "Msxml2.XMLHTTP" );
		} catch( e ) {
			try {
				return new ActiveXObject( "Microsoft.XMLHTTP" );
			} catch( ee ) {
				return null;
			}			
		}		
	} else {
		// IE가 아닌 경우
		try {
			return new XMLHttpRequest();
		} catch( e ) {
			return null;
		}
	}	
}

function sendRequest( callback, url, method, params, cors) {
	httpRequest = getXMLHttpRequest();
	
	// callback
	httpRequest.onreadystatechange = callback;
	
	// method
	var httpMethod = method ? method : "GET";
	if( httpMethod != "POST" && httpMethod != "GET" ) {
		httpMethod = "GET";
	}
	
	// params
	var httpParams 
		= ( params == null || params == "" ) ? null : params;
	
	// url	
	var httpUrl = ( httpMethod == "GET" ? url + "?" + httpParams : url );
	
	httpRequest.open( httpMethod, httpUrl, true );
	httpRequest.setRequestHeader(
		"content-type", "application/x-www-form-urlencoded");
	httpRequest.send( httpMethod == "POST" ? httpParams : null );	
}












