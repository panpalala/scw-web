package com.atguigu.scw.service.member.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.scw.bean.TCert;
import com.atguigu.scw.dao.TCertMapper;
import com.atguigu.scw.service.member.CertService;

/**
 * @author panpala
 * @date 2017年8月11日
 */
@Service
public class CertServiceImpl implements CertService {

	@Autowired
	TCertMapper certMapper;
	
	@Override
	public List<TCert> getAccttypeCerts(String accttype) {
		return certMapper.getAcctCerts(accttype);
	}

}
