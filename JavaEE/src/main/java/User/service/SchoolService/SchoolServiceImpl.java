package User.service.SchoolService;

import User.dao.schoolService.SchoolMapper;
import User.pojo.ScholarShip;

public class SchoolServiceImpl implements SchoolService{
    private SchoolMapper schoolMapper;

    public void setSchoolMapper(SchoolMapper schoolMapper) {
        this.schoolMapper = schoolMapper;
    }

    @Override
    public int insertScholarShip(ScholarShip scholarShip) {
        return schoolMapper.insertScholarShip(scholarShip);
    }
}
