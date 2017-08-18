package com.gms.web.controller;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gms.web.constant.Action;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.serviceImpl.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separator;
@WebServlet("/common.do")
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();//id, pw를 입력하면 request로 가져오기 때문에 getSession
		MemberBean member = new MemberBean();
		System.out.println("CommonController get 진입");
		Separator.init(request);
		switch(Separator.cmd.getAction()){//액션값이 login이었기 때문에 이곳이 아닌 두번째 case로 넘어감
		case Action.MOVE:
			DispatcherServlet.send(request, response);
			break;			
		case Action.LOGIN:
			MemberService service = MemberServiceImpl.getInstance();//싱글톤을 불러옴
			MemberBean bean = new MemberBean();//빈 공간을 만듬
			bean.setId(request.getParameter("input_id"));//index에 사용자가 적은 id를 빈에 setId를 통하여 넣음
			System.out.println("+++++++++++++++++++"+bean.getId());
			bean.setPassword(request.getParameter("input_pass"));//index에 사용자가 적은 pw를 빈에 setPassword를 통하여 넣음
			System.out.println("+++++++++++++++++++"+bean.getPassword());
			Map<String,Object> map=service.login(bean);//login안에 있는 페이지값을 page에 할당
			System.out.println("page :"+map);
			if(map.get("page").equals("main")){
				session.setAttribute("user", map.get("user") );
			}		
			Separator.cmd.setPage(String.valueOf(map.get("page")));//만약에 일치했던 페이지값이 메인이었다면 메인페이지를 setPage에 넣어줌
			Separator.cmd.process();//변경된 페이지값 경로를 쏴줌
			DispatcherServlet.send(request, response);
			break;
		case Action.LOGOUT:
			session.invalidate();
			DispatcherServlet.send(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DispatcherServlet.send(request, response);
		System.out.println("CommonController post 진입");
	}
}
