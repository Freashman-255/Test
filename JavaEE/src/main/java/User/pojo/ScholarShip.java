package User.pojo;

public class ScholarShip {
    private String username;
    private String sno;
    private String sex;
    private String level;
    private String reason;
    private int state;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "ScholarShip{" +
                "username='" + username + '\'' +
                ", sno='" + sno + '\'' +
                ", sex='" + sex + '\'' +
                ", level='" + level + '\'' +
                ", reason='" + reason + '\'' +
                ", state=" + state +
                '}';
    }
}
