package startup_registration.controller;

import java.io.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import startup_registration.model.IdeationTable;
import startup_registration.service.ServiceIdeationTable;

@WebServlet("/updatewala")
public class updatetable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
//		System.out.println(session + " " + request.getSession());
		int ideanumber = (Integer) session.getAttribute("ideanumber");
		IdeationTable ideation = (IdeationTable) session.getAttribute("ideationT");
		try {
			String ustartupname = request.getParameter("startupname");
			String ustudentname = request.getParameter("studentname");
			String ucollegename = request.getParameter("collegename");
			String uemail = request.getParameter("email");
			String uphone = request.getParameter("phone");
			String upainpoint = request.getParameter("painpoint");
			String usolution = request.getParameter("solution");
			String uprototypestatus = request.getParameter("prototypestatus");
			String utechnology_knowhow = request.getParameter("technology_knowhow");
			String uskills_to_acquire = request.getParameter("skills_to_acquire");
			String uhobbies = request.getParameter("hobbies");
			String ucollege_mentor = request.getParameter("college_mentor");
			int uteamsize;
			try {
				uteamsize = Integer.parseInt(request.getParameter("teamsize").trim());
			} catch (Exception e) {
				uteamsize = 0;
				e.printStackTrace();
			}
			IdeationTable ideationT = new IdeationTable();
			ideationT.setIdeanumber(ideanumber);
			ideationT.setDate_time(new Date());
			ideationT.setStartupname(ustartupname);
			ideationT.setStudentname(ustudentname);
			ideationT.setCollegename(ucollegename);
			ideationT.setEmail(uemail);
			ideationT.setPhone(uphone);
			ideationT.setPainpoint(upainpoint);
			ideationT.setSolution(usolution);
			ideationT.setPrototypestatus(uprototypestatus);
			ideationT.setTechnology_knowhow(utechnology_knowhow);
			ideationT.setSkills_to_acquire(uskills_to_acquire);
			ideationT.setHobbies(uhobbies);
			ideationT.setCollege_mentor(ucollege_mentor);
			ideationT.setTeamsize(uteamsize);
			ideationT = (IdeationTable) ServiceIdeationTable.settable(ideationT);

//			String newName = "startupname"; // the new name for the cookie
//			String newValue = ideationT.getStartupname(); // the new value for the cookie
//			Cookie[] cookies = request.getCookies();
//			if (cookies != null) {
//				for (Cookie cookie : cookies) {
//					if (cookie.getName().equals(ideation.getStartupname())) {
//						Cookie newCookie = new Cookie(newName, newValue);
//						newCookie.setMaxAge(60 * 60 * 24); // set cookie to expire in 1 day
//						response.addCookie(newCookie);
//						break;
//					}
//				}
//			}
			session.removeAttribute("ideationT");
			session.setAttribute("ideationT", ideationT);
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
