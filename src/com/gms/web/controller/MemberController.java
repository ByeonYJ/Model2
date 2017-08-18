package com.gms.web.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.service.MemberService;
import com.gms.web.serviceImpl.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.ParamsIterator;
import com.gms.web.util.Separator;
@WebServlet({"/member.do"})
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberController() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController get 진입");
		Separator.init(request);
		MemberBean member=new MemberBean();
		MemberService service = MemberServiceImpl.getInstance();
		String action=request.getParameter("action");
		switch(request.getParameter("action")){
		case"move":
			DispatcherServlet.send(request, response);
			break;
		case"join":
			System.out.println("MemberController Join 진입");
			Map<?,?> map=ParamsIterator.execute(request);
			member.setId((String)map.get("id"));
			member.setName((String)map.get("name"));
			member.setPassword((String)map.get("password"));
			member.setSsn((String)map.get("birth"));
			member.setEmail((String)map.get("email"));
			member.setMajor((String)map.get("major"));
			member.setPhone((String)map.get("phone"));
			member.setProfile("profile.jpg");
			//major는 여러 행을 입력해야함
			String[] subjects=((String)map.get("subject")).split(",");
			List<MajorBean> list=new ArrayList<>();
			MajorBean major=null;
			for(int i=0;i<subjects.length;i++){
	            major=new MajorBean();
	            major.setMajorId(String.valueOf((int)((Math.random() * 9999) + 1000)));
				major.setId((String)map.get("id"));
				major.setTitle((String)map.get("name"));
				major.setSubjId(subjects[i]);
				list.add(major);
			}
			Map<String,Object> tempMap=new HashMap<>();
			tempMap.put("member", member);
			tempMap.put("major", list);
			service.addMember(tempMap);
			Separator.cmd.setDirectory("common");
			Separator.cmd.process();
			System.out.println("Controller Insert");
			DispatcherServlet.send(request, response);
			break;
		case "list":
			System.out.println("==MemberList==");
			@SuppressWarnings("unchecked") 
			List<StudentBean> memberlist =(List<StudentBean>) service.list();
			System.out.println("==DB에서 가져온 MemberList=="+memberlist);
			request.setAttribute("pageNumber", request.getParameter("pageNumber"));
			request.setAttribute("list", memberlist);
			request.setAttribute("prevBlock", "0");
			request.setAttribute("theNumberOfPages", memberlist.size()/5);
			request.setAttribute("startPage", "1");
			System.out.println("Page의 수"+memberlist.size()/5);
			int pageCount=memberlist.size()/5;
			int endPage=(pageCount%5!=0)?pageCount+1:pageCount;
			request.setAttribute("endPage", String.valueOf(endPage));
			DispatcherServlet.send(request, response);
		default:System.out.println("Fail");
			break;
		}
	}
}