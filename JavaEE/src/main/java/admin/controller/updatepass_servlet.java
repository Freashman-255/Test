package admin.controller;

import admin.dao.user_dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update_password")
public class updatepass_servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int count = 0;
        String newpassword = req.getParameter("newpassword");
        user_dao dao = new user_dao();
        count = dao.updatePass(req, (String) req.getSession().getAttribute("username"),newpassword);
        if(count == 1){
            req.setAttribute("message","修改成功");
            req.getRequestDispatcher("/admin/admin_manage/update_information.jsp").forward(req,resp);
        }
    }
}
