package com.ssm.coolalbum.service;

import java.util.List;

import com.ssm.coolalbum.pojo.Album;

public interface AlbumService {
	/**
	 * 获取指定用户的所有相册
	 * @param userId
	 * @return 指定用户的所有相册
	 */
	public List<Album> getAlbumsThisUser(int userId);
	/**
	 * 添加一个相册
	 *  @param album
	 * @return 该相册
	 */
	public Album addAlbum(Album album);
	/**
	 * 删除该Id的相册
	 * @param id
	 */
	public void deleteAlbum(int id);
	
	/**
	 * 根据相册Id修改相册名
	 * @param id
	 */
	public void updateAlbumByAlbumID(Album album);
}
