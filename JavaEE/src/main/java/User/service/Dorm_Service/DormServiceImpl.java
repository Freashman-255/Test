package User.service.Dorm_Service;

import User.dao.dorm_service.DormMapper;
import User.pojo.ECard;
import User.pojo.Utilities;

public class DormServiceImpl implements DormService{
    private DormMapper dormMapper;

    public void setDormMapper(DormMapper dormMapper) {
        this.dormMapper = dormMapper;
    }

    @Override
    public Double queryCardQuantity(int sno) {
        return dormMapper.queryCardQuantity(sno);
    }

    @Override
    public int updateCardQuantity(ECard card) {
        return dormMapper.updateCardQuantity(card);
    }

    @Override
    public Double queryQuantity(int dno) {
        return dormMapper.queryQuantity(dno);
    }

    @Override
    public int updateQuantity(Utilities utilities) {
        return dormMapper.updateQuantity(utilities);
    }
}
