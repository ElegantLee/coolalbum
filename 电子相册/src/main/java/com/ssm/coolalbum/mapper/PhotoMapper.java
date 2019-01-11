package com.ssm.coolalbum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssm.coolalbum.pojo.Photo;
import com.ssm.coolalbum.pojo.User;
@Repository
public interface PhotoMapper {
	
	/**
	 * 添加一张照片
	 * @param photo
	 */
	public void addPhoto(Photo photo);
	
	/**
	 * 更新一张照片
	 * @param photo
	 */
	public void updatePhoto(Photo photo);
	
	/**
	 * 删除一张照片
	 * @param id
	 */
	public void deletePhoto(int id);
	
	/**
	 * 获取该Id的照片
	 * @param id
	 * @return 该Id的照片
	 */
	public Photo getPhoto(int id);
	
	/**
	 * 根据相册类型和数量获取照片
	 * @param albumType
	 * @param num
	 * @return List<Photo>
	 */
	public List<Photo> getPhotosByAlbumTypeAndNum(@Param("albumType")String albumType, @Param("num")int num);
	/**
	 * 根据相册类型获取照片
	 * @param albumType
	 * @return List<Photo>
	 */
	public List<Photo> getPhotosByAlbumType(String albumType);
	/**
	 * 根据albumId删除所有照片
	 * @param albumId
	 */
	public void deletePhotosByAlbumId(int albumId);
	/**
	 * 返回相似相片名的相片集合
	 * @param photoName
	 * @return
	 */
	public List<Photo> getPhotosByPhotoName(String photoName);
	/**
	 * 返回相册名相似的相片集合
	 * @param albumName
	 * @return
	 */
	public List<Photo> getPhotosByAlbumName(String albumName);
	
	/**
	 * 根据albumId查询相册相片数量
	 */
	public int queryPhotoNumByAlbumId(int albumId);
	
	/**
	 * 根据albumId获取照片
	 * @param albumId
	 * @return 该相册的照片
	 */
	public List<Photo> getPhotosByAlbumId(int albumId);
	
	/**
	 * 根据albumId获取照片
	 * @param albumId
	 * @return 该相册的照片
	 */
	public Photo getPhotoByAlbumId(int albumId);
	
	
}
