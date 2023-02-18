<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="startup_registration.controller.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%
int ideanumber = (Integer) session.getAttribute("ideanumber");
IdeationTable ideationT= (IdeationTable) session.getAttribute("ideationT");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Photo Show</title>
<link rel="stylesheet" href="Passionit_Startup.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	<div class="container">
		<%@include file="logo_header.jsp"%>
		<div class=" row rounded-2 px-4 fs-6 bg-light">
			<div class="row gx-5 bg-light">
				<div class="col">
					<div class="p-3 bg-light">
						
						<%
						if (ideationT.getTeam_photo_upload().length() >= 1) {
						%>
						<img
							src="<%=request.getContextPath()%>/images/<%=ideationT.getTeam_photo_upload()%>"
							alt="No Image" class="embed-responsive-item border rounded-2 "
							style="width: 500px; height:550px;">
						<%
						} else {
						%>

						<img
							src="https://th.bing.com/th/id/OIP.AC9frN1qFnn-I2JCycN8fwHaEK?w=288&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"
							alt="No Image" class="embed-responsive-item border rounded-2"
							style="width: 500px; height: 550px;">
						<%
						}
						%>
					</div>
				</div>

				<div class="col">
					<div class="p-3 bg-light">
						<br> <br> <br>
						<center class="container-sm">
							<br> <a class="btn btn-primary rounded-2"
								href="<%=request.getContextPath()%>/images/<%=ideationT.getTeam_photo_upload()%>"
								download><i class="fa fa-download"></i> Download</a> <br> <br>
							<br> <br> <br>
							<form action="updatephoto" class="" enctype="multipart/form-data"
								method="post">
								<input type="hidden" id="ideanumber" class="input"
									name="ideanumber" value="<%=ideationT.getIdeanumber()%>">
								<center>
									<fieldset class="inp-group border p-3 col col-md-12 p-3 ">
										<label for="image">Image Upload: <small>(Team
												Photo)</small></label><br> <br> <br> <input type="file"
											class="form-control-file fs-7" id="photo"
											name="team_photo_upload" onchange="checkSizeP()"
											required>
									</fieldset>
								</center>
<script>
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

								<br> <br>
								<center class="container-sm">
									<input type="submit" value="Submit"  id="submit"
										class="btn btn-outline-success rounded-2 h3" name="submit">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									<input type="reset" value="Reset"
										class="btn btn-outline-danger rounded-2 h3">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a
										class="btn btn-outline-secondary rounded-2 h3 text-decoration-none"
										href='display.jsp'>Back</a>
								</center>
							</form>
							</center>
					</div>
				</div>
			</div>
		</div>

	</div>
<%@include file="footer.html"%>
</body>
</html>