package admin.controller.seats;

import admin.dao.seats_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/seats_change")
public class seatschange_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer row = Integer.valueOf(req.getParameter("row"));
        Integer col = Integer.valueOf(req.getParameter("col"));
        Integer state = Integer.valueOf(req.getParameter("state"));
        Integer count = 0;
        seats_dao dao = new seats_dao();
        count = dao.changeSeats(req,row,col,state);
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(count);
        out.flush();
        out.close();
    }
}
