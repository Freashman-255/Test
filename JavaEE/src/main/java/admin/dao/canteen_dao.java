package admin.dao;

import admin.entity.canteen_advice;
import admin.util.db_util;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class canteen_dao {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    //查询食堂意见箱中的所有信息
    public List<canteen_advice> queryCanteenList(HttpServletRequest req){
        //将食堂意见放入一个列表中
        List<canteen_advice> canteens = new ArrayList<>();
        try {
            canteen_advice canteen = null;
            conn = db_util.getConnection(req);
            String sql = "SELECT * FROM canteen_advice";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                canteen = new canteen_advice();
                canteen.setUsername(rs.getString("username"));
                canteen.setAdvantages(rs.getString("ad"));
                canteen.setDisadvantages(rs.getString("disad"));
                canteen.setAdvice(rs.getString("advice"));
                canteens.add(canteen);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return canteens;
    }
}
