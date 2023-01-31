package utils;

import pojo.Food;

import java.util.HashMap;

public class ShopCar {
    private HashMap<String, Food> buylist;//用来存储购买商品
    public ShopCar(){
        this.buylist = new HashMap<String, Food>();
    }
    public HashMap<String, Food> getBuylist() {
        return buylist;
    }
    /**
     * @功能 向购物车汇总添加商品
     * @参数 food为food类对象，封装了要添加的商品
     * @ num为要添加的商品数量
     */
    public void addItem(Food food, int num){
        if(food != null){
            String name = food.getName();
            Food temp = (Food)buylist.get(name);
            if(temp != null){
                temp.setBuyNum(temp.getBuyNum()+num);
//                System.out.println(temp.getBuyNum());//检验数量是否添加
            }else{
                temp = food;
                temp.setBuyNum(num);
                buylist.put(name, temp);
            }
        }
    }
    //重载 addItem()
    //用来向购物车添加商品（数量为 1）
    public void addItem(Food food){
        addItem(food,1);
    }
    //从购物车中移除指定名称的商品
    public void removeItem(String name){
        buylist.remove(name);
    }
    //重载 removeItem()，用来从购物车中移除一组指定名称的商品
    public void removeItem(String[] name){
        if (name!=null) {
            for (int i=0; i<name.length; i++)
                buylist.remove(name[i]);
        }
    }
    //从购物车中将指定名称的商品数量-1
    public void minusItem(String name){
        Food temp = (Food) buylist.get(name);
        if (temp != null) {
            int num = temp.getBuyNum();
            if(num>1)
                temp.setBuyNum(num-1);
            else if(num==1)
                buylist.remove(name);
        }
    }
    //清空购物车
    public void clearCar(){
        buylist.clear();
    }
}
