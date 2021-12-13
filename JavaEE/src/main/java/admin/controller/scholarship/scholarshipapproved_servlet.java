package admin.controller.scholarship;

import admin.dao.scholarship_dao;
import admin.entity.scholarship;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/scholarship_approved")
public class scholarshipapproved_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        scholarship_dao dao = new scholarship_dao();
        List<scholarship> scholarships = dao.ScholarshipApprovedList(req);
        if(scholarships != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(scholarships);
        }
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();
        out.close();
    }
}
