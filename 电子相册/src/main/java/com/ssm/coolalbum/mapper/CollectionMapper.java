package com.ssm.coolalbum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssm.coolalbum.pojo.Collection;
@Repository
public interface CollectionMapper {
	/**
	 * 添加一个收藏
	 * @param collection
	 */
	public void addCollection(Collection collection);
	
	/**
	 * 更新一个收藏
	 * @param collection
	 */
	public void updateCollection(Collection collection);
	
	/**
	 * 删除一个收藏
	 * @param id
	 */
	public void deleteCollection(@Param("userId")int userId,@Param("photoId")int photoId);
	
	/**
	 * 获取指定useID的所有收藏
	 * @param userId
	 * @return 指定useID的所有收藏
	 */
	public List<Collection> getCollectionsByUserId(int userId);
	
	/**
	 * 根据userId获取收藏
	 * @param userId
	 * @return 该用户的收藏
	 */
	public Collection getCollectionByUserId(int userId);
	/**
	 * 删除指定相册Id的收藏
	 * @param albumId
	 */
	public void deleteCollectionsByAlbumId(int albumId);
	/**
	 * 根据userId和photoid获取收藏
	 * @param userId
	 * @param photoId
	 * @return
	 */
	public Collection getCollectionByUserIdAndPhotoId(@Param("userId")int userId,@Param("photoId")int photoId);

	/**
	 * 根据photoId删除一个收藏
	 * @param id
	 */
	public void deleteCollectionByPhotoId(int photoId);
}
