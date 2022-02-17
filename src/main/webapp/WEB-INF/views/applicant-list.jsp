<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3" style="margin-top: 100px">

			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Address</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Action</th>
					<th>Selected Candidate</th>
				</tr>
				<c:forEach var="tempcandidateInfos" items="${candidateInfos}"
					varStatus="tr">
					<tr class="row_no_${tr.count}">
						<td>${tempcandidateInfos.id}</td>
						<td>${tempcandidateInfos.name}</td>
						<td>${tempcandidateInfos.presentAdd}</td>
						<td>${tempcandidateInfos.email}</td>
						<td>${tempcandidateInfos.phn}</td>
						<td><a href="viewCandidateInfo?id=${tempcandidateInfos.id}"><i
								class="fas fa-eye" aria-hidden="true" title="View"></i></a></td>

						<td><input type="checkbox" name="checkBoxValue_${tr.count}"
							value="${tempcandidateInfos.id}" onclick="getValue(this)" /></td>
					</tr>
				</c:forEach>
			</table>
			<form action="${pageContext.request.contextPath}/printSelectedCandidate" method="post">
				<input type="hidden" name="checkedValue" id="checkedValue" /> <input
					type="submit" class="btn btn-success" value="Print Documents" />

			</form>

		</div>
	</div>
</div>






<script>
	var arrayOfCheckedValue = [];

	function getValue(i) {
		
		
		

		//var splitCheckBoxName = i.name.split("_");

		if (i.checked) {
			arrayOfCheckedValue.push(i.value)

		} else {		
			arrayOfCheckedValue.splice(arrayOfCheckedValue.indexOf(i.value), 1)
						
		}
		
		

		document.getElementById("checkedValue").value = arrayOfCheckedValue;
	}
</script>







