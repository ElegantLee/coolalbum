package com.ssm.coolalbum.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssm.coolalbum.pojo.User;
@Repository
public interface UserMapper {
	
	/**
	 * 添加一个用户
	 * @param usr
	 */
	public void addUser(User usr);
	
	
	/**
	 * 更新一个用户
	 * @param usr
	 */
	public void updateUser(User usr);
	
	
	/**
	 * 获取指定id的用户
	 * @param id
	 * @return 指定id的用户
	 */
	public User getUser(int id);
	
	/**
	 * 获取指定用户名的用户
	 * @param username
	 * @return 指定username的用户
	 */
	public User isExist(String username);
	
	/**
	 * 获取该用户通过userName和password
	 * @param userName
	 * @param password
	 * @return User
	 */
	public User getUserByUserNameAndPassword(@Param("userName")String userName,@Param("password")String password);
	
	
	/**
	 * 删除一个用户
	 * @param username
	 */
	public void deleteUser(int id);
	
	
	/**
	 * 获取所有用户
	 * @return 所有用户
	 */
	public List<User> getUsers();
	
	
	/**
	 * 获取该用户包含他的相册
	 * @param id
	 * @return 包含相册的用户
	 */
	public User getUserIncludeAlbum(int id);
	
	
	/**
	 * 获取该用户包含他的关注关系
	 * @param id
	 * @return 包含关注关系的用户
	 */
	public User getUserIncludeAttention(int id);
	
	
	/**
	 * 获取该用户包含他的收藏
	 * @param id
	 * @return 包含收藏的用户
	 */
	public User getUserIncludeCollection(int id);
}
