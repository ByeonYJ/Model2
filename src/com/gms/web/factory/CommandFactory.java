package com.gms.web.factory;
import com.gms.web.command.*;
import com.gms.web.constant.Action;
public class CommandFactory {
	public static Command createCommand(String directory, String action, String page){
		Command cmd=null;//오버라이딩
		switch (action) {//액션을 로그인으로 index에 넣어뒀기 때문에
		case Action.MOVE: 
		case Action.LOGIN: 
		case Action.LOGOUT: 
		case Action.JOIN:
		case Action.LIST:
				cmd=new MoveCommand(directory, action, page);//MoveCommand안의 경로가 cmd에 저장됨
			break;
		default:System.out.println("Command Fail");
			break;
		}
		return cmd;
	}
}
