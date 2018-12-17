package mypack.bean;

import java.sql.Time;
import java.util.Date;

public class Buy_ticketBeanzhunbeishan {
	private Date buy_date;
	private Time buy_time;
	private int train_id;
	private String passenger_idcard;
	private double price;
	private String passenger_seat_type;
	
	public Buy_ticketBeanzhunbeishan() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public Time getBuy_time() {
		return buy_time;
	}
	public void setBuy_time(Time buy_time) {
		this.buy_time = buy_time;
	}
	public int getTrain_id() {
		return train_id;
	}
	public void setTrain_id(int train_id) {
		this.train_id = train_id;
	}
	public String getPassenger_idcard() {
		return passenger_idcard;
	}
	public void setPassenger_idcard(String passenger_idcard) {
		this.passenger_idcard = passenger_idcard;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPassenger_seat_type() {
		return passenger_seat_type;
	}
	public void setPassenger_seat_type(String passenger_seat_type) {
		this.passenger_seat_type = passenger_seat_type;
	}
	
}
