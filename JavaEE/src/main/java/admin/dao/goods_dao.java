package admin.dao;

import admin.entity.goods;
import admin.util.db_util;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class goods_dao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //查询数据库中goods总条数
    public int queryGoodsTotal(HttpServletRequest req,int type){
        int count = -1;
        try {
            conn = db_util.getConnection(req);
            String sql = "select count(*) from goods where type = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,type);
            rs = ps.executeQuery();
            if(rs.next()){
                count = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }

    //分页加载goods
    public List<goods> queryGoodsList(HttpServletRequest req,int currentPage,int pageSize,int type){
        List<goods> goods = new ArrayList<>();
        try {
            goods good = null;
            conn = db_util.getConnection(req);
            String sql = "select * from goods where type = ? limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,type);
            ps.setInt(2, currentPage*pageSize);
            ps.setInt(3,pageSize);
            rs = ps.executeQuery();
            while(rs.next()){
                good = new goods();
                good.setGid(rs.getString("gid"));
                good.setGname(rs.getString("gname"));
                good.setImg(rs.getString("img"));
                good.setPrice(rs.getDouble("price"));
                good.setRemain(rs.getInt("quantity"),rs.getInt("sold"));
                goods.add(good);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return goods;
    }

    //根据关键字对goods进行模糊查询
    public List<goods> queryGoods(HttpServletRequest req,String data,int type) {
        data = "%" + data + "%";
        List<goods> goods = new ArrayList<>();
        try {
            goods good = null;
            conn = db_util.getConnection(req);
            String sql = "select * from goods where type = ? and gname like ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,type);
            ps.setString(2,data);
            rs = ps.executeQuery();
            while (rs.next()) {
                good = new goods();
                good.setGid(rs.getString("gid"));
                good.setGname(rs.getString("gname"));
                good.setImg(rs.getString("img"));
                good.setPrice(rs.getDouble("price"));
                good.setRemain(rs.getInt("quantity"), rs.getInt("sold"));
                goods.add(good);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn, ps, rs, req);
        }
        return goods;
    }

    //货物上新时检查货物编号是否已经存在
    public Integer CheckGoods (HttpServletRequest req,String gid){
        Integer data = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "select count(*) from goods where gid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,gid);
            rs = ps.executeQuery();
            while (rs.next()){
                data = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            db_util.close(conn,ps,rs,req);
        }
        return data;
    }

    //删除gid所对应的商品
    public Integer DeleteGoods(HttpServletRequest req,String gid){
        Integer count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "delete from goods where gid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,gid);
            count = ps.executeUpdate();//count的值代表几条数据被改变
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }


    /**
     * INSERT INTO goods VALUES
     * ('1001','梨膏糖','images/snacks/梨膏糖.jpg',4,100,0,1),
     * @param req
     * @param good
     * @return
     */
    //添加商品
    public int AddGoods(HttpServletRequest req,goods good){
        int count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "insert into goods values(?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1,good.getGid());
            ps.setString(2,good.getGname());
            ps.setString(3,good.getImg());
            ps.setDouble(4,good.getPrice());
            ps.setInt(5,good.getQuantity());
            ps.setInt(6,good.getSold());
            ps.setInt(7,good.getType());
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }
}
