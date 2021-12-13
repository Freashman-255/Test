package admin.dao;

import admin.entity.books;
import admin.util.db_util;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class books_dao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //查询数据库中图书的总个数
    public int queryBooksTotal(HttpServletRequest req){
        int count = -1;
        try {
            conn = db_util.getConnection(req);
            String sql = "select count(*) from books";
            ps = conn.prepareStatement(sql);
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

    //页面加载时加载数据库已有的图书
    public List<books> queryBookList(HttpServletRequest req,int currentPage,int pageSize){
        List<books> books = new ArrayList<books>();
        try {
            books book = null;
            conn = db_util.getConnection(req);
            String sql = "select * from books limit ? , ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,currentPage*pageSize);
            ps.setInt(2,pageSize);
            rs = ps.executeQuery();
            while (rs.next()){
                book = new books();
                book.setBid(rs.getString("bid"));
                book.setBname(rs.getString("bname"));
                book.setAuthor(rs.getString("author"));
                book.setImg(rs.getString("img"));
                book.setQuantity(rs.getInt("quantity"));
                book.setBorrow(rs.getInt("borrow"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return books;
    }

    //根据输入的数据对书进行模糊查询
    public List<books> queryBooks(String type,String data,HttpServletRequest req){
        List<books> books = new ArrayList<books>();
        data = "%"+data+"%";
        try {
            books book = null;
            conn = db_util.getConnection(req);
            String sql = "";
            if(type.equals("0")){
                sql = "select * from books where bname like ?";
            }else{
                sql = "select * from books where author like ?";
            }
            ps = conn.prepareStatement(sql);
            ps.setString(1,data);
            rs = ps.executeQuery();
            while(rs.next()){
                book = new books();
                book.setBid(rs.getString("bid"));
                book.setBname(rs.getString("bname"));
                book.setAuthor(rs.getString("author"));
                book.setImg(rs.getString("img"));
                book.setQuantity(rs.getInt("quantity"));
                book.setBorrow(rs.getInt("borrow"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return books;
    }

    //已知书id对书进行删除
    public int DeleteBook(HttpServletRequest req,String bid){
        int count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "delete from books where bid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,bid);
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }

    //上架书籍时 检查书籍编号是否重复
    public int CheckBooks (HttpServletRequest req,String bid){
        int count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "select count(*) from books where bid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,bid);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }

    /**
     * INSERT INTO books VALUES
     * ('0001','活着','余华','images/books/活着.jpg',20,12)
     * @param req
     * @param book
     * @return
     */
    //上新书籍
    public int AddBooks(HttpServletRequest req,books book){
        int count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "insert into books values(?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1,book.getBid());
            ps.setString(2,book.getBname());
            ps.setString(3,book.getAuthor());
            ps.setString(4,book.getImg());
            ps.setInt(5,book.getQuantity());
            ps.setInt(6,book.getBorrow());
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }

    //根据bid对图书进行查询
    public books queryBook(HttpServletRequest req,String bid){
        books book = new books();
        book.setBid(bid);
        try {
            conn = db_util.getConnection(req);
            String sql = "select * from books where bid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,bid);
            rs = ps.executeQuery();
            while (rs.next()){
                book.setBname(rs.getString("bname"));
                book.setBorrow(rs.getInt("borrow"));
                book.setAuthor(rs.getString("author"));
                book.setQuantity(rs.getInt("quantity"));
                book.setImg(rs.getString("img"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return book;
    }

    //根据bid更新书籍信息
    public int updateBooks(HttpServletRequest req,String bid,String bname,String author,int quantity,int borrow){
        int count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "update books set bname = ?,author = ?,quantity = ?,borrow = ? where bid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,bname);
            ps.setString(2,author);
            ps.setInt(3,quantity);
            ps.setInt(4,borrow);
            ps.setString(5,bid);
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }
}
