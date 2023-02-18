<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
int ideanumber = (Integer) session.getAttribute("ideanumber");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="Passionit_Startup.css">
<!--<link rel="stylesheet" href="3.3.7bootstrap.min.css">-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	
	<div class="container" >
		<%@include file="logo_header.jsp"%>
		<form action="Team" class="row rounded-2 px-4 fs-4 bg-light"
			enctype="multipart/form-data" method="post" style="background-color:rgba(255, 255, 0, 0.1)">
			<div class="row gx-5 m-auto col-md-12">
				<div class="col">
					<div class="p-3 bg-light">
					<input type="hidden" name="ideanumber" value="<%=ideanumber%>">
						<center>
						<div class="form-group fs-5">
							<lable>Enter Team Details ?&nbsp;&nbsp;&nbsp; </lable><a
								class="badge btn btn-info text-wrap add text-decoration-none rounded-8">&nbsp;&nbsp;Add
								New&nbsp;&nbsp;</a>
								<br><br>
						</div>
						</center>
						<center>
							<fieldset style="width: 50%; margin: 0 auto;background-color:rgba(255, 192, 203, 0.1)" class="inp-group border p-3 col col-md-9 p-3 ">
								<legend class="fs-6 ">Team Member Details:</legend>
							</fieldset>
						</center>
					</div>
				</div>
			</div>
			<script>
				// Dynamic field Creation With Javascript 
				const addbtn = document.querySelector(".add");
				window.onload = function() {
					  addbtn.click();
					}

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
					btn.style.cssText = "width: 30%; margin:5px auto 5px; ";
					btn.className = "badge btn btn-danger text-wrap add text-decoration-none rounded-8";
					btn.innerHTML = "Delete";
					btn.addEventListener("click", removeInput);

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
			<center class="container-sm">
				<input type="submit" value="Submit" class="btn btn-outline-success rounded-2 h3"
					name="submit">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="Reset" class="btn btn-outline-danger rounded-2 h3">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="btn btn-outline-secondary rounded-2 h3 text-decoration-none"
								href='display.jsp'>&nbsp;&nbsp;Back&nbsp;&nbsp;</a>
			</center>
		</form>
	</div>

<br><br>
<%@include file="footer.html"%>
</body>
</html>