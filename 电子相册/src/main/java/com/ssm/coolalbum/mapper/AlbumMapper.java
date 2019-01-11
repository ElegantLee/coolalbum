package com.ssm.coolalbum.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssm.coolalbum.pojo.Album;
@Repository
public interface AlbumMapper {
	/**
	 * 插入一个相册
	 * @param albnum
	 */
	public void addAlbum(Album albnum);
	/**
	 * 更新一个相册
	 * @param albnum
	 */
	public void updateAlbum(Album albnum);
	/**
	 * 删除一个相册
	 * @param id
	 */
	public void deleteAlbum(int id);
	/**
	 * 根据userId获取相册
	 * @param userId
	 * @return
	 */
	public Album getAlbumByUserId(int userId);
	/**
	 * 获取该相册下的图片
	 * @param id
	 * @return 包含图片的相册
	 */
	public Album getAlbumIncludePhoto(int id);
	/**
	 * 获取指定userId下的所有相册
	 * @param userId
	 * @return
	 */
	public List<Album> getAlbumsByUserId(int userId);
	
	/**
	 * 根据相册Id修改相册名
	 * @param id
	 */
	public void updateAlbumByAlbumID(Album album);
}
