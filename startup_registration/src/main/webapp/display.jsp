<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="false"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="startup_registration.controller.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Show</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="Passionit_Startup.css">-->
<link rel="stylesheet" href="Passionit_Startup.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.test {
	width: 100px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.test:hover {
	overflow: visible;
	white-space: normal;
	height: auto;
	word-wrap: break-word;
	white-space: pre-wrap;
}

.visibility-toggle {
	visibility: hidden;
}

#mydiv {
	background-color: #ddd;
}
</style>
</head>
<body class="bg-light">
	<div class="container">
		<%@include file="logo_header.jsp"%>

		<%
		try {
			IdeationTable ideationT = (IdeationTable) session.getAttribute("ideationT");
			List<IdeationTeam> list = (List<IdeationTeam>) session.getAttribute("ideationTT");
			try {
		%>

		<div
			class="row rounded-2 px-4 fs-6 bg-light border border-3 border-green">
			<div class="mt-3 mb-4">
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table
								class="table table-bordered table-hover table-striped bg-light border-dark">
								<thead>
									<tr class="fs-4 border border-dark bg-info bg-gradient">
										<th style="background-color: #00ff00; color: white;"
											class="bg-success"><pre>Edit</pre></th>
										<th style="background-color: #ff0000; color: white;"
											class="bg-danger"><pre>Delete</pre></th>
										<th><pre>Idea Number</pre></th>
										<th><pre>Date Time</pre></th>
										<th><pre>StartUp Name</pre></th>
										<th><pre>Student Name</pre></th>
										<th><pre>College Name</pre></th>
										<th><pre>Email</pre></th>
										<th><pre>Phone</pre></th>
										<th><pre>Painpoint</pre></th>
										<th><pre>Solution</pre></th>
										<th><pre>Prototype Status</pre></th>
										<th><pre>Technology knowhow</pre></th>
										<th><pre>Skills To Acquire</pre></th>
										<th><pre>Hobbies</pre></th>
										<th><pre>Team Size</pre></th>
										<th><pre>College Mentor</pre></th>
										<th><pre>File Upload Presentation</pre></th>
										<th><pre>Team Photo Upload</pre></th>
									</tr>
								<tbody>
									<c:forEach var="ideationtable" items="${ideationT}">

										<tr class="border border-dark">
											<td style="background-color: rgba(0, 255, 0, 0.1);"><a
												class=" badge bg-success fs-6 text-wrap add text-decoration-none new-faint-green"
												href='update.jsp'>Update</a></td>
											<td style="background-color: rgba(255, 0, 0, 0.1);"><a
												class="badge bg-danger fs-6 text-wrap add text-decoration-none new-faint-red"
												href='Delete.jsp'>Delete</a></td>
											<td><pre class="test"><%=ideationT.getIdeanumber()%></pre></td>
											<td><pre class="test"><%=ideationT.getDate_time()%></pre></td>
											<td><pre class="test"><%=ideationT.getStartupname()%></pre></td>
											<td><pre class="test"><%=ideationT.getStudentname()%></pre></td>
											<td><pre class="test"><%=ideationT.getCollegename()%></pre></td>
											<td><pre class="test"><%=ideationT.getEmail()%></pre></td>
											<td><pre class="test"><%=ideationT.getPhone()%></pre></td>
											<td><pre class="test"><%=ideationT.getPainpoint()%></pre></td>
											<td><pre class="test"><%=ideationT.getSolution()%></pre></td>
											<td><pre class="test"><%=ideationT.getPrototypestatus()%></pre></td>
											<td><pre class="test"><%=ideationT.getTechnology_knowhow()%></pre></td>
											<td><pre class="test"><%=ideationT.getSkills_to_acquire()%></pre></td>
											<td><pre class="test"><%=ideationT.getHobbies()%></pre></td>
											<td><pre class="test"><%=ideationT.getTeamsize()%></pre></td>
											<td><pre class="test"><%=ideationT.getCollege_mentor()%></pre></td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
												class="btn btn-primary" href='updatefile.jsp'>File</a></td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
												class="btn btn-primary" href='updatephoto.jsp'>Photo</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<br> <br> <br>
			<div class="row rounded-2 px-4 fs-6 bg-light ">
				<div class="mt-3 mb-4">
					<div class="row">
						<div class="col-md-12">

							<div class="table-responsive">
								<table
									class="table table-bordered table-hover table-striped bg-light border-dark">
									<thead>
										<tr class="fs-4 border border-dark bg-info bg-gradient">
											<th style="background-color: #00ff00; color: white;"
												class="bg-success"><pre>Edit</pre></th>
											<th style="background-color: #ff0000; color: white;"
												class=" bg-danger"><pre>Delete</pre></th>
											<th><pre>Idea Number</pre></th>
											<th><pre>SR.NO</pre></th>
											<th><pre>Name</pre></th>
											<th><pre>Phone</pre></th>
											<th><pre>Email</pre></th>
											<th><pre>Role</pre></th>

										</tr>
									</thead>
									<tbody class="">
										<%
										//Query Q2 = s.createQuery("from IdeationTeam WHERE ideanumber =: ideanumber");
										//Q2.setParameter("ideanumber", ideanumber);
										//List<IdeationTeam> list = list;
										int count = 0;
										for (IdeationTeam ideationteam : list) {
										%>
										<tr class="border border-dark">
											<td style="background-color: rgba(0, 255, 0, 0.1);" class=""><a
												class="badge bg-success fs-6 text-wrap add text-decoration-none"
												href='updaterecord.jsp?srno=<%=ideationteam.getIdeationTeamId().getTeamId()%>'>Update</a></td>
											<td style="background-color: rgba(255, 0, 0, 0.1);" class=""><a
												class="badge bg-danger fs-6 text-wrap add text-decoration-none"
												href='deleterecord.jsp?srno=<%=ideationteam.getIdeationTeamId().getTeamId()%>'>Delete</a></td>
											<td><pre class="test"><%=ideationteam.getIdeationTeamId().getIdeanumber()%></pre></td>
											<td><pre class="test"><%=ideationteam.getIdeationTeamId().getTeamId()%></pre></td>
											<td><pre class="test"><%=ideationteam.getMemberName()%></pre></td>
											<td><pre class="test"><%=ideationteam.getMemberPhone()%></pre></td>
											<td><pre class="test"><%=ideationteam.getMemberEmail()%></pre></td>
											<td><pre class="test"><%=ideationteam.getMemberRole()%></pre></td>
										</tr>
										<%
										count++;
										}
										if (count == 0) {
										%>
										<tr class="border border-dark">
											<td colspan="8" class="text-center ">Team Member Data
												Are Not Inserted</td>
										</tr>

										<%
										}

										} catch (Exception ex) {
										ex.printStackTrace();
										}
										} catch (Exception ex) {
										session.invalidate();
										response.sendRedirect("index.jsp");
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col mt-0 mb-0 text-center">
					<p class="">
						<a class="fs-6 badge bg-info	 text-wrap add text-decoration-none"
							href='add.jsp'>Add More Team Members Details</a>
					</p>
				</div>
			</div>

		</div>
	</div>
	<%@include file="footer.html"%>
</body>
</html>