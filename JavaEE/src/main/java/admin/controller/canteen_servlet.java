package admin.controller;

import admin.dao.canteen_dao;
import admin.entity.canteen_advice;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/canteen_manage")
public class canteen_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        canteen_dao dao = new canteen_dao();
        List<canteen_advice> canteens = dao.queryCanteenList(req);
        if(canteens != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(canteens);
        }
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter pw = resp.getWriter();
        pw.println(json);
        pw.flush();
        pw.close();
    }
}
