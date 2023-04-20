<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="startup_registration.controller.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%
IdeationTable ideationT= (IdeationTable) session.getAttribute("ideationT");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>File Show</title>
<link rel="stylesheet" href="Passionit_Startup.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
</head>
<body>
	<div class="container">
		<%@include file="logo_header.jsp"%>
		<div class=" row rounded-2 px-4 fs-6 bg-light">
			<div class="row gx-5 ">
				<div class="col">
					<div class="p-3 bg-light">
						
						<%
						if (ideationT.getFileupload_presentation().length() >= 1) {
						%>
						<iframe
							src="<%=request.getContextPath()%>/files/<%=ideationT.getFileupload_presentation()%>"
							class="embed-responsive-item border rounded-2" width="500px"
							height="550px"></iframe>
						<%
						} else {
						%>
						<iframe src="https://i.stack.imgur.com/sg5qJ.png"
							class="embed-responsive-item border rounded-2" width="500px"
							height="550px"></iframe>
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
								href="<%=request.getContextPath()%>/files/<%=ideationT.getFileupload_presentation()%>"
								download><i class="fa fa-download"></i> Download</a> <br> <br>
							<br> <br> <br> <br>
							
							<form action="updatefile" class="" enctype="multipart/form-data"
								method="post">
								<input type="hidden" id="ideanumber" class="input"
									name="ideanumber" value="<%=ideationT.getIdeanumber()%>">
								<center>
									<fieldset class="inp-group border p-3 col col-md-12 p-3">
										<label for="file">File Upload: <small>(Pitchdeck
												PPT,PDF or Zip)</small></label><br> <br> <br> <input
											type="file" class="form-control-file fs-7"
											name="fileupload_presentation" id="file" onchange="checkSizeF()" required>
											
									</fieldset>
								</center>
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
</script>
								<br> <br>
								<center class="container-sm">
									<input type="submit" value="Submit" id="submit"
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
	<br>
	<br>
	<%@include file="footer.html"%>
</body>
</html>