package com.atguigu.scw.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.atguigu.scw.util.ScwUtil;

/**
 * @author panpala
 * @date 2017年8月7日
 * 创建一个监听类，在项目启动时，将项目的绝对路径存到全局的applicationContext域对象中，方便整个工程引用
 */
public class PathListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext applicationContext = servletContextEvent.getServletContext();
		applicationContext.setAttribute("App_path", applicationContext.getContextPath());
		//将servletcontext保存到工具类，供项目使用
		ScwUtil.setServletContext(applicationContext); 
	}

}
