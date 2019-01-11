package com.ssm.coolalbum.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.coolalbum.pojo.Album;
import com.ssm.coolalbum.pojo.Collection;
import com.ssm.coolalbum.pojo.Photo;
import com.ssm.coolalbum.pojo.User;
import com.ssm.coolalbum.service.AlbumService;
import com.ssm.coolalbum.service.CollectionService;
import com.ssm.coolalbum.service.PhotoService;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	@Autowired
	private PhotoService photoService;
	@Autowired
	private AlbumService albumService;
	@Autowired
	private CollectionService collectionService;

	/**
	 * 首页查询风景图片
	 * @param album
	 * @return
	 */
	@RequestMapping(value="/queryscenery.action",method={RequestMethod.POST})
	@ResponseBody
	public List<Photo> queryScenery(@RequestParam("userId")String userId,@RequestParam("albumType")String albumType){
		List<Photo> list = photoService.getPhotosByAlbumTypeAndNum(albumType,5);
		if(!userId.equals("")){
			List<Collection> collections = collectionService.getCollectionsThisUser(Integer.parseInt(userId));
			for (Photo photo : list) {
				for (Collection collection : collections) {
					if(photo.getId()==collection.getPhoto().getId()){
						photo.setCollectionFlag("已收藏");
					}
				}
			}
		}
		return list;
	}
	/**
	 * 首页查询人物图片
	 * @param album
	 * @return
	 */
	@RequestMapping(value="/queryperson.action",method={RequestMethod.POST})
	@ResponseBody
	public List<Photo> queryPerson(@RequestParam("userId")String userId,@RequestParam("albumType")String albumType){
		List<Photo> list = photoService.getPhotosByAlbumTypeAndNum(albumType,5);
		if(!userId.equals("")){
			List<Collection> collections = collectionService.getCollectionsThisUser(Integer.parseInt(userId));
			for (Photo photo : list) {
				for (Collection collection : collections) {
					if(photo.getId()==collection.getPhoto().getId()){
						photo.setCollectionFlag("已收藏");
					}
				}
			}
		}
		return list;
	}
	/**
	 * 首页查询汽车图片
	 * @param album
	 * @return
	 */
	@RequestMapping(value="/querycar.action",method={RequestMethod.POST})
	@ResponseBody
	public List<Photo> queryCar(@RequestParam("userId")String userId,@RequestParam("albumType")String albumType){
		List<Photo> list = photoService.getPhotosByAlbumTypeAndNum(albumType,5);
		if(!userId.equals("")){
			List<Collection> collections = collectionService.getCollectionsThisUser(Integer.parseInt(userId));
			for (Photo photo : list) {
				for (Collection collection : collections) {
					if(photo.getId()==collection.getPhoto().getId()){
						photo.setCollectionFlag("已收藏");
					}
				}
			}
		}
		return list;
	}
	/**
	 * 首页查询美食图片
	 * @param album
	 * @return
	 */
	@RequestMapping(value="/queryfood.action",method={RequestMethod.POST})
	@ResponseBody
	public List<Photo> queryFood(@RequestParam("userId")String userId,@RequestParam("albumType")String albumType){
		List<Photo> list = photoService.getPhotosByAlbumTypeAndNum(albumType,5);
		if(!userId.equals("")){
			List<Collection> collections = collectionService.getCollectionsThisUser(Integer.parseInt(userId));
			for (Photo photo : list) {
				for (Collection collection : collections) {
					if(photo.getId()==collection.getPhoto().getId()){
						photo.setCollectionFlag("已收藏");
					}
				}
			}
		}
		return list;
	}
	/**
	 * 首页查询其他图片
	 * @param album
	 * @return
	 */
	@RequestMapping(value="/queryother.action",method={RequestMethod.POST})
	@ResponseBody
	public List<Photo> queryOther(@RequestParam("userId")String userId,@RequestParam("albumType")String albumType){
		System.out.println("other: " + userId +" " + albumType);
		List<Photo> list = photoService.getPhotosByAlbumTypeAndNum(albumType,5);
		System.out.println(list);
		if(!userId.equals("")){
			List<Collection> collections = collectionService.getCollectionsThisUser(Integer.parseInt(userId));
			for (Photo photo : list) {
				for (Collection collection : collections) {
					if(photo.getId()==collection.getPhoto().getId()){
						photo.setCollectionFlag("已收藏");
					}
				}
			}
		}
		return list;
	}
	/**
	 * 查询更多图片
	 * @param album
	 * @return
	 */
	@RequestMapping(value="/querymore.action",method={RequestMethod.GET})
	public ModelAndView queryMore(@RequestParam("userId")String userId,@RequestParam("albumType")String albumType){
		List<Photo> list = photoService.getPhotosByAlbumType(albumType);
		if(!userId.equals("")){
			List<Collection> collections = collectionService.getCollectionsThisUser(Integer.parseInt(userId));
			for (Photo photo : list) {
				for (Collection collection : collections) {
					if(photo.getId()==collection.getPhoto().getId()){
						photo.setCollectionFlag("已收藏");
					}
				}
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("more_photo");
		mv.addObject("photos", list);
		return mv;
	}
	/**
	 * 点赞
	 * @param photo
	 * @return
	 */
	@RequestMapping(value="/praisepoint.action",method={RequestMethod.POST})
	@ResponseBody
	public int queryMore(Photo photo){
		int praisePoint = photoService.praiseThisPhoto(photo.getId());
		return praisePoint;
	}
	/**
	 * 搜索图片
	 * @param photo
	 * @return
	 */
	@RequestMapping(value="/search.action",method={RequestMethod.POST})
	public ModelAndView searchPhoto(@RequestParam("searchType")String searchType,@RequestParam("content")String content){
		System.out.println(searchType + content);
		ModelAndView mv = new ModelAndView();
		content="%"+content+"%";
		List<Photo> photos=null;
		if(searchType.equals("0")){
			photos=photoService.getPhotosByPhotoName(content);
		}
		else if(searchType.equals("1")){
			photos=photoService.getPhotosByAlbumName(content);
		}
		else;
		mv.addObject("photos", photos);
		System.out.println(photos);
		mv.setViewName("more_photo");
		return mv;
	}

	// 显示相册
	@RequestMapping(value = "/queryalbum.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<Album> queryAlbum(Album album) {
		System.out.println("adasfasfsgas");
		// List<Photo> list =
		// photoService.getPhotosByAlbumType(album.getAlbumType());
		List<Album> list = albumService.getAlbumsThisUser(1);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPhotoNum(photoService.queryPhotoNumByAlbumId(list.get(i).getId()));
		}
		System.out.println(list);
		return list;
	}

	// 删除相册
	@RequestMapping(value = "/delalbum.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<Album> delAlbum(@RequestParam("albumid") int id) {
		System.out.println(id);
		albumService.deleteAlbum(id);
		// List<Photo> list =
		// photoService.getPhotosByAlbumType(album.getAlbumType());
		// System.out.println(list);
		List<Album> list = albumService.getAlbumsThisUser(1);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPhotoNum(photoService.queryPhotoNumByAlbumId(list.get(i).getId()));
		}
		System.out.println(list);
		return list;
	}

	// 编辑相册
	@RequestMapping(value = "/editalbum.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<Album> editAlbum(@RequestParam("albumid") int id, @RequestParam("name") String name) {
		System.out.println(id);
		System.out.println(name);
		Album album = new Album();
		album.setId(id);
		album.setAlbumName(name);
		albumService.updateAlbumByAlbumID(album);
		List<Album> list = albumService.getAlbumsThisUser(1);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setPhotoNum(photoService.queryPhotoNumByAlbumId(list.get(i).getId()));
		}
		System.out.println(list);
		return list;

	}

	// 我的相册
	@RequestMapping(value = "/albumphoto.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<Photo> editAlbum(@RequestParam("albumid") int albumid) {
		System.out.println("我的相册" + albumid);
		List<Photo> list = photoService.getPhotosByAlbumId(albumid);
		return list;

	}

	// 创建新相册
	@RequestMapping(value = "/queryscenery1.action", method = { RequestMethod.GET })
	public String test(@RequestParam("secreRank") String secreRank, @RequestParam("albumtype") String albumtype,
			@RequestParam("albumname") String albumname, HttpServletRequest request) {
		System.out.println("进入");
		Album album = new Album();
		album.setUserId(1);
		album.setSecreRank(secreRank);
		album.setAlbumType(albumtype);
		album.setAlbumPassword(request.getParameter("a"));
		album.setAlbumName(albumname);
		albumService.addAlbum(album);
		System.out.println(album.getAlbumName());
		System.out.println(album.getSecreRank());
		return "album";
	}

	// 上传图片
	@RequestMapping(value = "/onloadphoto.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<Photo> index(MultipartFile file, @RequestParam("albumid") String albumid, HttpServletRequest request,
			HttpSession session) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String res = sdf.format(new Date());
		String filename = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/images/UserPhoto/");
		// filename =
		// "D:\\Users\\Administrator\\workspace\\coolalbum\\WebContent\\images\\"
		// + filename.substring(filename.lastIndexOf("\\") + 1);
		String newFileName = res + filename.substring(filename.lastIndexOf("."));
		System.out.println(newFileName);
		// 获得用户名
		User user = (User) session.getAttribute("user");
		String username = user.getUserName();
		// 创建用户文件夹
		File dateDirs = new File(username);
		// 新文件
		File newFile = new File(path + File.separator + dateDirs + File.separator + newFileName);
		// 判断目标文件所在的目录是否存在
		if (!newFile.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			newFile.getParentFile().mkdirs();
		}
		file.getContentType();
		//File dest = new File(newFileName);
		//存入照片中的图片路径
		String photoUrl = "images/UserPhoto/" + username + "/" + newFileName;
		System.out.println(photoUrl);
		try {
			file.transferTo(newFile);
			Photo photo = new Photo();
			photo.setAlbumId(Integer.parseInt(albumid));
			photo.setAddress(photoUrl);
			photo.setPhotoName(newFileName);
			photo.setPraisePoint(0);
			photoService.addPhoto(photo);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<Photo> list = photoService.getPhotosByAlbumId(Integer.parseInt(albumid));
		return list;
	}

	// 删除照片
	@RequestMapping(value = "/delphoto.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<Photo> delPhoto(MultipartFile file, @RequestParam("cc") String[] list1,
			@RequestParam("albumid") String albumid) {
		System.out.println("del");
		System.out.println(albumid);
		for (int i = 0; i < list1.length; i++) {
			photoService.deletePhoto(Integer.parseInt(list1[i]));
		}

		List<Photo> list = photoService.getPhotosByAlbumId(Integer.parseInt(albumid));
		return list;
	}
}
