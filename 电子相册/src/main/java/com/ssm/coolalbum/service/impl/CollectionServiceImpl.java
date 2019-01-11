package com.ssm.coolalbum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.coolalbum.mapper.CollectionMapper;
import com.ssm.coolalbum.pojo.Collection;
import com.ssm.coolalbum.service.CollectionService;
@Service
public class CollectionServiceImpl implements CollectionService{
	@Autowired
	private CollectionMapper collectionMapper;
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public boolean collecteThisPhoto(int userId,int photoId) {
		// TODO Auto-generated method stub
		Collection collection = new Collection();
		collection.setPhotoId(photoId);
		collection.setUserId(userId);
		Collection collection1 = collectionMapper.getCollectionByUserIdAndPhotoId(userId,photoId);
		if(collection1==null){
			collectionMapper.addCollection(collection);
			return true;
		}
		return false;
	}

	@Override
	public List<Collection> getCollectionsThisUser(int userId) {
		// TODO Auto-generated method stub
		List<Collection> collections = collectionMapper.getCollectionsByUserId(userId);
		return collections;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void deleteCollectionByUserIdAndPhotoId(int userId,int photoId) {
		// TODO Auto-generated method stub
		collectionMapper.deleteCollection(userId,photoId);
	}
	
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void deleteCollectionByPhotoId(int photoId) {
		// TODO Auto-generated method stub
		collectionMapper.deleteCollectionByPhotoId(photoId);
	}

}
