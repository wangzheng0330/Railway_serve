package mypack.bean;


public class UserBean {//用户登陆Bean
	private String num; //身份证
	private String username;//用户名
	private String password; //密码
	private String email; //邮箱
	private String tel; //电话
	private String zj_type; //证件类型
	private String name; //姓名
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZj_type() {
		return zj_type;
	}
	public void setZj_type(String zj_type) {
		this.zj_type = zj_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
