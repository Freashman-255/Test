package admin.dao;

import admin.entity.system_eval;
import admin.util.db_util;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class system_dao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<system_eval> queryAdviceList (HttpServletRequest req){
        List<system_eval> suggestions = new ArrayList<>();
        try {
            system_eval suggestion = null;
            conn = db_util.getConnection(req);
            String sql = "select advice from system_eval";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                suggestion = new system_eval();
                suggestion.setAdvice(rs.getString("advice"));
                suggestions.add(suggestion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return suggestions;
    }

    public List<system_eval> queryGradeList (HttpServletRequest req){
        List<system_eval> evals = new ArrayList<>();
        try {
            system_eval eval = null;
            conn = db_util.getConnection(req);
            String sql = "select * from system_eval";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()){
                eval = new system_eval();
                eval.setService(rs.getInt("service"));
                eval.setPerformance(rs.getInt("performance"));
                eval.setSecurity(rs.getInt("security"));
                evals.add(eval);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db_util.close(conn,ps,rs,req);
        }
        return evals;
    }
}
