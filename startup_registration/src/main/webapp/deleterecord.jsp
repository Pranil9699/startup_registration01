<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="java.util.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%

int ideanumber = (Integer) session.getAttribute("ideanumber");
int srno = Integer.parseInt(request.getParameter("srno").trim());
try{
HttpSession sessions = request.getSession();
List<IdeationTeam> ideationTT=(List<IdeationTeam>)sessions.getAttribute("ideationTT");
for(IdeationTeam ideationT:ideationTT){
	if(ideationT.getIdeationTeamId().getTeamId()==srno){
		ideationTT.remove(ideationT);	
	}
}
sessions.setAttribute("ideationTT",ideationTT);
}catch(Exception ex){
	ex.printStackTrace();
}


Session s = factoryProvider.getfactory().openSession();
Transaction tx = s.beginTransaction();
Query Q1 = s.createQuery("DELETE FROM IdeationTeam WHERE ideanumber =:ideanumber and teamId=: teamId");
Q1.setParameter("teamId", srno);
Q1.setParameter("ideanumber", ideanumber);
int count = Q1.executeUpdate();
tx.commit();
s.close();

RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
dispatcher.forward(request, response);
%>
