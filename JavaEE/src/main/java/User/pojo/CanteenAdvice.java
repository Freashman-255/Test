package User.pojo;

public class CanteenAdvice {
    private String username;
    private String ad;
    private String disad;
    private String advice;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getDisad() {
        return disad;
    }

    public void setDisad(String disad) {
        this.disad = disad;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    @Override
    public String toString() {
        return "CanteenAdvice{" +
                "username='" + username + '\'' +
                ", ad='" + ad + '\'' +
                ", disad='" + disad + '\'' +
                ", advice='" + advice + '\'' +
                '}';
    }
}
