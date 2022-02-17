<div class="footer">
	<div class="footer-inner">
		<div class="footer-content">

			<span class="bigger-120"> <span class="blue bolder">Ju
					- EJMS.</span> &copy; <script> document.write(new Date().getFullYear()); </script>
			</span> &nbsp; &nbsp; <span> Design &amp; Developed By : <span
				class="bigger-120"> <a href="javascript:void(0)"
					style="text-decoration: none; font-style: italic;"> Munirol
						Islam. </a>
			</span>
			</span>
		</div>
	</div>
</div>
<!-- basic scripts -->
<!--[if !IE]> -->
<%-- <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-2.1.4.min.js"></script> --%>
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/resource/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script
	src="${pageContext.request.contextPath}/resource/assets/js/bootstrap.min.js"></script>
<!-- ace scripts -->
<script
	src="${pageContext.request.contextPath}/resource/assets/js/ace-elements.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/assets/js/ace.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resource/js/additional-methods.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/jquery.validate.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resource/js/sweetalert.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resource/js/resizeImage.js"></script>

<script type="text/javascript">
function archiveFunction(url, msg) {
	event.preventDefault(); // prevent form submit
	swal({
		  title: "Are you sure?",
		  text: msg,
		  icon: "warning",
		  buttons: ["No", "Yes"],	
		  closeOnClickOutside : false,
		  dangerMode: true,
		}).then((willDelete) => {
		  if (willDelete) {
		  
		    window.location.href = url;
		  } 
		});
	}
</script>