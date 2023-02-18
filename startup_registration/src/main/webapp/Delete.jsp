
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
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
int count ;
Session s = factoryProvider.getfactory().openSession();
Transaction tx = s.beginTransaction();
Query Q1=s.createQuery("DELETE FROM IdeationTeam WHERE ideanumber =:ideanumber");
Q1.setParameter("ideanumber",ideanumber);
count=Q1.executeUpdate();
tx.commit();
s.close();

Session ss = factoryProvider.getfactory().openSession();
Transaction txx = ss.beginTransaction();
Query Q2=ss.createQuery("DELETE FROM IdeationTable WHERE ideanumber =:ideanumber");
Q2.setParameter("ideanumber",ideanumber);
count=Q2.executeUpdate();
txx.commit();
ss.close();
HttpSession sessions = request.getSession();
sessions.removeAttribute("ideationT");
sessions.removeAttribute("ideationTT");
sessions.removeAttribute("ideanumber");
sessions.invalidate();
RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
dispatcher.forward(request, response);
%>
