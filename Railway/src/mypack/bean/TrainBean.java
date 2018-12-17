package mypack.bean;

import java.sql.Time;
import java.util.Date;

public class TrainBean {
	private int train_id;
	private String train_num;
	private String Start_station;
	private String end_station;
	private Time start_time;
	private Time end_time;
	private double two_price;
	private double one_price;
	private double business_price;
	private int two_seat_num;
	private int one_seat_num;
	private int business_seat_num;
	
	public String getTrain_num() {
		return train_num;
	}
	public void setTrain_num(String train_num) {
		this.train_num = train_num;
	}
	public String getStart_station() {
		return Start_station;
	}
	public void setStart_station(String start_station) {
		Start_station = start_station;
	}
	public String getEnd_station() {
		return end_station;
	}
	public void setEnd_station(String end_station) {
		this.end_station = end_station;
	}
	public Date getStart_time() {
		return start_time;
	}
	@SuppressWarnings("deprecation")
	public void setStart_time(Time start_time) {
		this.start_time = start_time;
		int hour = this.start_time.getHours();
		this.start_time.setHours(hour-8);
	}
	public Date getEnd_time() {
		return end_time;
	}
	@SuppressWarnings("deprecation")
	public void setEnd_time(Time end_time) {
		this.end_time = end_time;
		int hour = this.end_time.getHours()-8;
		this.end_time.setHours(hour);
	}
	public double getTwo_price() {
		return two_price;
	}
	public void setTwo_price(double two_price) {
		this.two_price = two_price;
	}
	public double getOne_price() {
		return one_price;
	}
	public void setOne_price(double one_price) {
		this.one_price = one_price;
	}
	public double getBusiness_price() {
		return business_price;
	}
	public void setBusiness_price(double business_price) {
		this.business_price = business_price;
	}
	public int getTwo_seat_num() {
		return two_seat_num;
	}
	public void setTwo_seat_num(int two_seat_num) {
		this.two_seat_num = two_seat_num;
	}
	public int getOne_seat_num() {
		return one_seat_num;
	}
	public void setOne_seat_num(int one_seat_num) {
		this.one_seat_num = one_seat_num;
	}
	public int getBusiness_seat_num() {
		return business_seat_num;
	}
	public void setBusiness_seat_num(int business_seat_num) {
		this.business_seat_num = business_seat_num;
	}
	public int getTrain_id() {
		return train_id;
	}
	public void setTrain_id(int train_id) {
		this.train_id = train_id;
	}
	
	
}
