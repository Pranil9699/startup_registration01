<%@page import="org.hibernate.property.access.spi.EnhancedSetterImpl"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="startup_registration.model.IdeationTeam"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="startup_registration.controller.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%
int srno = Integer.parseInt(request.getParameter("srno"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Team Details</title>
<link rel="stylesheet" href="Passionit_Startup.css">
<!--<link rel="stylesheet" href="3.3.7bootstrap.min.css">-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<%@include file="logo_header.jsp"%>
		<form action="updaterecord" class="row rounded-2 px-4 fs-6 bg-light border border-2 border-black"
			method="post">
			<div class="row gx-5 m-auto">
				<div class="col">
					<div class="p-3 bg-light">


						<center>
							<fieldset class="inp-group border p-3 col col-md-9 p-3 border border-2 border-black " style="background-color: rgba(255, 192, 203, 0.1);">
								<legend class="fs-6 ">Team Member Details:</legend>

								<%
								try {
									IdeationTable ideationT = (IdeationTable)session.getAttribute("ideationT");
									List<IdeationTeam> list = (List<IdeationTeam>) session.getAttribute("ideationTT");
									for(IdeationTeam ideationTT:list){
										if(ideationTT.getIdeationTeamId().getTeamId()==srno &&ideationTT.getIdeationTeamId().getIdeanumber()==ideationT.getIdeanumber()){
											%>
											
											<div class="">
									<input type="hidden" name="ideanumber" value="<%=ideationTT.getIdeationTeamId().getIdeanumber()%>" >
									<input type="hidden" name="srno" value="<%=ideationTT.getIdeationTeamId().getTeamId()%>"> <input
										type="text" class="form-control inp" name="name" 
										placeholder="Name" value="<%=ideationTT.getMemberName()%>" maxlength="255">
									<br> <input class="form-control inp" type="text"
										name="contact" placeholder="Phone" maxlength="255"
										value="<%=ideationTT.getMemberPhone()%>"><br> <input maxlength="255"
										required type="email" class="form-control inp" name="st_email"
										placeholder="Email" value="<%=ideationTT.getMemberEmail()%>" >
									<br> <input type="text" class="form-control inp"
										name="role" placeholder="Role"
										value="<%=ideationTT.getMemberRole()%>" maxlength="255"> <br>
								</div>
											
											
											<%}
									}
								%>
								

								<%
								
								} catch (Exception e) {
								  out.println(e);
								  RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
								  dispatcher.forward(request, response);								}
								%>

							</fieldset>
						</center>
					</div>
				</div>

			</div>

			<center class="container-sm">
				<input type="submit" value="Submit"
					class="btn btn-outline-success rounded-2 h3" name="submit">
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
