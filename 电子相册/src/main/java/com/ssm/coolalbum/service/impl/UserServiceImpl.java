package com.ssm.coolalbum.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.coolalbum.mapper.UserMapper;
import com.ssm.coolalbum.pojo.User;
import com.ssm.coolalbum.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	/**
	 * @author 李彪
	 * @param username
	 *            , password 登录
	 */
	public User login(String username, String password) {
		// TODO Auto-generated method stub

		User user = userMapper.getUserByUserNameAndPassword(username, password);
		if (user == null) {
			return user;
		} else if (user.getUserName().equals(username) && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
	public boolean register(User user) {
		try {
			userMapper.addUser(user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public User getUserMsgThisUser(int userId) {
		// TODO Auto-generated method stub
		return userMapper.getUser(userId);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user);
	}

	@Override
	public boolean isExist(String username) {
		// TODO Auto-generated method stub
		User user = userMapper.isExist(username);
		if(user == null)
			return false;
		return true;
	}

}
