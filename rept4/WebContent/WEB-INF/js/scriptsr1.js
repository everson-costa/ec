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