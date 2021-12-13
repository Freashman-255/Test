package User.pojo;

public class SystemEval {
    private int service;
    private int performance;
    private int security;
    private String advice;

    public int getService() {
        return service;
    }

    public void setService(int service) {
        this.service = service;
    }

    public int getPerformance() {
        return performance;
    }

    public void setPerformance(int performance) {
        this.performance = performance;
    }

    public int getSecurity() {
        return security;
    }

    public void setSecurity(int security) {
        this.security = security;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    @Override
    public String toString() {
        return "SystemEval{" +
                "service=" + service +
                ", performance=" + performance +
                ", security=" + security +
                ", advice='" + advice + '\'' +
                '}';
    }
}
