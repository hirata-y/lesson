function ShowAlert(){
	if(confirm("本当にログアウトしますか")){
		location.href = "../index.html";
	}
}
function login_check(){
	var adress = document.getElementById("login_adress").value;
	var pass = document.getElementById("login_pass").value;
	document.getElementById("login_button").disabled = (adress==="" || pass==="");
}