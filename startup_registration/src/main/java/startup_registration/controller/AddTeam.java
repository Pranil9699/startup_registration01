package startup_registration.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import org.hibernate.*;
import startup_registration.model.*;
import startup_registration.service.GetAll_Ideation_service;
import startup_registration.helper.*;

//@WebServlet("/Team")
//@WebServlet(name = "Team", urlPatterns = { "/Team" })
@WebServlet(name = "Team", urlPatterns = { "/Team" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 5, // 1MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 100 // 100MB
)

public class AddTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getSession());
		HttpSession session = request.getSession();
		List<IdeationTeam> list1 = (List<IdeationTeam>) session.getAttribute("ideationTT");
		int ideanumber = Integer.parseInt(request.getParameter("ideanumber").trim());
		IdeationTable ideation = new IdeationTable();
		ideation.setIdeanumber(ideanumber);
      
		try {
            //List<IdeationTeam> ideationTT= new ArrayList<IdeationTeam>();
         
			String[] ust_email = request.getParameterValues("st_email[]");
			if (ust_email != null) {
				String[] uname = request.getParameterValues("name[]");
				String[] ucontact = request.getParameterValues("contact[]");
				String[] urole = request.getParameterValues("role[]");
				for (int i = 0; i < ust_email.length; i++) {

					Session session1 = factoryProvider.getfactory().openSession();
					@SuppressWarnings("unchecked")
					Query<IdeationTeam> query = session1
							.createQuery("FROM IdeationTeam where ideanumber =: ideanumber ");
					query.setParameter("ideanumber", ideanumber);
					List<IdeationTeam> list = query.list();
					int count = 0;
					for (IdeationTeam ideationteam : list)
						count = ideationteam.getIdeationTeamId().getTeamId();
					session1.close();

					IdeationTeam team = new IdeationTeam();
					IdeationTeamId id = new IdeationTeamId(ideation.getIdeanumber(), count + 1);
					team.setIdeationTeamId(id);
					team.setMemberName(uname[i]);
					team.setMemberEmail(ust_email[i]);
					team.setMemberPhone(ucontact[i]);
					team.setMemberRole(urole[i]);
					team.setIdeationTable(ideation);
					GetAll_Ideation_service.getTT(team);
					list1.add(team);

				}
			}
			session.removeAttribute("ideationTT");
			session.setAttribute("ideationTT", list1);
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);

		} catch (Exception ex) {
			ex.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);

		}

	}

}
