package com.ssm.coolalbum.service;

import java.util.List;

import com.ssm.coolalbum.pojo.Collection;

public interface CollectionService {
	/**
	 * 收藏这张照片
	 * @param userId
	 * @param photoId
	 */
	public boolean collecteThisPhoto(int userId,int photoId);
	/**
	 * 获取指定用户的所有收藏
	 * @param userId
	 * @return 指定用户的所有收藏
	 */
	public List<Collection> getCollectionsThisUser(int userId);
	/**
	 * 删除一条记录
	 * @param collectionId
	 */
	public void deleteCollectionByUserIdAndPhotoId(int userId,int photoId);
	/**
	 * 根据photoId删除一条记录
	 * @param collectionId
	 */
	public void deleteCollectionByPhotoId(int photoId);
}
