package com.ssm.coolalbum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.coolalbum.mapper.AlbumMapper;
import com.ssm.coolalbum.mapper.CollectionMapper;
import com.ssm.coolalbum.mapper.PhotoMapper;
import com.ssm.coolalbum.pojo.Album;
import com.ssm.coolalbum.service.AlbumService;
@Service
public class AlbumServiceImpl implements AlbumService {
	@Autowired
	private AlbumMapper albumMapper;
	@Autowired
	private PhotoMapper photoMapper;
	@Autowired
	private CollectionMapper collectionMapper;
	@Override
	public List<Album> getAlbumsThisUser(int userId) {
		// TODO Auto-generated method stub
		List<Album> albums = albumMapper.getAlbumsByUserId(userId);
		return albums;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public Album addAlbum(Album album) {
		// TODO Auto-generated method stub
		albumMapper.addAlbum(album);
		return album;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void deleteAlbum(int id) {
		// TODO Auto-generated method stub
		collectionMapper.deleteCollectionsByAlbumId(id);
		photoMapper.deletePhotosByAlbumId(id);
		albumMapper.deleteAlbum(id);
	}
	
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void updateAlbumByAlbumID(Album album) {
		// TODO Auto-generated method stub
		albumMapper.updateAlbumByAlbumID(album);
	}
}
