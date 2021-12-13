package admin.listener;

import admin.util.db_util;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Http服务器启动时 自动为当前网站在内存中创建一个【全局作用域对象】
 */

public class conn_listener implements ServletContextListener {

    //在全局作用域对象被Http服务器初始化时触发调用
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        Map map = new HashMap();//存放20个conn对象
        Connection conn = null;
        //获取20个连接对象conn
        for(int i=0;i<=20;i++) {
            try {
                conn = db_util.getConnection();//【静态方法】获取连接
                map.put(conn, true);//true代表conn通道未被占用 false代表conn通道已被占用
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //向Tomcat索要【全局作用域对象】
        ServletContext application = servletContextEvent.getServletContext();
        //将【20个conn的map】添加到全局作用域对象作为【共享数据】
        application.setAttribute("conn",map);//键值对
    }

    //在全局作用域对象被Http服务器销毁时触发调用
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        Connection conn = null;
        //向Tomcat索要【全局作用域对象】
        ServletContext application = servletContextEvent.getServletContext();
        Map map = (Map) application.getAttribute("conn");
        //keySet方法得到map中所有的key值【conn】 并通过迭代器进行遍历
        Iterator it = map.keySet().iterator();
        while(it.hasNext()){
            conn = (Connection) it.next();
            if(conn != null ){
                try {
                    conn.close();//关闭conn
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
