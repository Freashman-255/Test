package admin.controller.books;

import admin.dao.books_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/booksdelete")
public class booksdelete_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int count = 0;
        String bid = req.getParameter("bid");
        books_dao dao = new books_dao();
        count = dao.DeleteBook(req,bid);
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(count);
        out.flush();
        out.close();
    }
}
