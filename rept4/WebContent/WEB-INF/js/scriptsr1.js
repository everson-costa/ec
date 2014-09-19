/**EVERSON COSTA
 * 
 */

	(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=608680442496976"; //VERIFICAR ESSA ID (É MINHA APLICÇÃO REPUTEIXON)
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
	
	function getIDfb(){
		FB.getLoginStatus(function(response) {
			  if (response.status === 'connected') {
				  var idfb = response.authResponse.userID;
			    //alert ("id do facebook:" + idfb);
			  }
			});
	}
	
	function checaLogado(){
		FB.getLoginStatus(function(response) {
			  if (response.status === 'connected') {
			    alert("logado ok");
				// the user is logged in and has authenticated your
			    // app, and response.authResponse supplies
			    // the user's ID, a valid access token, a signed
			    // request, and the time the access token 
			    // and signed request each expire
			    var uid = response.authResponse.userID;
			    var accessToken = response.authResponse.accessToken;
			  } else if (response.status === 'not_authorized') {
			    // the user is logged in to Facebook, 
			    // but has not authenticated your app
				// FB.login();
			  } else {
			    // the user isn't logged in to Facebook.
				  FB.login();
				  //location.reload();
			  }
			 });
	}