package com.gms.web.command;
public class MoveCommand extends Command {
	public MoveCommand(String directory,String action,String page){
		super.directory=directory;
		super.action=action;
		super.page=page;
		super.process();
	}
}
