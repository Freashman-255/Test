package admin.controller.books;

import admin.dao.books_dao;
import admin.entity.books;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/books_load")
public class booksload_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bid = req.getParameter("bid");
        System.out.println(bid);
        books book = null;
        books_dao dao = new books_dao();
        book = dao.queryBook(req,bid);
        req.setAttribute("book",book);
        System.out.println(book.getBid());
        if(book != null){
            req.getRequestDispatcher("books_manage/books_update.jsp").forward(req,resp);
        }
    }
}
