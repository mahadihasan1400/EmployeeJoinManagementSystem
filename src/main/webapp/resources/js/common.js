/*!
 * 
 * Author: Abu Taleb, Programmer, Bespoke Solution.
 */


/*$(function() {
	$(".datepicker-13").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$(".datepicker-13").datepicker("option", "maxDate", new Date());
	$(".datepicker-13").datepicker("hide");
});


$(function() {
	$(".datepicker-14").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$(".datepicker-14").datepicker("hide");
});


$(function() {
	$(".datepicker-15").datepicker({
		dateFormat : 'dd-mm-yy'
	});
	$(".datepicker-15").datepicker("option", "maxDate", new Date());
	$(".datepicker-15").datepicker("hide");
});

$(function() {
	$(".datepicker-16").datepicker({
		dateFormat : 'dd-mm-yy'
	});
	$(".datepicker-16").datepicker("hide");
});*/

function formSubmitGetPost(path, params, method) {
	method = method || "POST"; // Set method to post by default if not
								// specified.

	// The rest of this code assumes you are not using a library.
	// It can be made less wordy if you use one.
	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", path); 
	form.setAttribute("enctype", "multipart/form-data"); 
	form.setAttribute("id", "talebgulap415");

	for ( var key in params) {
		if (params.hasOwnProperty(key)) {
			var hiddenField = document.createElement("input");
			if(typeof(params[key]) == 'object'){
				var i;
				for (i = 0; i < params[key].length; i++) {
					 hiddenField = document.createElement("input");
				    hiddenField.setAttribute("type", "file");
					hiddenField.setAttribute("name", key);
					hiddenField.setAttribute("value", params[key][i]);
					form.appendChild(hiddenField);
				}
				
			} else {
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", key);
				hiddenField.setAttribute("value", params[key]);
				form.appendChild(hiddenField);
			}
			
			
		}
	}
	document.body.appendChild(form);
	form.submit();
	$("#talebgulap415").remove();
}

function formSubmitAjax(path, cData, method) {
	debugger;
	$.ajax({
		type : method,
		url : path,
		data : JSON.stringify(cData),
		contentType : "application/json",
		success : function(data) {			
			return data;
		},
		error : function(data) {
			return data;
		}

	});
}