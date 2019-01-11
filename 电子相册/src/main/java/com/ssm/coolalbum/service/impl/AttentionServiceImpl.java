package com.ssm.coolalbum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.coolalbum.mapper.AttentionMapper;
import com.ssm.coolalbum.pojo.Attention;
import com.ssm.coolalbum.service.AttentionService;
@Service
public class AttentionServiceImpl implements AttentionService {
	@Autowired
	private AttentionMapper attentionMapper;

	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void AttentionThisUser(int myId, int hisId) {
		// TODO Auto-generated method stub
		Attention attention = new Attention();
		attention.setUserId(myId);
		attention.setUserId1(hisId);
		attentionMapper.addAttention(attention);
	}

	@Override
	public List<Attention> getAttentionsThisUser(int userId) {
		// TODO Auto-generated method stub
		List<Attention> attentions = attentionMapper.getAttentionsByUserId(userId);
		return attentions;
	}

}
