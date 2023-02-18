package startup_registration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import startup_registration.service.GetAll_Ideation_service;
@WebServlet("/CheckStartupName")
public class CheckStartupName extends HttpServlet {

private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startupname = request.getParameter("startupname");
        boolean isTaken = GetAll_Ideation_service.isStartupNameTaken(startupname);
        if(isTaken) {
            response.getWriter().write("taken");
        } else {
            response.getWriter().write("available");
        }
    }
}
