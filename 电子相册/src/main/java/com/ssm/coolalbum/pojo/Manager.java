package com.ssm.coolalbum.pojo;

public class Manager {
	private int id;//管理员ID
	private String managerName;//管理员账号
	private String mPassword;//管理员密码
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	@Override
	public String toString() {
		return "Manager [id=" + id + ", managerName=" + managerName + ", mPassword=" + mPassword + "]";
	}
	
}
