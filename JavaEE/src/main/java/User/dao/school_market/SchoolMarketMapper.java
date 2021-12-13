package User.dao.school_market;

import User.pojo.BuyFood;
import User.pojo.BuyGoods;
import User.pojo.Goods;

import java.util.List;
import java.util.Map;

public interface SchoolMarketMapper {
    //初始化物品的第一页参数
    List<Goods> init(String type);
    //查询数据库中物品的总数
    int selectCount(String type);
    //上下跳转按钮的查询支持
    List<Goods> selectPage(Map map);
    //向buy_goods表中插入数据
    int insertBuyGoodsList(BuyGoods buyGoods);
    //查询购物车中的数据
    List<BuyGoods> selectAllBuyGoodsList(String username);

    //删除按钮的实现
    int selectBuyGoodsId(String gname);
    int deleteBuyGoodsById(int id);

    //删除用户的购物记录
    int deleteAllBuyGoodsList(String username);

    //修改余量
    int updateGoodsQuantity(String gname);

    //计算用户所购物品的价值
    Double sumGoods(String username);
}
