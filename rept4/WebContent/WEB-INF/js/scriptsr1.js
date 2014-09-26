/**EVERSON COSTA
 * 
 */
var idLogado = false;

//FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B
//FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B - FUN. Básicas B

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
        js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=608680442496976"; //VERIFICAR ESSA ID (É MINHA APLICÇÃO REPUTEIXON)
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
				 document.getElementById("btlogin").disabled = true;
				 document.getElementById("btlogout").disabled = false;
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
				  document.getElementById("btlogin").disabled = false;
				  document.getElementById("btlogout").disabled = true;
				  document.getElementById("auxidfb").value="";
				  idLogado = false;
				  loginFB();
				  //FB.login();
			  }
			 });
	}
	
	function verIdLogado(){
		getIDfb();
		//var logado = document.getElementById("auxidfb").value;
		 if(idLogado==false){
			 document.getElementById("auxidfb").value="";
			 alert("Você ainda não entrou no Facebook.");
			 //FB.login();
			 loginFB();
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
	
	function sairFB() { 
		FB.logout(function(response) {
			  // user is now logged out
			window.location.reload();
			//atualizaPag();
	});
	}
	
	function loginFB(){
		FB.login(function(response) {
			   if (response.authResponse) {
			     console.log('Bem Vindo!  Fetching your information.... ');
			     FB.api('/me', function(response) {
			       console.log('Good to see you, ' + response.name + '.');
			       window.location.reload();	
			     });
			     
			   } else {
			     console.log('User cancelled login or did not fully authorize.');
			   }
			 });
		//atualizaPag();
	}