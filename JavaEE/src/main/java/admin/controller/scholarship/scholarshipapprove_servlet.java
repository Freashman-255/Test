package admin.controller.scholarship;

import admin.dao.scholarship_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/scholarship_approve")
public class scholarshipapprove_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer count = 0;
        Integer state = Integer.valueOf(req.getParameter("state"));
        String sno = req.getParameter("sno");
        scholarship_dao dao = new scholarship_dao();
        count = dao.ScholarshipApprove(req,state,sno);
        resp.setContentType("html/text;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(count);
        out.flush();
        out.close();
    }
}
