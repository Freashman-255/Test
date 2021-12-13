package admin.controller.books;

import admin.dao.books_dao;
import admin.entity.books;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import static java.lang.System.out;

@WebServlet("/admin/booksindex_query")
public class booksquery_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        String data = req.getParameter("data");
        String type = req.getParameter("type");
        books_dao dao = new books_dao();
        List<books> books = dao.queryBooks(type, data, req);
        if(books != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(books);
        }
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();
        out.close();
    }
}
