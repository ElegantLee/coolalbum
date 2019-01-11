package com.ssm.coolalbum.pojo;


public class Photo {
	private int id;//图片ID
	private int albumId;//相册ID
	private String address;//图片地址
	private String photoName;//图片名称
	private int praisePoint;//点赞数
	private String collectionFlag;//是否收藏
	
	public String getCollectionFlag() {
		return collectionFlag;
	}
	public void setCollectionFlag(String collectionFlag) {
		this.collectionFlag = collectionFlag;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAlbumId() {
		return albumId;
	}
	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public int getPraisePoint() {
		return praisePoint;
	}
	public void setPraisePoint(int praisePoint) {
		this.praisePoint = praisePoint;
	}
	@Override
	public String toString() {
		return "Photo [id=" + id + ", albumId=" + albumId + ", address=" + address + ", photoName=" + photoName
				+ ", praisePoint=" + praisePoint + "]";
	}
	
	
	
}
