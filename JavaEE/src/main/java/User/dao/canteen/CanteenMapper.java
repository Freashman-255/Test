package User.dao.canteen;

import User.pojo.BuyFood;
import User.pojo.CanteenAdvice;
import User.pojo.SellFood;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CanteenMapper {
    //增加反馈记录    完全实现
    int addFeedbackRecord(CanteenAdvice canteenAdvice);

    //初始化商品
    List<SellFood> init();

    //上下和跳转查询
    List<SellFood> queryPage(int page);

    //查询数据库中数据的总数
    int foodCount();

    //更新顾客购买商品的表，为了给购物车保存数据
    int insertBuyList(BuyFood buyFood);

    //当用户付完钱之后便删除该用户的购买记录
    int deleteBuyList(String username);

    //查询buy_food表中的数据用于初始化购物车
    List<BuyFood> queryBuyListByName(@Param("username") String username);

    //根据food_name来查询一个id，删除的时候就只删除一个
    int queryListByFoodName(String food_name);

    //使用上面提供的id来删除指定buy_list中的一条数据
    int deleteListByFoodId(int id);

    //查询出该用户需要付多少钱
    double selectPayCount(String username);

    //更新sell_food表
    int updateSellFood(String foodName);
}
