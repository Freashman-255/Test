package admin.entity;

public class users {
    private String username;
    private String password;
    private int usertype;
    public String getName(){
        return username;
    }
    public void setName(String username){
        this.username= username;
    }
    public String getPass(){
        return password;
    }
    public void setPass(String password){
        this.password=password;
    }
    public Integer setType(){
        return usertype;
    }
    public void setType(int usertype){
        this.usertype=usertype;
    }
}
