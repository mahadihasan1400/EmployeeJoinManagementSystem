<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-md-12 text-center" style="margin-top: 50px">
			<h1 style="color: #3c763d">Job Application Form</h1>
			<hr>
		</div>

		<div class="col-md-8 col-md-offset-2" style="margin-top: 50px">
			<form action="savePersonalInfo" method="post" id="jobForm"
				enctype='multipart/form-data' onsubmit="return validateMyForm();">

				<span
					style="font-size: 30px; font-weight: bold; margin-top: 20px; display: block">General
					Info:</span>
				<hr>
				<div class="form-group">
					<label for="exampleInputName">Name</label> <input type="text"
						name="personName" class="form-control" id="exampleInputName"
						placeholder="Full Name">
				</div>

				<div class="form-group">
					<label for="exampleInputEmail">Email address</label> <input
						type="email" name="personEmail" class="form-control"
						id="exampleInputEmail" placeholder="Email">
				</div>

				<div class="form-group">
					<label for="exampleInputPhnNumber">Phone Number</label> <input
						type="number" name="personPhn" class="form-control"
						id="exampleInputPhnNumber" placeholder="Phone Number">
				</div>

				<div class="form-group">
					<label for="exampleInputPresentAddress">Present Address</label>
					<textarea class="form-control" name="personPresentAdd"
						id="exampleInputPresentAddress"></textarea>
				</div>

				<div class="form-group">
					<label for="exampleInputPermanentAddress">Permanent Address</label>
					<textarea class="form-control" name="personPermanentAdd"
						id="exampleInputPermanentAddress"></textarea>
				</div>

				<div class="form-group">
					<label for="exampleInputFatherName">Father Name</label> <input
						type="text" name="personFatherName" class="form-control"
						id="exampleInputFatherName" placeholder="Father Name">
				</div>

				<div class="form-group">
					<label for="exampleInputMotherName">Mother Name</label> <input
						type="text" name="personMotherName" class="form-control"
						id="exampleInputMotherName" placeholder="Mother Name">
				</div>

				<div class="form-group">
					<label for="exampleInputNidNo">Nid No</label> <input type="number"
						name="personNidNo" class="form-control" id="exampleInputNidNo"
						placeholder="Nid No">
				</div>

				<div class="form-group">
					<label for="exampleInputPassNo">Pass No</label> <input
						type="number" name="personPassNo" class="form-control"
						id="exampleInputPassNo" placeholder="Pass No">
				</div>

				<div class="form-group">
					<label for="exampleInputPassNo">Upload Image</label> <input
						type="file" name="personImage" id="personImage"
						class="form-control" onchange="check()" accept="image/*" /> <span
						id="imageError" style="color: red;"></span>
				</div>


				<span
					style="font-size: 30px; font-weight: bold; margin-top: 20px; display: block">Educational
					Info:</span>
				<hr>

				<div class="form-group">
					<h4 style="margin: 20px 0px; font-weight: bold">SSC:</h4>

					<div class="form-group">
						<label for="exampleInputNameSSC">Degree Name</label> <select
							name="degree_name_ssc" id="exampleInputNameSSC"
							class="form-control">
							<option value="SSC">SSC</option>
							<option value="HSC">HSC</option>
							<option value="BSC">BSC</option>
							<option value="MSC">MS</option>
						</select>

					</div>

				</div>

				<div class="form-group">
					<label for="exampleInputInstituteNameSSC">InstituteName</label> <input
						type="text" name="institute_name_ssc" class="form-control"
						id="exampleInputInstituteNameSSC" placeholder="Institute Name">
				</div>

				<div class="form-group">
					<label for="exampleInputSSCGrade">Grade</label> <input type="text"
						name="ssc_grade" class="form-control" id="exampleInputSSCGrade"
						placeholder="Ex: 5.00/Division">
				</div>

				<div class="form-group">
					<label for="exampleInputSSCpassingYear">Passing Year</label> <input
						type="number" name="ssc_passing_year" class="form-control"
						id="exampleInputSSCPassingYear" placeholder="Ex: 2010/2012">
				</div>


				<div class="form-group">
					<label>District</label> <select name="district_ssc"
						class="form-control">

						<c:forEach var="district" items="${districtList}">
							<option value="${district.id}">${district.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label>Thana</label> <select name="thana_ssc" class="form-control">
						<c:forEach var="thana" items="${thanaList}">
							<option value="${thana.id}">${thana.name}</option>
						</c:forEach>
					</select>
				</div>


				<div class="form-group">
					<label for="exampleInputFileSSC">Upload Supporting Docs for
						SSC</label> <input type="file" name="files_for_SSC"
						id="exampleInputFileSSC" class="form-control" multiple>
				</div>


				<div class="form-group">
					<h4 style="margin: 20px 0px; font-weight: bold">HSC:</h4>

					<div class="form-group">
						<label for="exampleInputNameHSC">Degree Name</label> <select
							name="degree_name_hsc" id="exampleInputNameHSC"
							class="form-control">
							<option value="HSC">HSC</option>
							<option value="SSC">SSC</option>
							<option value="BSC">BSC</option>
							<option value="MSC">MS</option>
						</select>

						<!--
                         <input type="text" name="hsc_name" class="form-control" id="exampleInputNameHSC"
                                value="HSC" readonly-->
					</div>

				</div>

				<div class="form-group">
					<label for="exampleInputInstituteNameHSC">InstituteName</label> <input
						type="text" name="institute_name_hsc" class="form-control"
						id="exampleInputInstituteNameHSC" placeholder="Institute Name">
				</div>

				<div class="form-group">
					<label for="exampleInputHSCGrade">Grade</label> <input type="text"
						name="hsc_grade" class="form-control" id="exampleInputHSCGrade"
						placeholder="Ex: 5.00/Division">
				</div>

				<div class="form-group">
					<label for="exampleInputHSCpassingYear">Passing Year</label> <input
						type="number" name="hsc_passing_year" class="form-control"
						id="exampleInputHSCPassingYear" placeholder="Ex: 2010/2012">
				</div>


				<div class="form-group">
					<label>District</label> <select name="district_hsc"
						class="form-control">

						<c:forEach var="district" items="${districtList}">
							<option value="${district.id}">${district.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label>Thana</label> <select name="thana_hsc" class="form-control">
						<c:forEach var="thana" items="${thanaList}">
							<option value="${thana.id}">${thana.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="exampleInputFileHSC">Upload Supporting Docs for
						HSC</label> <input type="file" name="files_for_HSC"
						id="exampleInputFileHSC" class="form-control" multiple>
				</div>


				<div class="form-group">
					<h4 style="margin: 20px 0px; font-weight: bold">BSC:</h4>

					<div class="form-group">
						<label for="exampleInputNameBSC">Degree Name</label> <select
							name="degree_name_bsc" id="exampleInputNameBSC"
							class="form-control">
							<option value="BSC">BSC</option>
							<option value="SSC">SSC</option>
							<option value="HSC">HSC</option>
							<option value="MSC">MS</option>
						</select>

						<!--  <input type="text" name="bsc_name" class="form-control" id="exampleInputNameBSC"
                                 value="BSC" readonly>-->
					</div>

				</div>

				<div class="form-group">
					<label for="exampleInputInstituteNameBSC">InstituteName</label> <input
						type="text" name="institute_name_bsc" class="form-control"
						id="exampleInputInstituteNameBSC" placeholder="Institute Name">
				</div>

				<div class="form-group">
					<label for="exampleInputBSCGrade">Grade</label> <input type="text"
						name="bsc_grade" class="form-control" id="exampleInputBSCGrade"
						placeholder="Ex: 5.00/Division">
				</div>

				<div class="form-group">
					<label for="exampleInputBSCpassingYear">Passing Year</label> <input
						type="number" name="bsc_passing_year" class="form-control"
						id="exampleInputBSCPassingYear" placeholder="Ex: 2010/2012">
				</div>


				<div class="form-group">
					<label>District</label> <select name="district_bsc"
						class="form-control">

						<c:forEach var="district" items="${districtList}">
							<option value="${district.id}">${district.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label>Thana</label> <select name="thana_bsc" class="form-control">
						<c:forEach var="thana" items="${thanaList}">
							<option value="${thana.id}">${thana.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="exampleInputFileBSC">Upload Supporting Docs for
						BSC</label> <input type="file" name="files_for_BSC"
						id="exampleInputFileBSC" class="form-control" multiple>
				</div>

				<div class="checkbox" style="margin-top: 30px">
					<label> <input type="checkbox" name="check_box_ms"
						id="checkInfo"> MS Information if available
					</label>
				</div>

				<div id="msForm" style="display: none">
					<div class="form-group">
						<h4 style="margin: 20px 0px; font-weight: bold">MS:</h4>

						<div class="form-group">
							<label for="exampleInputNameMSC">Degree Name</label> <select
								name="degree_name_ms" id="exampleInputNameMSC"
								class="form-control">
								<option value="MSC">MS</option>
								<option value="SSC">SSC</option>
								<option value="HSC">HSC</option>
								<option value="BSC">BSC</option>
							</select>

							<!--<input type="text" name="msc_name" class="form-control" id="exampleInputNameMSC"
                                   value=MS readonly>-->
						</div>

					</div>

					<div class="form-group">
						<label for="exampleInputInstituteNameMSC">InstituteName</label> <input
							type="text" name="institute_name_ms" class="form-control"
							id="exampleInputInstituteNameMSC" placeholder="Institute Name">
					</div>

					<div class="form-group">
						<label for="exampleInputMSCGrade">Grade</label> <input type="text"
							name="ms_grade" class="form-control" id="exampleInputMSCGrade"
							placeholder="Ex: 5.00/Division">
					</div>

					<div class="form-group">
						<label for="exampleInputMSCpassingYear">Passing Year</label> <input
							type="number" name="ms_passing_year" class="form-control"
							id="exampleInputMSCPassingYear" placeholder="Ex: 2010/2012">
					</div>


					<div class="form-group">
						<label>District</label> <select name="district_ms"
							class="form-control">

							<c:forEach var="district" items="${districtList}">
								<option value="${district.id}">${district.name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label>Thana</label> <select name="thana_ms" class="form-control">
							<c:forEach var="thana" items="${thanaList}">
								<option value="${thana.id}">${thana.name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="exampleInputFileMSC">Upload Supporting Docs
							for MSC</label> <input type="file" name="files_for_MS"
							id="exampleInputFileMSC" class="form-control" multiple>
					</div>
				</div>

				<div class="form-group">
					<h4 style="margin: 20px 0px">Other Degrees:</h4>

					<div class="form-group">
						<label for="exampleInputOtherDegrees">Degree Names:</label>
						<textarea class="form-control" name="other_degrees"
							id="exampleInputOtherDegrees" placeholder="Ex: Phd,Mphel etc..."></textarea>
					</div>

				</div>

				<span
					style="font-size: 30px; font-weight: bold; margin-top: 20px; display: block">Employment
					Info:</span>
				<hr>


				<div id="boxEmployee"></div>




				<input type="hidden" id="jobCount" name="job_count" />

				<div class="form-group">
					<button id="btnJob" class="btn btn-warning">Add Job
						History</button>
				</div>

				<div class="form-group">

					<c:forEach var="department" items="${departmentList}">



						<input type="checkbox" name="deptName" id="color"
							value="${department.id}">
					${department.name}
					</c:forEach>


				</div>


				<div class="form-group">
					<input type="submit" value="Submit" name="btn" id="btnSubmit"
						class="btn btn-success" />
				</div>

			</form>

		</div>
	</div>
</div>

<script>
	var checkbox = document.getElementById('checkInfo');
	checkbox.addEventListener("change", functionname, false);

	function functionname() {
		var isChecked = checkbox.checked;
		if (isChecked) { //checked
			document.getElementById('msForm').style.display = 'block';
		} else { //unchecked
			document.getElementById('msForm').style.display = 'none';
		}
	}

	var i = 0;

	document.getElementById('btnJob').onclick = function(e) {
		e.preventDefault();
		++i;
		var htmlEmpInfo = '<div id="jobBox'+ i + '"><span style="font-weight: bold; font-size: 30px; margin: 20px 0px; display: block">Job History '
				+ i
				+ '</span>'
				+ '<div class="form-group"><label for="exampleInputCompanyName' + i + '">Company Name</label><input type="text" name="company_name_' + i + '" class="form-control" id="exampleInputCompanyName' + i + '" placeholder="Company Name"></div><div class="form-group"><label for="exampleInputDepartmentName' + i + '">Department Name</label><input type="text" name="department_name_' + i + '" class="form-control" id="exampleInputDepartmentName' + i + '" placeholder="Department Name"></div><div class="form-group"><label for="exampleInputDesignation' + i + '">Designation</label><input type="text" name="designation_' + i + '" class="form-control" id="exampleInputDesignation' + i + '" placeholder="Designation"></div><div class="form-group"><label for="exampleInputYearOfExp' + i + '">Year of Exp</label><input type="number" name="year_of_exp_' + i + '" class="form-control" id="exampleInputYearOfExp' + i + '" placeholder="Ex: 2/3/4"></div><div class="form-group"><label for="exampleInputCompanyAddress' + i + '">Address</label><textarea class="form-control" name="company_address_' + i + '" id="exampleInputCompanyAddress' + i + '"></textarea></div><div class="form-group"><label>District</label> <select name="district_company_' + i + '" class="form-control"> <c:forEach var="district" items="${districtList}"> <option value="${district.id}">${district.name}</option> </c:forEach> </select> </div><div class="form-group"><label>Thana</label><select name="thana_company_' + i + '" class="form-control"> <c:forEach var="thana" items="${thanaList}"> <option value="${thana.id}">${thana.name}</option> </c:forEach> </select></div><div class="form-group"><label for="exampleInputFileCompany' + i + '">Upload Supporting Docs for Job History</label><input type="file" name="files_for_company_' + i + '" id="exampleInputFileCompany' + i + '" class="form-control" multiple></div></div>';
		var node = document.getElementById('boxEmployee');
		node.insertAdjacentHTML('beforeend', htmlEmpInfo);

		document.getElementById('jobCount').value = i;

	};

	// check file extension

	var personImageConfirmation = false;

	function check() {

		var fullPath = document.getElementById('personImage').value;
		var fileSize = document.getElementById("personImage").files[0].size;
		if (fullPath) {
			var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath
					.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
			var filename = fullPath.substring(startIndex);
			if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
				filename = filename.substring(1);
			}

		}

		var info = filename.split(".");
		var type = info[1];

		if (type === 'jpg' || type === 'png' || type === 'jpeg') {

			if (fileSize <= 2097152) {

				personImageConfirmation = true;
				console.log(personImageConfirmation);
				document.getElementById('imageError').innerHTML = "";
				document.getElementById('btnSubmit').disabled = false;

			} else {
				document.getElementById('imageError').innerHTML = "Image size must be less then 2mb!!";
				document.getElementById('btnSubmit').disabled = true;

			}
		} else {
			personImageConfirmation = false;
			document.getElementById('imageError').innerHTML = "please upload a valid image file with type jpg or jpeg or png!!";
			document.getElementById('btnSubmit').disabled = true;

		}

		//console.log(type);

	}

	function validateMyForm() {

		if (personImageConfirmation) {
			return true;
		} else {
			return false;
		}

	}
</script>
