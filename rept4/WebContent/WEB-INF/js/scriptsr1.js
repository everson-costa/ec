/**EVERSON COSTA
 * 
 */
var idLogado = false;

//FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B
//FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B - FUN. B�sicas B

function corrk(){
	var val = parseFloat(document.getElementById("rk").innerHTML);
		if(val < 1){
			document.getElementById("rk").style.color="#FF0000";
		}else{
			document.getElementById("rk").style.color="#00FF00";		
		}
	}
	
	function inputs(){
		var idf = document.getElementById("idfb").innerHTML;
		document.getElementById("laique").value=idf;
		document.getElementById("deslai").value=idf;
	}

//Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- 
//Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- Fun API FB ---- 

	(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=608680442496976"; //VERIFICAR ESSA ID (� MINHA APLIC��O REPUTEIXON)
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
	
	function getIDfb(){
		FB.getLoginStatus(function(response) {
			  if (response.status === 'connected') {
				  //var idfb = response.authResponse.userID;
				  idLogado = true;
			    //alert ("id do facebook:" + idfb);
			  }else{
				  idLogado = false;
				  document.getElementById("auxidfb").value="";
			  }
			});
	}
	
	function checaLogado(){
		FB.getLoginStatus(function(response) {
			  if (response.status === 'connected') {
			    //alert("logado ok");
				var idfbme = response.authResponse.userID;
				document.getElementById("auxidfb").value=idfbme;
				idlogado = true;
				// the user is logged in and has authenticated your
			    // app, and response.authResponse supplies
			    // the user's ID, a valid access token, a signed
			    // request, and the time the access token 
			    // and signed request each expire
			   // var uid = response.authResponse.userID;
			   // var accessToken = response.authResponse.accessToken;
			  } else if (response.status === 'not_authorized') {
			    // the user is logged in to Facebook, 
			    // but has not authenticated your app
				// FB.login();
			  } else {
			    // the user isn't logged in to Facebook.
				  document.getElementById("auxidfb").value="";
				  idLogado = false;
				  FB.login();
			  }
			
			 }); 
	}
	
	function verIdLogado(){
		getIDfb();
		//var logado = document.getElementById("auxidfb").value;
		 if(idLogado==false){
			 document.getElementById("auxidfb").value="";
			 alert("Voc� ainda n�o entrou no Facebook.");
			 FB.login();
			 return false;
		 }else{
			 atualizaPag();
			 return true;
		 }
	}
	
	function atualizaPag(){
		  FB.Event.subscribe("auth.login", function(response) {
			   window.location.reload();
			});
	}
	
	function sairFb() {    
		FB.logout(function (response) {
		    window.location = "/facebook/logout/";
		    atualizaPag();
		});   }