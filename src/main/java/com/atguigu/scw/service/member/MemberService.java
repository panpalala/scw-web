package com.atguigu.scw.service.member;


import org.springframework.web.multipart.MultipartFile;

import com.atguigu.scw.bean.TMember;

/**
 * @author panpala
 * @date 2017年8月7日
 */
public interface MemberService {

	Boolean saveMember(TMember member);
	
	TMember selectMember(TMember member);

	void sendEmail(String email);

	void modifyPassword(String token, String password);

	void saveMemberCerts(Integer[] certids, MultipartFile[] files,Integer mid);

	void updateMember(TMember member);

	String sendApplyEmail(String email);
	
}
