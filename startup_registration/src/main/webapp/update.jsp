
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="startup_registration.controller.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%
IdeationTable ideationT =(IdeationTable)session.getAttribute("ideationT");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Form Show</title>
<link rel="stylesheet" href="Passionit_Startup.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="logo_header.jsp"%>
		<form action="updatewala" class="row rounded-2 px-4 fs-6 bg-light"
			method="post">
			<div class="row gx-5 m-auto">
				
				<div class="col">
					<div class="p-3 bg-light">
						<div class="form-group">
							<label for="Startup_Name">Startup Name:</label>
							 <input required type="text" id="Startup_Name"
								class="form-control" name="startupname" value="<%=ideationT.getStartupname()%>"
								 maxlength="255">
								<span id="startupnameError" style="color:red;"></span>
								
						</div>
						<script>
					    $(document).ready(function() {
					        $("#Startup_Name").on("blur", function() {
					            var startupname = $("#Startup_Name").val();
					            var ideanumber = $("#ideanumber").val();
					            console.log(ideanumber);
					            $.get("CheckStartupName_without_own", {startupname: startupname,ideanumber: ideanumber}, function(data) {
					            	 if(data === "taken") {
					            		    $('#startupnameError').html(startupname+" name is already taken. Please choose another.");
					            		    $("#Startup_Name").css("background-color", "rgba(255, 0, 0, 0.1)");
					            		    $("#submit").prop("disabled", true);
					            		} else {
					            		    $('#startupnameError').html("");
					            		    $("#Startup_Name").css("background-color", "rgba(0, 255, 0, 0.1)");
					            		    $("#submit").prop("disabled", false);
					            		}
					            });
					        });
					    });
					</script>
						<div class="form-group">
							<label for="Student_Name">Student Name:</label> <input
								type="text" id="student_Name" class="form-control"
								name="studentname" value="<%=ideationT.getStudentname()%>" maxlength="255">
						</div>
						<div class="form-group">
							<label for="College_Name">College Name:</label> <input
								type="text" id="college_Name" class="form-control"
								name="collegename" value="<%=ideationT.getCollegename()%>" maxlength="255">
						</div>
						<div class="form-group">
							<label for="Email">Email:</label> <input type="email" id="Email"
								name="email" class="form-control" value="<%=ideationT.getEmail()%>" required maxlength="255">
						</div>
						<div class="form-group">
							<label for="Phone">Phone:</label> <input type="text" id="Phone"
								class="form-control" name="phone" value="<%=ideationT.getPhone()%>" required maxlength="255">
						</div>
						<div class="form-group">
							<label for="teamsize">What is your team size for the
								project?</label> <input type="text" id="teamsize"
								style="stroke-opacity: 5px;" class="form-control"
								name="teamsize" value="<%=ideationT.getTeamsize()%>" maxlength="255">
						</div>
						<div class="form-group">
							<label for="college_mentor">Who is College Mentor?</label> <input type="text" name="college_mentor"
								 class="form-control" id="college_mentor" value="<%=ideationT.getCollege_mentor()%>" maxlength="255" 
								name="college_mentor">
						</div>

					</div>
				</div>

				<div class="col">
					<div class="p-3 bg-light">
						<div class="form-group">
							<label for="painpoint">What is painpoint/problem you wish
								to solve?</label>
							<textarea class="form-control" id="painpoint" name="painpoint" maxlength="255"><%=ideationT.getPainpoint()%></textarea>
						</div>
						<div class="form-group">
							<label for="solution">How to Solve?</label>
							<textarea class="form-control" id="solution" name="solution" maxlength="255"><%=ideationT.getSolution()%></textarea>
						</div>
						<div class="form-group">
							<label for="prototype">Have you built any prototype or
								proof of concept?</label>
							<textarea class="form-control" id="prototype"
								name="prototypestatus" maxlength="255"><%=ideationT.getPrototypestatus()%></textarea>
						</div>
						<div class="form-group">
							<label for="skills">What skills you wish to acquire?</label>
							<textarea class="form-control" id="skills" maxlength="255"
								name="skills_to_acquire"><%=ideationT.getSkills_to_acquire()%></textarea>
						</div>
						<div class="form-group">
							<label for="hobbies">What are your hobbies?</label>
							<textarea class="form-control" id="hobbies" name="hobbies" maxlength="255"
								id="textarea"><%=ideationT.getHobbies()%></textarea>
						</div>
						<div class="form-group">
							<label for="techknow">What technologies do you know?</label>
							<textarea class="form-control" id="techknow"
								name="technology_knowhow" maxlength="255"><%=ideationT.getTechnology_knowhow()%></textarea>
						</div>
						<input type="hidden" name="fileupload_presentation" value="<%=ideationT.getFileupload_presentation()%>" maxlength="255">
						<input type="hidden" name="team_photo_upload" value="<%=ideationT.getTeam_photo_upload()%>">
					</div>
					
				</div>
			</div>
			<center class="container-sm">
				<input type="submit" value="Submit"
					class="btn btn-outline-success rounded-2 h3" id="submit" name="submit">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="Reset"
					class="btn btn-outline-danger rounded-2 h3">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a
					class="btn btn-outline-secondary rounded-2 h3 text-decoration-none"
					href='display.jsp'>&nbsp;&nbsp;Back&nbsp;&nbsp;</a>
			</center>
		</form>
	</div>

	<br>
	<br>
	<%@include file="footer.html"%>
</body>
</html>
