function selectAll() {
	var lips = document.getElementsByName("lip");
	var selectall = document.getElementById("selectall");
	if (selectall.checked == true) {
		for (i = 0; i < lips.length; i++) {
			lips[i].checked = true;
		}
	} else {
		for (i = 0; i < lips.length; i++) {
			lips[i].checked = false;
		}
	}
}

function selectSingle() {
	var k = 1;
	var lips = document.getElementsByName("lip");
	var selectall = document.getElementById("selectall");
	for (i = 0; i < lips.length; i++) {
		if (lips[i].checked == false)
			k = 0;
	}
	if (k == 0)
		selectall.checked = false;
	else
		selectall.checked = true;
}
