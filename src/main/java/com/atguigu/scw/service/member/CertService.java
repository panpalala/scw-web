package com.atguigu.scw.service.member;

import java.util.List;

import com.atguigu.scw.bean.TCert;

/**
 * @author panpala
 * @date 2017年8月11日
 */
public interface CertService {
	
	public List<TCert> getAccttypeCerts(String accttype);
	
}
