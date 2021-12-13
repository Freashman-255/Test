package admin.controller.goods;

import admin.dao.goods_dao;
import admin.entity.goods;
import admin.util.page;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/livingindex_manage")
public class livingindex_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        String type = req.getParameter("type");//获取传递过来的参数 0代表首页 1代表上一页 2代表下一页 3代表尾页
        int pageSize = 5;//每页的大小

        HttpSession session = req.getSession();//session对象
        int livinggoods_currentPage = 0;//MySql中首页为第0页
        goods_dao dao = new goods_dao();//操作数据库的dao对象

        //得到一个page对象 将页面大小和总页数送给page对象的属性 以便于得到尾页的页数
        page page = new page();
        page.setPageSize(pageSize);//页面大小
        page.setTotalCount(dao.queryGoodsTotal(req,2));//总页数

        //根据操作数判断 currentPage当前的值
        if(session.getAttribute("livinggoods_currentPage") != null && !(type.equals("0"))){
            livinggoods_currentPage = (int) session.getAttribute("livinggoods_currentPage");
            if(type.equals("1")){
                livinggoods_currentPage = livinggoods_currentPage-1;
            } else if(type.equals("2")){
                livinggoods_currentPage = livinggoods_currentPage+1;
            } else{
                livinggoods_currentPage = page.getTotalPage();
            }
        }

        List<goods> goods = null;
        //新的当前页 必须在【0-总页数】 否则不写入新的session中
        if(livinggoods_currentPage >= 0 && livinggoods_currentPage <= page.getTotalPage()){
            session.setAttribute("livinggoods_currentPage",livinggoods_currentPage);//新的当前页写入session中
            goods  = dao.queryGoodsList(req,livinggoods_currentPage,pageSize,2);
        }

        //goods不为空时 转换为json的数据格式
        if(goods != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(goods);
        } else{
            json = "null";
        }
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();
        out.close();
    }
}
