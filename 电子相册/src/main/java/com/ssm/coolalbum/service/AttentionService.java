package com.ssm.coolalbum.service;

import java.util.List;

import com.ssm.coolalbum.pojo.Attention;

public interface AttentionService {
	/**
	 * 关注这个用户
	 * @param myId
	 * @param hisId
	 */
	public void AttentionThisUser(int myId,int hisId);
	/**
	 * 获取指定用户的所有关注关系
	 * @param userId
	 * @return 指定用户的所有关注关系
	 */
	public List<Attention> getAttentionsThisUser(int userId);
}
