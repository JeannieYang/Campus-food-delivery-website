function check(form) {
	if (form.name.value == "") {
		alert("名称不能为空!");
		form.name.focus();
		return false;
	}
	
	if (form.number.value == "") {
		alert("联系方式不能为空!");
		form.number.focus();
		return false;
	}
	
	if (form.dizhi.value == "") {
		alert("具体地址不能为空!");
		form.dizhi.focus();
		return false;
	}
}
