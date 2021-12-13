package admin.entity;

public class goods {
    private String gid;
    private String gname;
    private String img;
    private double price;
    private Integer quantity;
    private Integer sold;
    private Integer type;
    private Integer remain;
    public void setGid(String gid){
        this.gid = gid;
    }
    public String getGid(){
        return gid;
    }
    public void setGname(String gname){
        this.gname = gname;
    }
    public String getGname(){
        return gname;
    }
    public void setImg(String img){
        this.img = img;
    }
    public String getImg(){
        return img;
    }
    public void setPrice(double price){
        this.price = price;
    }
    public double getPrice(){
        return price;
    }
    public void setQuantity(Integer quantity){
        this.quantity = quantity;
    }
    public Integer getQuantity(){
        return quantity;
    }
    public void setSold(Integer sold){
        this.sold = sold;
    }
    public Integer getSold(){
        return sold;
    }
    public void setType(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return type;
    }
    public void setRemain(Integer quantity,Integer sold){
        this.remain = (quantity-sold);
    }
    public Integer getRemain(){
        return remain;
    }
}
