package admin.controller.goods;

import admin.dao.goods_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/goodsdelete")
public class goodsdelete_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gid = req.getParameter("gid");
        Integer count = 0;
        goods_dao dao = new goods_dao();
        count = dao.DeleteGoods(req,gid);
        resp.setContentType("html/text;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(count);
        out.flush();
        out.close();
    }
}
