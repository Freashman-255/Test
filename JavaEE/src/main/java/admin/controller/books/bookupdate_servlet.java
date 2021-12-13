package admin.controller.books;

import admin.dao.books_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/books_update")
public class bookupdate_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int count = 0;
        String bid = req.getParameter("bid");
        String bname = req.getParameter("bname");
        String author = req.getParameter("author");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int borrow = Integer.parseInt(req.getParameter("borrow"));
        books_dao dao = new books_dao();
        count = dao.updateBooks(req,bid,bname,author,quantity,borrow);
        if(count == 1){
            req.getRequestDispatcher("books_manage/books_index.jsp").forward(req,resp);
        }
    }
}
