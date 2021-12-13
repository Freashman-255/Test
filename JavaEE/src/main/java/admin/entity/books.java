package admin.entity;

public class books {
    private String bid;
    private String bname;
    private String author;
    private String img;
    private Integer quantity;
    private Integer borrow;
    public void setBid(String bid){
        this.bid = bid;
    }
    public String getBid(){
        return bid;
    }
    public void setBname(String bname){
        this.bname = bname;
    }
    public String getBname(){
        return bname;
    }
    public void setAuthor(String author){
        this.author = author;
    }
    public String getAuthor(){
        return author;
    }
    public void setImg(String img){
        this.img = img;
    }
    public String getImg(){
        return img;
    }
    public void setQuantity(Integer quantity){
        this.quantity = quantity;
    }
    public Integer getQuantity(){
        return quantity;
    }
    public void setBorrow(Integer borrow){
        this.borrow = borrow;
    }
    public Integer getBorrow(){
        return borrow;
    }
}
