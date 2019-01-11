package com.ssm.coolalbum.service;

import com.ssm.coolalbum.pojo.User;

public interface UserService {
	
	/**
	 * 登录服务
	 * @param username
	 * @param password
	 * @return 有则返回用户，否则返回null
	 */
	public User login(String username,String password) throws Exception;
	
	
	/**
	 * 注册服务
	 * @param user
	 * @return 注册成功返回该用户，否则返回null
	 */
	public boolean register(User user);
	
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return 存在则返回true
	 */
	public boolean isExist(String username);
	
	
	/**
	 * 获取指定用户Id的资料
	 * @param userId
	 * @return 指定用户Id的资料
	 */
	public User getUserMsgThisUser(int userId);
	
	
	/**
	 * 更新一个用户资料
	 * @param user
	 */
	public void updateUser(User user);
}
