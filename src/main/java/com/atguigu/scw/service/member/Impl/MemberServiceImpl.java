package com.atguigu.scw.service.member.Impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.druid.pool.DruidDataSource.CreateConnectionTask;
import com.atguigu.project.MD5Util;
import com.atguigu.scw.bean.TMember;
import com.atguigu.scw.bean.TMemberCert;
import com.atguigu.scw.bean.TMemberCertExample;
import com.atguigu.scw.bean.TMemberExample;
import com.atguigu.scw.bean.TPwdTokenExample;
import com.atguigu.scw.bean.TMemberExample.Criteria;
import com.atguigu.scw.bean.TPwdToken;
import com.atguigu.scw.dao.TMemberCertMapper;
import com.atguigu.scw.dao.TMemberMapper;
import com.atguigu.scw.dao.TPwdTokenMapper;
import com.atguigu.scw.service.member.MemberService;
import com.atguigu.scw.util.ConstantWeb;
import com.atguigu.scw.util.ScwUtil;

/**
 * @author panpala
 * @date 2017年8月7日
 */
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	TMemberMapper memberMapper;
	
	@Autowired
	TPwdTokenMapper pwdTokenMapper;
	
	@Autowired
	TMemberCertMapper memberCertMapper;

	@Override
	public Boolean saveMember(TMember member) {
		member.setUserpswd(MD5Util.digest(member.getUserpswd()));
		member.setRealname(member.getLoginacct());
		member.setUsername(member.getLoginacct());
		member.setAuthstatus(ConstantWeb.AUTH_NO);
		member.setUsertype("0");
		int row = memberMapper.insertSelective(member);
		return row > 0;
	}

	@Override
	public TMember selectMember(TMember member) {
		TMemberExample example = new TMemberExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginacctEqualTo(member.getLoginacct());
		criteria.andUserpswdEqualTo(MD5Util.digest(member.getUserpswd()));
		List<TMember> list = memberMapper.selectByExample(example);
		return list.size() == 1 ? list.get(0) : null;
	}

	@Override
	public void sendEmail(String email) {
		TMemberExample example = new TMemberExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmailEqualTo(email);
		List<TMember> list = memberMapper.selectByExample(example);
		TMember member = list.size() == 1 ? list.get(0) : null;
		if(member != null) {
			int userId = member.getId();
			String token = UUID.randomUUID().toString().replaceAll("-", "");
			TPwdToken pwdToken = new TPwdToken();
			pwdToken.setUserid(userId);
			pwdToken.setToken(token);
			
			try {
				HtmlEmail htmlEmail = new HtmlEmail();
				//设置邮箱主机名
				htmlEmail.setHostName("localhost");
				//设置邮件发送的相关信息
				htmlEmail.setFrom("779196197@atguigu.com");
				htmlEmail.addTo(email);
				htmlEmail.setCharset("UTF-8");
				htmlEmail.setSubject("密码重置邮件！");
				String html = "<a href='http://localhost:8088/scw-web/resetPWD?token=" + token + "'>点击重置密码</a>";
				htmlEmail.setContent(html, "text/html;charset=UTF-8");
				//设置邮箱登录帐号
				htmlEmail.setAuthentication("779196197@atguigu.com", "123456");
				//发送邮件，成功后将用户id和token保存到数据库
				htmlEmail.send();
				pwdTokenMapper.insertSelective(pwdToken);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void modifyPassword(String token, String password) {
		//根据token值查出TPwdToken对象
		TPwdTokenExample example = new TPwdTokenExample();
		com.atguigu.scw.bean.TPwdTokenExample.Criteria criteria = example.createCriteria();
		criteria.andTokenEqualTo(token);
		List<TPwdToken> list = pwdTokenMapper.selectByExample(example);
		//如果list不为空，则按照会员id和新密码更新用户信息到数据库
		if(list.size() == 1) {
			TPwdToken pwdToken = list.get(0);
			Integer userid = pwdToken.getUserid();
			TMember member = new TMember();
			member.setId(userid);
			member.setUserpswd(MD5Util.digest(password));
			memberMapper.updateByPrimaryKeySelective(member);
		}
		//更新完删掉t_pwd_token表的对应数据
		pwdTokenMapper.deleteByExample(example);
	}

	
	@Override
	public void saveMemberCerts(Integer[] certids, MultipartFile[] files,Integer mid) {
		//每次保存前，先将该会员保存的信息删除，保证唯一性
		TMemberCertExample example = new TMemberCertExample();
		com.atguigu.scw.bean.TMemberCertExample.Criteria criteria = example.createCriteria();
		criteria.andMemberidEqualTo(mid);
		memberCertMapper.deleteByExample(example);
		try {
			List<String> paths = ScwUtil.getCertsPath(files);
			//创建一个list集合存放封装后TMemberCert对象
			List<TMemberCert> list = new ArrayList<>();
			//遍历资质id和图片路径，一一对应的存入TmemberCert对象,并加入集合
			for (int i = 0; i < certids.length; i++) {
				TMemberCert memberCert = new TMemberCert();
				memberCert.setMemberid(mid);
				memberCert.setCertid(certids[i]);
				memberCert.setIconpath(paths.get(i));
				list.add(memberCert);
			}
			//批量插入TMemberCert对象
			memberCertMapper.insertBatchMemberCerts(list);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMember(TMember member) {
		memberMapper.updateByPrimaryKeySelective(member);
	}
	
	@Override
	public String sendApplyEmail(String email) {
		try {
			HtmlEmail htmlEmail = new HtmlEmail();
			//设置邮箱主机名
			htmlEmail.setHostName("localhost");
			//设置邮件发送的相关信息
			htmlEmail.setFrom("779196197@atguigu.com");
			htmlEmail.addTo(email);
			htmlEmail.setCharset("UTF-8");
			htmlEmail.setSubject("实名认证-申请");
			String code = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 5);
			htmlEmail.setMsg("您好，您的验证码为：" + code + ",请在十分钟内使用！");
			htmlEmail.setAuthentication("779196197@atguigu.com", "123456");
			//发送邮件，成功后将用户id和token保存到数据库
			htmlEmail.send();
			return code;
		} catch (EmailException e) {
			e.printStackTrace();
			return null;
		}
	}

}
