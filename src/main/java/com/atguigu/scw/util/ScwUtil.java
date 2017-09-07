package com.atguigu.scw.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.atguigu.scw.bean.Constant;
import com.atguigu.scw.bean.TMember;

/**
 * @author panpala
 * @date 2017年8月11日
 */
public class ScwUtil {
	
	private static ServletContext servletContext;
	
	public static void setServletContext(ServletContext servletContext) {
		ScwUtil.servletContext = servletContext;
	}

	public static TMember getUser(HttpSession session) {
		return (TMember) session.getAttribute(Constant.LOGIN_USER);
	}

	public static List<String> getCertsPath(MultipartFile[] files) throws IllegalStateException, IOException {
		//创建一个list集合保存图片访问的虚拟路径
		List<String> imgPaths = new ArrayList<>();
		//获取文件夹在当前项目的真实路径（服务器上的路径）
		String realPath = servletContext.getRealPath("/certImages");
		System.out.println("真实路径" + realPath);
		for (MultipartFile file : files) {
			//保存文件到目标路径
			String imgName = UUID.randomUUID().toString().replaceAll("-", "").substring(0,5) + 
								"_certImg_" + file.getOriginalFilename();
			//transferTo这个方法将文件转移到目标文件中
			file.transferTo(new File(realPath + "/" + imgName));
			//保存文件的访问路径，返回给调用者
			imgPaths.add("certImages/" + imgName);
		}
		return imgPaths;
	}
	
}
