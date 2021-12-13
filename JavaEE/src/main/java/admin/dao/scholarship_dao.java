package admin.dao;

import admin.entity.scholarship;
import admin.util.db_util;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//查询数据库中所有奖学金的列表
public class scholarship_dao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    //页面加载时加载未审批的奖学金申请记录
    public List<scholarship> queryScholarshipList(HttpServletRequest req){
        List<scholarship> scholarships = new ArrayList<>();
        try {
            scholarship scholarship = null;
            conn = db_util.getConnection(req);
            String sql = "select * from scholarship where state = 0";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                scholarship = new scholarship();
                scholarship.setUsername(rs.getString("username"));
                scholarship.setSno(rs.getString("sno"));
                scholarship.setSex(rs.getString("sex"));
                scholarship.setLevel(rs.getString("level"));
                scholarship.setReason(rs.getString("reason"));
                scholarships.add(scholarship);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return scholarships;
    }
    //审批奖学金
    public Integer ScholarshipApprove(HttpServletRequest req,Integer state,String sno){
        Integer count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "update scholarship set state = ? where sno = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,state);
            ps.setString(2,sno);
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }
    //页面加载时加载已审批的奖学金记录
    public List<scholarship> ScholarshipApprovedList(HttpServletRequest req){
        List<scholarship> scholarships = new ArrayList<>();
        try {
            scholarship scholarship = null;
            conn = db_util.getConnection(req);
            String sql = "select * from scholarship where state > 0";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                scholarship = new scholarship();
                scholarship.setUsername(rs.getString("username"));
                scholarship.setSno(rs.getString("sno"));
                scholarship.setLevel(rs.getString("level"));
                scholarship.setState(rs.getInt("state"));
                scholarships.add(scholarship);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return scholarships;
    }
    //模糊查询奖学金列表
    public List<scholarship> queryScholarship(HttpServletRequest req,String type,String data){
        List<scholarship> scholarships = new ArrayList<>();
        data = "%"+data+"%";
        try {
            scholarship scholarship = null;
            conn = db_util.getConnection(req);
            String sql = "";
            if(type.equals("0")){
                sql = "select * from scholarship where sno like ? and state = 0";
            } else if( type.equals("1")){
                sql = "select * from scholarship where username like ? and state = 0";
            } else {
                sql = "select * from scholarship where level like ?  and state = 0";
            }
            ps = conn.prepareStatement(sql);
            ps.setString(1,data);
            rs = ps.executeQuery();
            while (rs.next()){
                scholarship = new scholarship();
                scholarship.setUsername(rs.getString("username"));
                scholarship.setSno(rs.getString("sno"));
                scholarship.setLevel(rs.getString("level"));
                scholarships.add(scholarship);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return scholarships;
    }
}
