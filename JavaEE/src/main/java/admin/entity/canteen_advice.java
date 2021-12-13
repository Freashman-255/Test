package admin.entity;

public class canteen_advice {
    private String username;
    private String advantages;
    private String disadvantages;
    private String advice;
    private Integer state;
    public String getUsername(){
        return username;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public String getAdvantages(){
        return advantages;
    }
    public void setAdvantages(String advantages){
        this.advantages = advantages;
    }
    public String getDisadvantages(){
        return disadvantages;
    }
    public void setDisadvantages(String disadvantages){
        this.disadvantages = disadvantages;
    }
    public String getAdvice(){
        return advice;
    }
    public void setAdvice(String advice){
        this.advice = advice;
    }
    public Integer getState(){
        return state;
    }
    public void setState(Integer state){
        this.state = state;
    }
}
