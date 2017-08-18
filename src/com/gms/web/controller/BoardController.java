package com.gms.web.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separator;
@WebServlet({"/board.do"})
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BoardController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController get 진입");
		Separator.init(request);
		String action=request.getParameter("action");
		String page=request.getParameter("page");
		switch(request.getParameter("action")){
		case"move":
			Separator.cmd.setPage(page);
			Separator.cmd.process();
			DispatcherServlet.send(request, response);
			break;
		default:System.out.println("FAIL..");
			break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController post 진입");
	}
}