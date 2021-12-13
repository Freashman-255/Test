package admin.controller.books;

import admin.dao.books_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/books_check")
public class checkbooks_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int count = 0;
        String message = "";
        String bid = req.getParameter("bid");
        books_dao dao = new books_dao();
        count = dao.CheckBooks(req,bid);
        if(count == 0){
            message = "1";
        }else{
            message = "0";
        }
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(message);
        out.flush();
        out.close();
    }
}
