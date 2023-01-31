package pojo;

public class Food {
    private String name;//名字
    private String intro;//备注信息
    private float price;//价格
    private int num;//库存
    protected int buyNum;//购买数量
    private String pic;//图片
    private int type;//种类

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(int buyNum) {
        this.buyNum = buyNum;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "food{" +
                "name='" + name + '\'' +
                ", intro='" + intro + '\'' +
                ", price=" + price +
                ", num=" + num +
                ", buyNum=" + buyNum +
                ", pic='" + pic + '\'' +
                ", type=" + type +
                '}';
    }
}
