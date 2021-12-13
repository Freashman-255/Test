package User.dao.Login_Sign;

import User.pojo.User;
import org.mybatis.spring.SqlSessionTemplate;

public class Login_SignMapperImpl implements Login_SignMapper{
    private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public User queryUser(String username, String password) {
        Login_SignMapper login_signMapper=sqlSession.getMapper(Login_SignMapper.class);
        return login_signMapper.queryUser(username,password);
    }

    @Override
    public int addUser(User user) {
        return sqlSession.getMapper(Login_SignMapper.class).addUser(user);
    }
}
