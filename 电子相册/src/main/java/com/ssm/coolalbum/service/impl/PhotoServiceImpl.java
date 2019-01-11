package com.ssm.coolalbum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.coolalbum.mapper.CollectionMapper;
import com.ssm.coolalbum.mapper.PhotoMapper;
import com.ssm.coolalbum.pojo.Album;
import com.ssm.coolalbum.pojo.Photo;
import com.ssm.coolalbum.service.PhotoService;
@Service
public class PhotoServiceImpl implements PhotoService{
	@Autowired
	private PhotoMapper photoMapper;	
	@Autowired
	private CollectionMapper collectionMapper;	
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public int praiseThisPhoto(int photoId) {
		// TODO Auto-generated method stub
		Photo photo = photoMapper.getPhoto(photoId);
		photo.setPraisePoint(photo.getPraisePoint()+1);
		photoMapper.updatePhoto(photo);
		return photo.getPraisePoint();
	}

	@Override
	public List<Photo> getPhotosByAlbumTypeAndNum(String albumType, int num) {
		// TODO Auto-generated method stub
		List<Photo> photos = photoMapper.getPhotosByAlbumTypeAndNum(albumType, num);
		return photos;
	}

	@Override
	public List<Photo> getPhotosByAlbumType(String albumType) {
		// TODO Auto-generated method stub
		List<Photo> photos = photoMapper.getPhotosByAlbumType(albumType);
		return photos;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void uploadPhoto(Photo photo) {
		// TODO Auto-generated method stub
		photoMapper.addPhoto(photo);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void updatePhoto(Photo photo) {
		// TODO Auto-generated method stub
		photoMapper.updatePhoto(photo);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void deletePhoto(int photoId) {
		// TODO Auto-generated method stub
		collectionMapper.deleteCollectionByPhotoId(photoId);
		photoMapper.deletePhoto(photoId);
	}

	@Override
	public void delePhotosByAlbumId(int albumId) {
		// TODO Auto-generated method stub
		photoMapper.deletePhotosByAlbumId(albumId);
	}

	@Override
	public List<Photo> getPhotosByPhotoName(String photoName) {
		// TODO Auto-generated method stub
		return photoMapper.getPhotosByPhotoName(photoName);
	}

	@Override
	public List<Photo> getPhotosByAlbumName(String albumName) {
		// TODO Auto-generated method stub
		return photoMapper.getPhotosByAlbumName(albumName);
	}
	
	@Override
    @Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public int queryPhotoNumByAlbumId(int albumId)
    {   // TODO Auto-generated method stub
    	int num = photoMapper.queryPhotoNumByAlbumId(albumId);
    	return num;
    }
	
	@Override
    @Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
    public List<Photo> getPhotosByAlbumId(int albumId){
    	 // TODO Auto-generated method stub
    	List<Photo> photos = photoMapper.getPhotosByAlbumId(albumId);
    	return photos;
    }
	
	@Override
    @Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
    public void addPhoto(Photo photo){
    	photoMapper.addPhoto(photo);
    }

}
