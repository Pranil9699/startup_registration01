package startup_registration.controller;

import java.io.*;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import startup_registration.model.IdeationTeam;
import startup_registration.model.IdeationTeamId;
import startup_registration.service.Updaterecord_Ideationteam_service;

@WebServlet(name = "updaterecord", urlPatterns = { "/updaterecord" })
public class updateteam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ideanumber = Integer.parseInt(request.getParameter("ideanumber").trim());
		int srno = Integer.parseInt(request.getParameter("srno").trim());
		try {
			String name = request.getParameter("name");
			String contact = request.getParameter("contact");
			String email = request.getParameter("st_email");
			String role = request.getParameter("role");
			HttpSession  session = request.getSession();
			session.removeAttribute("ideationTT");
			
			IdeationTeam  ideationTt=new IdeationTeam();
			IdeationTeamId ideationTI=new IdeationTeamId();
			ideationTI.setIdeanumber(ideanumber);
			ideationTI.setTeamId(srno);
			ideationTt.setIdeationTeamId(ideationTI);
			ideationTt.setMemberName(name);
			ideationTt.setMemberPhone(contact);
			ideationTt.setMemberEmail(email);
			ideationTt.setMemberRole(role);
			
			
			List<IdeationTeam> ideationTT=Updaterecord_Ideationteam_service.setrecord_service(ideationTt);
			session.setAttribute("ideationTT", ideationTT);
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);
		}
	}
}
