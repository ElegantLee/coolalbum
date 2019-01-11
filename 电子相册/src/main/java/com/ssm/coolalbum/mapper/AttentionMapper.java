package com.ssm.coolalbum.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssm.coolalbum.pojo.Attention;
@Repository
public interface AttentionMapper {
	/**
	 * 添加一个用户关系
	 * @param attention
	 */
	public void addAttention(Attention attention);
	
	/**
	 * 更新一个用户关系
	 * @param attention
	 */
	public void updateAttention(Attention attention);
	
	/**
	 * 删除一个用户关系
	 * @param username
	 */
	public void deleteAttention(int id);
	
	/**
	 * 获取所有用户关系
	 * @return 所有用户关系
	 */
	public List<Attention> getAttentionsByUserId(int userId);
	
	/**
	 * 根据
	 * @param userId
	 * @return
	 */
	public Attention getAttentionByUserId(int userId);
}
