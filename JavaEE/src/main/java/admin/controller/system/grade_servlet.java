package admin.controller.system;

import admin.dao.system_dao;
import admin.entity.system_eval;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/grade_manage")
public class grade_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = "";
        system_dao dao = new system_dao();
        List<system_eval> evals = dao.queryGradeList(req);
        system_eval eval = null;
        double gradeArr[] = new double[18];//0-5为service 6-11为performance 12-17为security
        //遍历返回的system_eval列表
        for(int i=0; i<evals.size();i++){
            //获取实例对象eval
            eval = evals.get(i);
            //将所有的评分 按下标顺序放入数组gradeArr中
            gradeArr[eval.getService()-1] ++;
            gradeArr[eval.getPerformance()+5] ++;
            gradeArr[eval.getSecurity()+11]++;
            //下标为5/11/17的分别为三项的平均值 先放入总和
            gradeArr[5] += eval.getService();
            gradeArr[11] += eval.getPerformance();
            gradeArr[17] += eval.getSecurity();
        }
        //总和/个数就是平均值
        gradeArr[5] = gradeArr[5] / evals.size();
        gradeArr[11] = gradeArr[11] / evals.size();
        gradeArr[17] = gradeArr[17] / evals.size();
        //转为json数组格式
        if( gradeArr != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(gradeArr);
        }
        //写入输出流
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();
        out.close();
    }
}
