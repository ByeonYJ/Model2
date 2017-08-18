package com.gms.web.util;
import javax.servlet.http.HttpServletRequest;
import com.gms.web.command.Command;
import com.gms.web.factory.CommandFactory;
public class Separator {
	public static Command cmd=new Command();//cmd 이름으로 bean처럼 빈 공간을 만듬
	public static void init(HttpServletRequest request){
		String action=request.getParameter("action");//index페이지에서 온 액션에 로그인페이지
		String page=request.getParameter("page");//index페이지에서 온 페이지
		String servletPath=request.getServletPath();//외부값을 가져올때는 request를 사용, 경로를 servletPath로 넣어줬다 /common.do 가 온것
		System.out.println("--servletPath--"+servletPath);
		String directory=servletPath.substring(1,servletPath.indexOf("."));// /common.do 의 /는0, .do의 .까지가 indexOf(".") 
		System.out.println("--directory--"+directory);
		cmd=CommandFactory.createCommand(directory, action, page);// 3개의 정보를 cmd로 넘김
	}
}
