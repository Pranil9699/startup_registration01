package startup_registration.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import startup_registration.model.*;
import startup_registration.service.GetAll_Ideation_service;

@WebServlet(name = "GetAll", urlPatterns = { "/GetAll" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 5, // 1MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class GetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws FileNotFoundException, ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			System.out.println(session + " " + request.getSession());
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
			Part ufileupload_presentation = request.getPart("fileupload_presentation");
			String filename = "";
			if (ufileupload_presentation != null) {
				filename = ufileupload_presentation.getSubmittedFileName();
			}
			Part uteam_photo_upload = request.getPart("team_photo_upload");
			String photoname = "";
			if (uteam_photo_upload != null) {
				photoname = uteam_photo_upload.getSubmittedFileName();
			}
			int uteamsize;
			try {
				uteamsize = Integer.parseInt(request.getParameter("teamsize").trim());
			} catch (Exception e) {

				uteamsize = 0;
			}
			IdeationTable ideation = new IdeationTable();
			ideation.setDate_time(new Date());
			ideation.setStartupname(ustartupname);
			ideation.setStudentname(ustudentname);
			ideation.setCollegename(ucollegename);
			ideation.setEmail(uemail);
			ideation.setPhone(uphone);
			ideation.setPainpoint(upainpoint);
			ideation.setSolution(usolution);
			ideation.setPrototypestatus(uprototypestatus);
			ideation.setTechnology_knowhow(utechnology_knowhow);
			ideation.setSkills_to_acquire(uskills_to_acquire);
			ideation.setHobbies(uhobbies);
			ideation.setCollege_mentor(ucollege_mentor);
			ideation.setTeamsize(uteamsize);
			ideation.setFileupload_presentation(filename);
			ideation.setTeam_photo_upload(photoname);

			IdeationTable ideationT = (IdeationTable) GetAll_Ideation_service.getT(ideation, ufileupload_presentation,
					uteam_photo_upload, request, response);
            List<IdeationTeam> ideationTT= new ArrayList<IdeationTeam>();
			String[] ust_email = request.getParameterValues("st_email[]");
			if (ust_email != null) {
				String[] uname = request.getParameterValues("name[]");
				String[] ucontact = request.getParameterValues("contact[]");
				String[] urole = request.getParameterValues("role[]");
				for (int i = 0; i < ust_email.length; i++) {
					IdeationTeam team = new IdeationTeam();
					IdeationTeamId id = new IdeationTeamId(ideationT.getIdeanumber(), i + 1);
					team.setIdeationTeamId(id);
					team.setMemberName(uname[i]);
					team.setMemberEmail(ust_email[i]);
					team.setMemberPhone(ucontact[i]);
					team.setMemberRole(urole[i]);
					team.setIdeationTable(ideationT);
					GetAll_Ideation_service.getTT(team);
					ideationTT.add(team);
				}
			}
			try {
				String from = ideationT.getEmail();
				boolean flag = GetAll_Ideation_service.sendEmail(from);
				if (flag)
					System.out.println("Email is Sended...");
				else
					System.out.println("Email is Not Sended...");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			session.setAttribute("ideationT", ideationT);
			session.setAttribute("ideationTT", ideationTT);
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);
			session.setMaxInactiveInterval(1800); // Set session timeout to 30 minutes (1800 seconds)

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
