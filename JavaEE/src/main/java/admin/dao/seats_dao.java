package admin.dao;

import admin.entity.seats;
import admin.util.db_util;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class seats_dao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //页面加载时加载座位状态
    public List<seats> querySeatsList(HttpServletRequest req){
        List<seats> seats = new ArrayList<>();
        try {
            seats seat = null;
            conn = db_util.getConnection(req);
            String sql = "select * from seats";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                seat =  new seats();
                seat.setSeat_row(rs.getInt("seat_row"));
                seat.setSeat_col(rs.getInt("seat_col"));
                seat.setSeat_state(rs.getInt("seat_state"));
                seats.add(seat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return seats;
    }

    //修改指定的的座位状态
    public Integer changeSeats(HttpServletRequest req,Integer row,Integer col,Integer state){
        Integer count = 0;
        try {
            conn = db_util.getConnection(req);
            String sql = "update seats set seat_state = ? where seat_row = ? and seat_col = ?";
            ps = conn.prepareStatement(sql);
            if(state.equals(3)){
                ps.setInt(1,1);
            }else{
                ps.setInt(1,3);
            }
            ps.setInt(2,row);
            ps.setInt(3,col);
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return count;
    }
}
