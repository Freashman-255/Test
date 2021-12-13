package admin.dao;

import admin.util.db_util;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class user_dao{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //登录验证
    public int login(String username,String password, HttpServletRequest req) {
        ResultSet rs = null;
        int result = 0;
        try {
            //获取连接【静态方法】 通过请求对象 获取全局作用域对象
            conn = db_util.getConnection(req);
            String sql = "select count(*) from users where username = ? and password = ?";
            ps = conn.prepareStatement(sql);
            //给？传值
            ps.setString(1,username);
            ps.setString(2,password);
            rs = ps.executeQuery();//结果集
            if (rs.next()){
                result = rs.getInt("count(*)");//找出结果表头为"count(*)的值" 只有一行所以不用遍历
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);//关闭资源
        }
        return result;
    }

    //根据用户名修改密码
    public int updatePass(HttpServletRequest req,String username,String newpassword){
        int count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "update users set password = ? where username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,newpassword);
            ps.setString(2,username);
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }
}
