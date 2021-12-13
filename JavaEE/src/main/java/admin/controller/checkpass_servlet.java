package admin.controller;

import admin.dao.user_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/check_password")
public class checkpass_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int count = 0;
        String password = req.getParameter("password");
        String username = (String) req.getSession().getAttribute("username");
        user_dao dao = new user_dao();
        count = dao.login(username,password,req);
        PrintWriter out = resp.getWriter();
        out.println(count);
        out.flush();
        out.close();
    }
}
