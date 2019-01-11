package com.ssm.coolalbum.pojo;

public class Collection {
	private int id;//id
	private int photoId;//图片ID
	private int userId;//用户名
	private String collectionTime;//收藏时间
	private Photo photo;//图片
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPhotoId() {
		return photoId;
	}
	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCollectionTime() {
		return collectionTime;
	}
	public void setCollectionTime(String collectionTime) {
		this.collectionTime = collectionTime;
	}
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "Collection [id=" + id + ", photoId=" + photoId + ", userId=" + userId + ", collectionTime="
				+ collectionTime + ", photo=" + photo + "]";
	}
	
}
