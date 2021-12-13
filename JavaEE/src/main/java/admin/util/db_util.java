package admin.util;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;

public class db_util {

    //注册驱动【类加载时执行且执行一次】
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //获取连接【无参静态】
    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT","root","hyf1325879046");

        return conn;
    }

    //获取连接【有参静态】
    public static Connection getConnection(HttpServletRequest req) throws SQLException {
        Connection conn = null;
        //通过【请求对象】向Tomcat索要当前网站中的【全局作用域对象】
        ServletContext application = req.getServletContext();
        Map map = (Map) application.getAttribute("conn");

        //通过keySet方法得到map中所有的key值【即conn】
        Iterator it = map.keySet().iterator();
        //使用迭代器进行遍历 找到一个未被使用的通道
        while(it.hasNext()){
            conn = (Connection) it.next();
            boolean flag = (boolean) map.get(conn);
            if(flag == true){
                //通道改为false 表示已被占用
                map.put(conn,false);//map中的键相同时 值会被覆盖
                break;
            }
        }
        return conn;
    }

    //关闭资源【静态方法】
    public static void close (Connection conn, Statement stmt, ResultSet rs, HttpServletRequest req){
        try {
            if(rs != null){
                rs.close();
            }
            if(stmt != null){
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //通过req请求对象向Tomcat索要全局作用域对象
        ServletContext application =req.getServletContext();
        Map map = (Map) application.getAttribute("conn");
        //通道打开
        map.put(conn,true);//map中的键相同时 值会被覆盖
    }
}
