package com.ssm.coolalbum.pojo;

import java.util.List;

public class Album {
	private int id;//相册ID
	private int userId;//用户名
	private String albumName;//相册名
	private String secreRank;//密级
	private String albumPassword;//相册密码
	private String albumType;//相册种类
	private List<Photo> photos;//图片
	private int photoNum;
	
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
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
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getSecreRank() {
		return secreRank;
	}
	public void setSecreRank(String secreRank) {
		this.secreRank = secreRank;
	}
	public String getAlbumPassword() {
		return albumPassword;
	}
	public void setAlbumPassword(String albumPassword) {
		this.albumPassword = albumPassword;
	}
	public String getAlbumType() {
		return albumType;
	}
	public void setAlbumType(String albumType) {
		this.albumType = albumType;
	}
	public List<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}
	@Override
	public String toString() {
		return "Album [id=" + id + ", userId=" + userId + ", albumName=" + albumName + ", secreRank=" + secreRank
				+ ", albumPassword=" + albumPassword + ", albumType=" + albumType + ", photos=" + photos + "]";
	}
	
	
}
