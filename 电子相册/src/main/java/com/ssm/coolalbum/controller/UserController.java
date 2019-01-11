package com.ssm.coolalbum.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.ssm.coolalbum.pojo.User;
import com.ssm.coolalbum.service.UserService;
import com.sun.mail.util.LogOutputStream;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login.action", method = { RequestMethod.POST })
	public ModelAndView login(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mView = new ModelAndView();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String codeInput = request.getParameter("codeInput");
		String safecode = (String) session.getAttribute("safecode");
		User loginUser = userService.login(username, password);
		if (codeInput.compareToIgnoreCase(safecode) == 0) {
			if (loginUser != null) {
				session.setAttribute("user", loginUser);
				mView.setViewName("album");
				return mView;
			} else {
				// String messgeString = "<div class='layui-layer
				// layui-layer-dialog layui-layer-border layui-layer-msg
				// layui-layer-hui' id='error-message' type='dialog' times='20'
				// showtime='3000' contype='string' style='z-index: 19891034;
				// top: 293px; left: 338px;' >"
				// + "<div id class='layui-layer-content'>账号或密码错误！</div>"
				// + "<span class='layui-layer-setwin'></span></div>";
				mView.addObject("msg", "账号或密码错误！");
				mView.setViewName("login");
				return mView;
			}
		}
		mView.setViewName("login");
		mView.addObject("msg", "验证码错误！");
		return mView;
	}
	
	@RequestMapping(value="/logout.action")
	public ModelAndView logout(HttpSession session){
		System.out.println("logout");
		ModelAndView mView = new ModelAndView();
		session.invalidate();
		mView.setViewName("index");
		return mView;
	}
	
	@RequestMapping(value = "/register.action", method = { RequestMethod.POST })
	@ResponseBody
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User user = new User();
		user.setUserName(username);
		user.setPassword(password);
		user.setEmail(email);
		if (userService.register(user)) {
			mView.setViewName("album");
			return mView;
		}
		mView.addObject("msg", "注册失败");
		mView.setViewName("register");
		return mView;

	}

	@RequestMapping(value = "/isExist.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String isExistController(@RequestParam("username") String username) {
		System.out.println(username);
		boolean isExist = userService.isExist(username);
		Map<String, Object> mp = new HashMap<String, Object>();
		if (isExist) {
			mp.put("msg", "用户已存在");
			String msg = new JSONObject(mp).toString();
			return msg;
		} else {
			mp.put("msg", "还没人用这个名字");
			String msg = new JSONObject(mp).toString();
			return msg;
		}
	}

	@RequestMapping(value = "/updateInfo.action", method = { RequestMethod.POST })
	public ModelAndView updateInfoController(User testUser, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println(testUser);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String birthDate = request.getParameter("birthDate");
		String email = request.getParameter("email");
		String avatar = request.getParameter("newAvatar");
		if ("1".equals(gender)) {
			gender = "男";
		} else if ("2".equals(gender)) {
			gender = "女";
		}
		User user = (User) session.getAttribute("user");
		user.setUserName(username);
		user.setPassword(password);
		user.setBirthDate(birthDate);
		user.setSex(gender);
		user.setEmail(email);
		user.setAvar(avatar);
		System.out.println(user);
		userService.updateUser(user);
		session.setAttribute("user", user);
		mv.setViewName("album");
		return mv;
	}

	@RequestMapping(value = "/updateAvatar.action")
	@ResponseBody
	public String updateAvatarController(HttpServletRequest request, HttpSession session,
			@Param("file") MultipartFile file) throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String res = sdf.format(new Date());
		// 服务器上使用
		String rootPath = request.getServletContext().getRealPath("/images/avatar/");// target的目录
		// System.out.println("rootPath: " + rootPath);
		// 本地使用
		// String rootPath ="/Users/liuyanzhao/Documents/uploads/";
		// 获得用户名
		User user = (User) session.getAttribute("user");
		String username = user.getUserName();
		// 图片原始名称
		String originalFilename = file.getOriginalFilename();
		// 新的文件名称
		String newFileName = res + originalFilename.substring(originalFilename.lastIndexOf("."));
		// System.out.println("newFileName: " + newFileName);
		// 创建用户文件夹
		File dateDirs = new File(username);
		// 新文件
		File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
		// 判断目标文件所在的目录是否存在
		if (!newFile.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			newFile.getParentFile().mkdirs();
		}
		// System.out.println("newFile: " + newFile);
		// 将内存中的数据写入磁盘
		file.transferTo(newFile);
		// 完整的url
		String fileUrl = "images/avatar/" + username + "/" + newFileName;
		 user.setAvar(fileUrl);
		 session.setAttribute("user", user);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("code", 0);// 0表示成功，1失败
		map.put("msg", "上传成功");// 提示消息
		map.put("data", map2);
		map2.put("src", fileUrl);// 图片url
		map2.put("title", newFileName);// 图片名称，这个会显示在输入框里
		String result = new JSONObject(map).toString();
		// System.out.println("result: " + result);
		return result;
	}

}
