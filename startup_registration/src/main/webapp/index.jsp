<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon in Title Section" href="PIT_logo-removebg-preview.png">
<title>Passion IT</title>

<link rel="stylesheet" href="Passionit_Startup.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>


<body >
	<div class="container">
		<%@include file="logo_header.jsp"%>
		<form action="GetAll" class="row rounded-2 px-4 fs-6 bg-light"
			enctype="multipart/form-data" method="post" >
			<div class="row gx-6 m-auto  ">
				<div class="col">
					<div class="p-3 bg-light">
						<div class="form-group">
							<label for="Startup_Name">Startup Name:</label> <input required
								type="text" id="Startup_Name" class="form-control"
								name="startupname"> <span id="startupnameError"
								style="color: red"></span>
						</div>
						<script>
							var STARTUPNAME = "";
							$(document)
									.ready(
											function() {
												$("#Startup_Name")
														.on(
																"blur",
																function() {
																	var startupname = $(
																			"#Startup_Name")
																			.val();
																	$
																			.get(
																					"CheckStartupName",
																					{
																						startupname : startupname
																					},
																					function(
																							data) {
																						if (data === "taken") {
																							STARTUPNAME = "taken";
																							$(
																									'#startupnameError')
																									.html(
																											startupname+" is already taken. Please choose another.");
																							$(
																									"#Startup_Name")
																									.css(
																											"background-color",
																											"rgba(255, 0, 0, 0.1)");
																							$(
																									"#submit")
																									.prop(
																											"disabled",
																											true);
																							$("#submiterror").html("<br>Correct The StartUp Name");
																						} else {
																							STARTUPNAME = "";
																							$(
																									'#startupnameError')
																									.html(
																											"");
																							$(
																									"#Startup_Name")
																									.css(
																											"background-color",
																											"rgba(0, 255, 0, 0.1)");
																							$(
																									"#submit")
																									.prop(
																											"disabled",
																											false);
																							$("#submiterror").html("");
																						}
																					});
																});
											});
						</script>
						<div class="form-group">
							<label for="Student_Name">Student Name:</label> <input
								type="text" id="student_Name" class="form-control"
								name="studentname">


						</div>
						<div class="form-group">
							<label for="College_Name">College Name:</label> <input
								type="text" id="college_Name" class="form-control"
								name="collegename">
						</div>
						<div class="form-group">
							<label for="Email">Email:</label> <input type="email" id="Email"
								name="email" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="Phone">Phone:</label> <input type="text" id="Phone"
								class="form-control" name="phone" required>
						</div>
						<div class="form-group">
							<label for="teamsize">What is your team size for the
								project?</label> <input type="text" id="teamsize"
								style="stroke-opacity: 5px;" class="form-control"
								name="teamsize">
						</div>
						<div class="form-group">
							<label for="college_mentor">Who is College Mentor?</label> <input
								type="text" name="college_mentor" class="form-control"
								id="college_mentor" name="college_mentor">
						</div>

						<div class="form-group align-items-center">
							Enter Team Details ?
							<p style="width: 50%; margin: 0 auto" class="text-center">
								<a
									class=" badge btn btn-info text-wrap add text-decoration-none">&nbsp;&nbsp;Add
									New&nbsp;&nbsp;</a>
							</p>
							<br>
						</div>
						
							<fieldset style="width: 80%; margin: 0 auto;background-color:rgba(255, 192, 203, 0.1)"  class="bd-highlight text-center inp-group border border-black p-3 col col-md-12 p-3 ">
								<legend class="fs-6">Team Member Details:</legend>
							</fieldset>
						
					</div>
				</div>
				<div class="col">
					<div class="p-3 bg-light">
						<div class="form-group">
							<label for="painpoint">What is painpoint/problem you wish
								to solve?</label>
							<textarea class="form-control" id="painpoint" name="painpoint"></textarea>
						</div>
						<div class="form-group">
							<label for="solution">How to Solve?</label>
							<textarea class="form-control" id="solution" name="solution"></textarea>
						</div>
						<div class="form-group">
							<label for="prototype">Have you built any prototype or
								proof of concept?</label>
							<textarea class="form-control" id="prototype"
								name="prototypestatus"></textarea>
						</div>
						<div class="form-group">
							<label for="skills">What skills you wish to acquire?</label>
							<textarea class="form-control" id="skills"
								name="skills_to_acquire"></textarea>
						</div>
						<div class="form-group">
							<label for="hobbies">What are your hobbies?</label>
							<textarea class="form-control" id="hobbies" name="hobbies"
								id="textarea"></textarea>
						</div>
						<div class="form-group">
							<label for="techknow">What technologies do you know?</label>
							<textarea class="form-control" id="techknow"
								name="technology_knowhow"></textarea>
						</div>
						<div class="form-group">
							<label for="file">File Upload: <small>(Pitchdeck
									PPT,PDF or Zip)</small></label><br> <input type="file"
								class="form-control-file" id="file"
								name="fileupload_presentation" onchange="checkSizeF()"
								accept=".ppt,.pptx,.doc,.docx,.zip,.xml,.gif"> <span
								id="FileError" style="color: red"></span>
						</div>


						<script>
							function checkSizeF() {
								var file = document.getElementById("file").files[0];
								if  (file.size< 20000000) {
									$("#file").css("background-color","rgba(0, 255, 0, 0.1)");
								} else {
									alert("File is too large, maximum size is less than 20MB.");
									$("#file").val("");
								}
							}
							$(document).ready(function() {
								  $("#photo").change(function() {
									var validMimeTypes = [
										  "image/jpeg",
										  "image/gif",
										  "image/png",
										  "image/apng",
										  "image/svg+xml",
										  "image/bmp",
										  "image/x-icon",
										  "image/tiff",
										  "image/webp"
										];
									 var fileInput = this.files[0];
									if (validMimeTypes.includes(fileInput.type)) {
										var photo = document.getElementById("photo").files[0];
										if (photo.size < 5000000) {
										$("#photo").css("background-color","rgba(0, 255, 0, 0.1)");
										} else {
											alert("Photo is too large, maximum size is less than 5MB.");
											$("#photo").val("");
									}
									}
								    else {
								      alert("Please select an image file.");
								      $("#photo").val("");
								    }
								  });
							});
						</script>
						<div class="form-group">
							<label for="image">Image Upload: <small>(Team
									Photo)</small></label><br> <input type="file" class="form-control-file"
								id="photo" name="team_photo_upload" onchange="checkSizeP()" >
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				// Dynamic field Creation With Javascript 
				const addbtn = document.querySelector(".add");
				const input = document.querySelector(".inp-group");
				function removeInput() {
					this.parentElement.remove();
				}

				function addinput() {

					const Name = document.createElement("input");
					Name.type = "text";
					Name.className = "form-control inp ";
					Name.name = "name[]";
					Name.placeholder = "Name";

					const Phone = document.createElement("input");
					Phone.className = "form-control inp";
					Phone.type = "text";
					Phone.name = "contact[]";
					Phone.placeholder = "Phone";

					const email = document.createElement("input");
					email.type = "email";
					email.className = "form-control inp";
					email.name = "st_email[]";
					email.placeholder = "Email";
					email.required = true;

					const Role = document.createElement("input");
					Role.type = "text";
					Role.className = "form-control inp";
					Role.name = "role[]";
					Role.placeholder = "Role";

					const btn = document.createElement("a");
					btn.style.cssText = "";
					btn.className = "badge btn btn-danger text-wrap add text-decoration-none m-2 fs-6";
					btn.innerHTML = "&nbsp;&nbsp;Delete&nbsp;&nbsp;";
					btn.addEventListener("click", removeInput);
					
					const newp=document.createElement("p");
					newp.style.cssText="width: 50%; margin: 0 auto"
					newp.className="text-center";
					newp.appendChild(btn);
					

					const in_field = document.createElement("div");
					in_field.className = "";

					input.appendChild(in_field);
					in_field.appendChild(Name);
					in_field.appendChild(Phone);
					in_field.appendChild(email);
					in_field.appendChild(Role);
					in_field.appendChild(btn);
				}

				addbtn.addEventListener("click", addinput);
			
				</script>

			<div style=" margin: 0 auto;" class=" text-center container-sm m-auto">
				<br> <br> <input type="submit" value="Submit" id="submit" 
					
					class="btn btn-outline-success rounded-2 h3" name="submit">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<input type="reset" value="Reset"
					class="btn btn-outline-danger rounded-2 h3">
					<span id="submiterror" style="color:red;"></span>
			</div>
		</form>
	</div>
	
	<script>
		function showLoader() {
			document.querySelector('.loader-container').style.display = 'flex';
			setTimeout(function() {
				document.querySelector('.loader-container').style.display = 'none';
				window.scrollTo(0,document.body.scrollHeight);
			}, 5000);
		}
	</script>
	<br>
	<%@include file="footer.html"%>
</body>
</html>