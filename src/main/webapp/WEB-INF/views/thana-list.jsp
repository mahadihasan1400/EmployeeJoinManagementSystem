<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 100px">
			<a href="addThana" class="btn btn-success"
				style="margin-bottom: 20px">Add Thana</a>

			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon">Search</span> <input type="text"
						name="search_text" id="search_text"
						placeholder="Search by Thana Name" class="form-control" />
				</div>
			</div>

			<div id="allThana">
				<table class="table table-bordered">
					<tr>
						<th>District Name</th>
						<th>Thana Name</th>
						<th>Action</th>
					</tr>
					<c:forEach var="tempThana" items="${thanas}">

						<c:url var="updateLink" value="/showFormForUpdateThanas">
							<c:param name="thanaId" value="${tempThana.id}" />
						</c:url>

						<c:url var="deleteLink" value="/deleteThana">
							<c:param name="thanaId" value="${tempThana.id}" />
						</c:url>

						<tr>
							<td>${tempThana.district.name}</td>
							<td>${tempThana.name}</td>
							<td><a href="${updateLink}">Update</a> || <a
								href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete this Thanas?'))) return false">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="result"></div>


		</div>
	</div>
</div>



<script>
	$(document).ready(function() {

		function fetchThanaData(query) {
			$.ajax({
				url : "${pageContext.request.contextPath}" + "/thana/search",
				method : 'POST',
				data : {
					query : query
				},
				dataType : 'json',
				success : function(data) {

					$('#result').html();

				}
			})

		}

		$('#search_text').keyup(function() {
			var search = $.trim($(this).val());

			if (search.length > 0) {
				$('#allThana').hide();

				fetchThanaData(search)
				
				console.log(search);
				

			} else {
				$('#allThana').show();
				$('#result').html('');
				
				console.log(search);
			}

		});
	});
</script>











