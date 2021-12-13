package admin.entity;

public class system_eval {
    private Integer service;
    private Integer performance;
    private Integer security;
    private String advice;
    public Integer getService(){
        return service;
    }
    public void setService(Integer service){
        this.service = service;
    }
    public Integer getPerformance(){
        return performance;
    }
    public void setPerformance(Integer performance){
        this.performance = performance;
    }
    public Integer getSecurity(){
        return security;
    }
    public void setSecurity(Integer security){
        this.security = security;
    }
    public String getAdvice(){
        return advice;
    }
    public void setAdvice(String advice){
        this.advice = advice;
    }
}
