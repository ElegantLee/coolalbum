package com.ssm.coolalbum.pojo;

import java.util.List;

public class User {
	private int id;// 用户ID
	private String userName; // 用户名
	private String password;// 用户密码
	private String email;// 用户邮箱
	private String sex;// 用户性别
	private String birthDate;// 用户出生日期
	private String avar;// 头像地址
	private List<Album> albums;//用户的相册
	private List<Attention> attentions;//用户的关注关系
	private List<Collection> collections;//用户的收藏
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}


	public String getAvar() {
		return avar;
	}

	public void setAvar(String avar) {
		this.avar = avar;
	}

	public List<Album> getAlbums() {
		return albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}

	public List<Attention> getAttentions() {
		return attentions;
	}

	public void setAttentions(List<Attention> attentions) {
		this.attentions = attentions;
	}

	public List<Collection> getCollections() {
		return collections;
	}

	public void setCollections(List<Collection> collections) {
		this.collections = collections;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", email=" + email + ", sex="
				+ sex + ", birthDate=" + birthDate + ", avar=" + avar + ", albums=" + albums + ", attentions="
				+ attentions + ", collections=" + collections + "]";
	}
	

	
	
}
