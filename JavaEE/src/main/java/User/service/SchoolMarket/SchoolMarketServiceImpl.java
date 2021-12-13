package User.service.SchoolMarket;

import User.dao.school_market.SchoolMarketMapper;
import User.pojo.BuyGoods;
import User.pojo.Goods;

import java.util.List;
import java.util.Map;

public class SchoolMarketServiceImpl implements SchoolMarketService{
    private SchoolMarketMapper schoolMarketMapper;

    public void setSchoolMarketMapper(SchoolMarketMapper schoolMarketMapper) {
        this.schoolMarketMapper = schoolMarketMapper;
    }

    @Override
    public List<Goods> init(String type) {
        return schoolMarketMapper.init(type);
    }

    @Override
    public int selectCountService(String type) {
        return schoolMarketMapper.selectCount(type);
    }

    @Override
    public List<Goods> selectPageService(Map map) {
        return schoolMarketMapper.selectPage(map);
    }

    @Override
    public int insertBuyGoodsListService(BuyGoods buyGoods) {
        return schoolMarketMapper.insertBuyGoodsList(buyGoods);
    }

    @Override
    public List<BuyGoods> selectAllBuyGoodsListService(String username) {
        return schoolMarketMapper.selectAllBuyGoodsList(username);
    }


    @Override
    public int selectBuyGoodsIdService(String gname) {
        return schoolMarketMapper.selectBuyGoodsId(gname);
    }

    @Override
    public int deleteBuyGoodsByIdService(int id) {
        return schoolMarketMapper.deleteBuyGoodsById(id);
    }

    @Override
    public int deleteAllBuyGoodsList(String username) {
        return schoolMarketMapper.deleteAllBuyGoodsList(username);
    }

    @Override
    public int updateGoodsQuantity(String gname) {
        return schoolMarketMapper.updateGoodsQuantity(gname);
    }

    @Override
    public Double sumGoodsService(String username) {
        return schoolMarketMapper.sumGoods(username);
    }
}
