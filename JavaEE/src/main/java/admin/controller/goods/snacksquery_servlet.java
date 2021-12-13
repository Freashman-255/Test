package admin.controller.goods;

import admin.dao.goods_dao;
import admin.entity.goods;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/snacksindex_query")
public class snacksquery_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        String data = req.getParameter("data");
        goods_dao dao = new goods_dao();
        List<goods> goods = dao.queryGoods(req,data,1);
        if(goods != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(goods);
        }
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();
        out.close();
    }
}
