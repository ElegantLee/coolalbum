package com.ssm.coolalbum.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.coolalbum.pojo.Collection;
import com.ssm.coolalbum.pojo.Photo;
import com.ssm.coolalbum.service.CollectionService;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	@Autowired
	private CollectionService collectionServcie;
	@RequestMapping(value="/collectephoto.action",method={RequestMethod.POST})
	@ResponseBody
	public boolean collecteThisPhoto(Collection collection){
		boolean flag = collectionServcie.collecteThisPhoto(collection.getUserId(), collection.getPhotoId());
		return flag;
	}
	
	@RequestMapping(value="/deletecollectephoto.action",method={RequestMethod.POST})
	@ResponseBody
	public boolean deleteCollecteThisPhoto(Collection collection){
		collectionServcie.deleteCollectionByUserIdAndPhotoId(collection.getUserId(),collection.getPhotoId());
		return true;
	}
	
	@RequestMapping(value="/querycollection.action",method={RequestMethod.POST})
	@ResponseBody
	public List<Photo> queryCollecetion(Collection collection){
		List<Collection> collections = collectionServcie.getCollectionsThisUser(collection.getUserId());
		List<Photo> photos = new ArrayList<Photo>();
		for (Collection collection2 : collections) {
			Photo photo = collection2.getPhoto();
			photo.setCollectionFlag("已收藏");
			photos.add(photo);
		}
		return photos;
	}
}
