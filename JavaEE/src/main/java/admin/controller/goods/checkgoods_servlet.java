package admin.controller.goods;

import admin.dao.goods_dao;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/goods_check")
public class checkgoods_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer data = 0;
        String message = "";
        String gid = req.getParameter("gid");
        goods_dao dao = new goods_dao();
        data = dao.CheckGoods(req, gid);
        if(data == 0){
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
