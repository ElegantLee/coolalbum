package com.ssm.coolalbum.pojo;

public class Attention {
	private int id;
	private int userId;//关注人id
	private int userId1;//被关注人id
	private String attentionTime;//关注时间
	private User user;//被关注人
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserId1() {
		return userId1;
	}
	public void setUserId1(int userId1) {
		this.userId1 = userId1;
	}
	public String getAttentionTime() {
		return attentionTime;
	}
	public void setAttentionTime(String attentionTime) {
		this.attentionTime = attentionTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Attention [id=" + id + ", userId=" + userId + ", userId1=" + userId1 + ", attentionTime="
				+ attentionTime + ", user=" + user + "]";
	}
	
}
