package com.human.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.dao.BDao;

public class BReplyCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BDao dao=new BDao();
		String bId=request.getParameter("bId");
		String bGroup=request.getParameter("bGroup");
		String bStep=request.getParameter("bStep");
		String bIndent=request.getParameter("bIndent");
		
		String bName=request.getParameter("bName");
		String bTitle=request.getParameter("bTitle");
		String bContent=request.getParameter("bContent");
		
		dao.reply(bId, bGroup, bIndent, bStep, bName, bTitle, bContent);
	}

}
