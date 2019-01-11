function isCorrect() {
	var password = document.getElementsByName("password")[0];
	var repassword = document.getElementsByName("repassword")[0];
	if (password.value == repassword.value) {
		return true;
	} else {
		alert("密码不一致，请重新输入！");
		password.value = "";
		repassword.value = "";
		password.focus();
		return false;
	}
}

