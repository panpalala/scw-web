package com.atguigu.scw.controller;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.atguigu.scw.bean.Constant;
import com.atguigu.scw.bean.TMember;
import com.atguigu.scw.service.member.MemberService;

/**
 * @author panpala
 * @date 2017年8月7日
 * 前端会员登录注册
 */
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	/*
	 * 会员注册
	 * */
	@RequestMapping("/regist")
	public String registMember(TMember member,Model model) {
		try {
			memberService.saveMember(member);
			model.addAttribute("msg", "注册成功！");
			return "forward:/login.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "注册失败！");
			return "forward:/reg.jsp";
		}
	}
	
	/*
	 * 会员登录
	 * */
	@RequestMapping("/login")
	public String loginMember(TMember member,Model model,HttpSession session) {
	TMember tMember = memberService.selectMember(member);
		if(tMember != null) {
			session.setAttribute(Constant.LOGIN_USER, tMember);
			return "forward:/index.jsp";
		}else {
			model.addAttribute("msg", "登录失败");
			return "forward:/login.jsp";
		}
		
	}
	
	
	/*
	 * 退出系统
	 * */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	
	/*
	 * 点击忘记密码，去忘记密码页面
	 * */
	@RequestMapping("/forgetPassword")
	public String forgetPassword() {
		
		return "member/forgetpassword";
	}
	
	
	/*
	 * 确认重置，服务器给用户发请求
	 * */
	@RequestMapping("/resetPassword")
	public String resetPassword(String email,Model model) {
		memberService.sendEmail(email);
		model.addAttribute("msg", email);
		return "member/forgetpassword";
	}
	
	/*
	 * 去密码重置页面
	 * */
	@RequestMapping("/resetPWD")
	public String resetPWD(@Param("token")String token) {
		return "member/resetpassword";
	}
	
	/*
	 * 修改密码
	 * */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(@RequestParam("token")String token,
								@RequestParam("password")String password,
								Model model) {
		memberService.modifyPassword(token,password);
		return "redirect:/login.jsp";
	}
	
	/*
	 * 去会员页面
	 * */
	@RequestMapping("/member.html")
	public String toMemberPage() {
		return "member/member";
	}
}
