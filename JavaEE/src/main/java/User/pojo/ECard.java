package User.pojo;

public class ECard {
    private String sno;
    private Double quantity;

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ECard{" +
                "sno=" + sno +
                ", quantity=" + quantity +
                '}';
    }
}
