package startup_registration.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import startup_registration.model.IdeationTable;
import startup_registration.service.ServiceIdeationTable;

@WebServlet(name = "updatefile", urlPatterns = { "/updatefile" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 5, // 1MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class updatefile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			IdeationTable ideationT = (IdeationTable) session.getAttribute("ideationT");
			Part ufileupload_presentation = request.getPart("fileupload_presentation");
			String filename = "";
			if (ufileupload_presentation != null) {
				filename = ufileupload_presentation.getSubmittedFileName();
			}
			ideationT.setFileupload_presentation(filename);

			session.removeAttribute("ideationT");
			ideationT = (IdeationTable) ServiceIdeationTable.getfile(ideationT, ufileupload_presentation, response,
					request);

			session.setAttribute("ideationT", ideationT);
			RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
			dispatcher.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
