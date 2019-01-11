package com.ssm.coolalbum.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	
	@RequestMapping(value="/logout.action")
	public ModelAndView logout(HttpSession session){
		System.out.println("logout");
		ModelAndView mView = new ModelAndView();
		session.invalidate();
		mView.setViewName("redirect：index");
		return mView;
	}
	
}
