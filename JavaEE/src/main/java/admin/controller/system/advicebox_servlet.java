package admin.controller.system;

import admin.dao.system_dao;
import admin.entity.system_eval;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/advicebox_manage")
public class advicebox_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        system_dao dao = new system_dao();
        List<system_eval> suggestion = dao.queryAdviceList(req);
        if(suggestion != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(suggestion);
        }
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();
        out.close();
    }
}
