package User.pojo;

public class SellFood {
    private String food_name;
    private String img_src;
    private int price;
    private int quantity;

    public String getFood_name() {
        return food_name;
    }

    public void setFood_name(String food_name) {
        this.food_name = food_name;
    }

    public String getImg_src() {
        return img_src;
    }

    public void setImg_src(String img_src) {
        this.img_src = img_src;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "SellFood{" +
                "food_name='" + food_name + '\'' +
                ", img_src='" + img_src + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}
