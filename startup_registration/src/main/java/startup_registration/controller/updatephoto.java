package startup_registration.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import startup_registration.model.IdeationTable;
import startup_registration.service.ServiceIdeationTable;

@WebServlet(name = "updatephoto", urlPatterns = { "/updatephoto" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 5, // 1MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class updatephoto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
            IdeationTable ideationT=(IdeationTable)session.getAttribute("ideationT");
            Part uteam_photo_upload = request.getPart("team_photo_upload");			
            String photoname = "";
			if (uteam_photo_upload != null) {
				photoname = uteam_photo_upload.getSubmittedFileName();
			}
              ideationT.setTeam_photo_upload(photoname);
              session.removeAttribute("ideationT");
			  ideationT = (IdeationTable)ServiceIdeationTable.getphoto(ideationT,uteam_photo_upload,response,request);
              session.setAttribute("ideationT", ideationT);
			  RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			  dispatcher.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
