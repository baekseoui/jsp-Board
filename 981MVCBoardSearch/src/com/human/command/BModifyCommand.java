package com.human.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.dao.BDao;

public class BModifyCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BDao dao=new BDao();
		dao.update(
				request.getParameter("bId"),
				request.getParameter("bTitle"),
				request.getParameter("bContent")
				);
	}

}
