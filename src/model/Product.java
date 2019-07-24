package model;

import java.sql.Timestamp;

public class Product {
	
	private int num;
	private String season;
	private String pkind;
	private String brand;
	private String code;
	private String color;
	private String pname;
	private String sex;
	private int price;
	private int cartcount;
	private int readcount;
	private int sellqty;
	private int stock;
	private String photo1;
	private String photo2;
	private String photo3;
	private String photo4;
	private String photo5;
	private Timestamp reg_date;
	private String sale;
	
	
	
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getPkind() {
		return pkind;
	}

	public void setPkind(String pkind) {
		this.pkind = pkind;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCartcount() {
		return cartcount;
	}

	public void setCartcount(int cartcount) {
		this.cartcount = cartcount;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getSellqty() {
		return sellqty;
	}

	public void setSellqty(int sellqty) {
		this.sellqty = sellqty;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getPhoto1() {
		return photo1;
	}

	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}

	public String getPhoto2() {
		return photo2;
	}

	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}

	public String getPhoto3() {
		return photo3;
	}

	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}

	public String getPhoto4() {
		return photo4;
	}

	public void setPhoto4(String photo4) {
		this.photo4 = photo4;
	}

	public String getPhoto5() {
		return photo5;
	}

	public void setPhoto5(String photo5) {
		this.photo5 = photo5;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}

	
	@Override
	public String toString() {
		return "Product [num=" + num + ", season=" + season + ", pkind=" + pkind + ", brand=" + brand + ", code=" + code
				+ ", color=" + color + ", pname=" + pname + ", sex=" + sex + ", price=" + price + ", cartcount="
				+ cartcount + ", readcount=" + readcount + ", sellqty=" + sellqty + ", stock=" + stock + ", photo1="
				+ photo1 + ", photo2=" + photo2 + ", photo3=" + photo3 + ", photo4=" + photo4 + ", photo5=" + photo5
				+ ", reg_date=" + reg_date + ", sale=" + sale + "]";
	}
	
	
}
