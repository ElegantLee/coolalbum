package com.ssm.coolalbum.controller;

import java.util.List;
import java.util.function.ToDoubleBiFunction;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.coolalbum.pojo.Album;
import com.ssm.coolalbum.pojo.Photo;
import com.ssm.coolalbum.service.PhotoService;


	@Controller
	@RequestMapping("/dispatcher")
	public class DispatcherController {

//		@RequestMapping(value="/user.action",method={RequestMethod.GET})
//		public String toUser(){
//			System.out.println("可以");
//			return "album";
//		}
		
		@RequestMapping(value="/setting.action", method={RequestMethod.GET})
		public String toSetting(){
			return "setting";
		}
		
		@RequestMapping(value="/album.action",method={RequestMethod.GET})
		public String toAlbum(){
			return "album";
		}
		
		@RequestMapping(value="/new_album.action",method={RequestMethod.GET})
		public String toNew_album(){
			return "new_album";
		}
		
		
		@RequestMapping(value="/myphoto.action",method={RequestMethod.GET})
		public String toMyphoto(@RequestParam("albumid") String albumid,HttpServletRequest request){
			request.setAttribute("albumid", albumid);
			return "myphoto";
		}
		
		@RequestMapping(value="/login.action")
		public String toLogin(){
			return "login";
		}
		
		@RequestMapping(value="/register.action")
		public String toRegister(){
			return "register";
		}
		
		@RequestMapping(value="/safecode.action")
		public String toSafeCode(){
			return "safecode";
		}
		
		@RequestMapping(value="/collection.action")
		public String toCollection(){
			return "collection";
		}
		
}
