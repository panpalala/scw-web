package com.atguigu.scw.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.atguigu.scw.bean.Constant;
import com.atguigu.scw.bean.TCert;
import com.atguigu.scw.bean.TMember;
import com.atguigu.scw.service.member.CertService;
import com.atguigu.scw.service.member.MemberService;
import com.atguigu.scw.util.ScwUtil;

/**
 * @author panpala
 * @date 2017年8月9日
 * 
 * 将页面请求参数封装到HttpSession中的Tmemer对象中的方法
 * 类前面加上@SessionAttributes(value=存入session时的key)---
 * --告诉springmvc,session中有此键的对象，同时往session中存一份
 * 方法的参数列表写@ModelAttribute(value=存入session时的key)TMember member----
 * ----session中必须有此对象，没有的话，用modelattribute取会抛出异常！！！！！注意
 * 
 * 因为springmvc将请求参数封装到对象时，会从map,model,modelattribute中以类名首字母小写（TMember例外）查找对象
 * 有此对象就将其封装，然后将map,model,modelattribute放入隐含模型implicantModel中，随后放入请求域对象中
 *  没有此对象就利用反射创建一个对象来封装数据
 */
@SessionAttributes(value=Constant.LOGIN_USER)
@Controller
public class MemberAuthoriseController {
	
	 
	@Autowired
	CertService certService;
	
	@Autowired
	MemberService memberService;
	/*
	 * 去账户类型页面
	 * */
	@RequestMapping("/toaccttype.html")
	public String toAcctTypePage() {
		return "authority/accttype";
	}
	
	/*
	 * 去认证申请页面--基本信息,将会员选择的账户类型保存到session中的登录帐号
	 * */
	@RequestMapping("/toapply.html")
	public String toApplyPage(@RequestParam("accttype")String accttype,HttpSession session) {
		TMember member = ScwUtil.getUser(session);
		member.setAccttype(accttype);
		return "authority/apply";
	}
	
	/*
	 * 去认证申请页面--资质上传
	 * */
	@RequestMapping("/toapply-1.html")
	public String toApply1Page(@ModelAttribute(value=Constant.LOGIN_USER)TMember member,
								Model model) {
		String accttype = member.getAccttype();
		List<TCert> accttypeCerts = certService.getAccttypeCerts(accttype);
		model.addAttribute("accttypeCerts", accttypeCerts);
		return "authority/apply-1";
	}
	
	/*
	 * 去认证页面--邮箱确认
	 * */
	@RequestMapping("/toapply-2.html")
	public String toApply2Page( @RequestParam("certid")Integer[] certids,
								@RequestParam("file")MultipartFile[] files,
								HttpSession session) throws Exception {
		TMember member = ScwUtil.getUser(session);
		Integer mid = member.getId();
		memberService.saveMemberCerts(certids,files,mid);
		return "authority/apply-2";
	}
	
	/*
	 * 去认证页面--申请确认
	 * */
	@RequestMapping("/toapply-3.html")
	public String toApply3Page(@RequestParam("email")String email, HttpSession session) {
		TMember member = ScwUtil.getUser(session);
		member.setEmail(email);
		memberService.updateMember(member);
		//接受返回的验证码，用于前端校验验证码输入
		String code = memberService.sendApplyEmail(email);
		session.setAttribute("code", code);
		return "authority/apply-3";
	}
	
	/*
	 * 去申请完成页面
	 * */
	@RequestMapping("/tosuccess.html")
	public String toSuccessPage() {
		return "authority/success";
	}
}
