package User.pojo;

public class BuyFood {
    private int id;
    private String username;
    private String food_name;
    private String img_src;
    private double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "BuyFood{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", food_name='" + food_name + '\'' +
                ", img_src='" + img_src + '\'' +
                ", price=" + price +
                '}';
    }
}
