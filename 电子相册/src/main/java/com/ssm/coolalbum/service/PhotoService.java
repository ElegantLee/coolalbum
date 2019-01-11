package com.ssm.coolalbum.service;

import java.util.List;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.coolalbum.pojo.Album;
import com.ssm.coolalbum.pojo.Photo;

public interface PhotoService {
	/**
	 * 给这张图片点赞
	 * @param photoId
	 */
	public int praiseThisPhoto(int photoId);
	/**
	 * 获取指定相册类型和数量的照片List
	 * @param albumType
	 * @param num
	 * @return 指定相册类型和数量的照片List
	 */
	public List<Photo> getPhotosByAlbumTypeAndNum(String albumType,int num);
	/**
	 * 获取指定相册类型的所有照片
	 * @param albumType
	 * @return 指定相册类型的所有照片
	 */
	public List<Photo> getPhotosByAlbumType(String albumType);
	/**
	 * 上传指定照片信息的照片
	 * @param photo
	 * @param album
	 * @param userId
	 */
	public void uploadPhoto(Photo photo);
	/**
	 * 更新图片信息
	 * @param photo
	 */
	public void updatePhoto(Photo photo);
	/**
	 * 删除指定Id的照片
	 * @param photoId
	 */
	public void deletePhoto(int photoId);
	/**
	 * 根据albumId删除所有照片
	 */
	public void delePhotosByAlbumId(int albumId);
	/**
	 * 根据相片名返回相似的照片
	 * @param photoName
	 * @return
	 */
	public List<Photo> getPhotosByPhotoName(String photoName);
	/**
	 * 根据相册名返回相似的照片
	 * @param albumName
	 * @return
	 */
	public List<Photo> getPhotosByAlbumName(String albumName);
	
	/**
	 * 根据albumId查询相册图片数量
	 */
	public int queryPhotoNumByAlbumId(int albumId);
	
	/**
	 * 根据albumId查询相册图片
	 */
	public List<Photo> getPhotosByAlbumId(int albumId);
	
	/**
	 * 添加圖片
	 * @param photoId
	 */
	public void addPhoto(Photo photo);
	
	
}
