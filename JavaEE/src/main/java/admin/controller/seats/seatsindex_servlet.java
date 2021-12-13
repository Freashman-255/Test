package admin.controller.seats;

import admin.dao.seats_dao;
import admin.entity.seats;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/seats_index")
public class seatsindex_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        seats_dao dao = new seats_dao();
        List<seats> seats = dao.querySeatsList(req);
        if(seats != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(seats);
        }
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();
        out.close();
    }
}
