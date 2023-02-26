<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="startup_registration.helper.*"%>
<%@page import="startup_registration.controller.*"%>
<%@page import="startup_registration.model.*"%>
<%@page import="org.hibernate.Query.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%

try{
IdeationTable ideationT=  (IdeationTable)session.getAttribute("ideationT");
int count =0;
Session s = factoryProvider.getfactory().openSession();
Transaction tx = s.beginTransaction();
Query Q1=s.createQuery("DELETE FROM IdeationTeam WHERE ideanumber =:ideanumber");
Q1.setParameter("ideanumber",ideationT.getIdeanumber());
count=Q1.executeUpdate();
tx.commit();
s.close();

Session ss = factoryProvider.getfactory().openSession();
Transaction txx = ss.beginTransaction();
Query Q2=ss.createQuery("DELETE FROM IdeationTable WHERE ideanumber =:ideanumber");
Q2.setParameter("ideanumber",ideationT.getIdeanumber());
count=Q2.executeUpdate();
txx.commit();
ss.close();
session.removeAttribute("ideationTT");
session.removeAttribute("ideationT");
session.invalidate();
response.sendRedirect("index.jsp");
}catch(Exception ex){
	ex.printStackTrace();
}
%>
