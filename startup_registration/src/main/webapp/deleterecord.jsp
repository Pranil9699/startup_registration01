<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="java.util.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%

int srno = Integer.parseInt(request.getParameter("srno").trim());

try{

try{
	int ideanumber=0;
	//List<IdeationTeam> ideationTT= new ArrayList<IdeationTeam>();
Object obj = session.getAttribute("ideationTT");
if (obj instanceof ArrayList) {
    ArrayList<IdeationTeam> ideationTT = (ArrayList<IdeationTeam>) obj;
    Iterator<IdeationTeam> iterator = ideationTT.iterator();
    while (iterator.hasNext()) {
        IdeationTeam ideationT = iterator.next();
        if (ideationT.getIdeationTeamId().getTeamId() == srno) {
            iterator.remove();
            ideanumber = ideationT.getIdeationTeamId().getIdeanumber();
        }
    }
    session.setAttribute("ideationTT", ideationTT);
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
}catch(Exception ex){
	ex.printStackTrace();
}

}catch(Exception ex){
	ex.printStackTrace();
	RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
	dispatcher.forward(request, response);
}
%>

