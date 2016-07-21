/**
 * 	
 */

function Request( callback, url, method, params ) {
	this.callback = callback;
	this.url = url;
	this.params = params;
	this.method = method;
	this.httpRequest = null;
};
Request.prototype = {
	getXMLHttpRequest : function() {
		if( window.ActiveXObject ) {
			try {
				return new ActiveXObject( "Msxml2.XMLHTTP" );
			} catch( e ) {
				try {
					return new ActiveXObject( "Microsoft.XMLHTTP" );
				} catch( ex ) {
					return null;
				}
			}			
		} else {
			try {
				return new XMLHttpRequest();
			} catch( e ) {
				return null;
			}			
		}		
	},
	sendRequest : function() {
		this.httpRequest = this.getXMLHttpRequest();
		
		this.httpRequest.onreadystatechange = this.callback;
								
		var httpMethod = this.method ? this.method : "GET";
		if( httpMethod != "POST" && httpMethod != "GET" ) {
			httpMethod = "GET";
		}
		
		var httpParams = ( this.params == null || this.params == "" ) ? "" : this.params; 
		
		var httpUrl = ( httpMethod == "GET" ) ? this.url + "?" + httpParams : this.url;
		
		this.httpRequest.open( httpMethod, httpUrl, true );
		this.httpRequest.setRequestHeader(
			"content-type", "application/x-www-form-urlencoded" );
		this.httpRequest.send( httpMethod == "POST" ? httpParams : null );
		
	}
};











