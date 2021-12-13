package User.pojo;

public class Utilities {
    private String dno;
    private double quantity;

    public String getDno() {
        return dno;
    }

    public void setDno(String dno) {
        this.dno = dno;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Utilities{" +
                "dno=" + dno +
                ", quantity=" + quantity +
                '}';
    }
}
