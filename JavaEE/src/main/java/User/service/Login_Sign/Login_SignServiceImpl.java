package User.service.Login_Sign;

import User.dao.Login_Sign.Login_SignMapper;
import User.pojo.User;

public class Login_SignServiceImpl implements Login_SignService{
    private Login_SignMapper login_signMapper;

    public void setLogin_signMapper(Login_SignMapper login_signMapper) {
        this.login_signMapper = login_signMapper;
    }

    @Override
    public User queryUserService(String username, String password) {
        return login_signMapper.queryUser(username, password);
    }

    @Override
    public int addUserService(User user) {
        return login_signMapper.addUser(user);
    }
}
