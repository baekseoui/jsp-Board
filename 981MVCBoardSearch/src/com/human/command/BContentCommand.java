package com.human.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.dao.BDao;
import com.human.dto.BDto;
import com.human.dto.BSearchDto;

public class BContentCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String bId=request.getParameter("bId");
		BDao dao=new BDao();
		BDto dto=dao.select(bId);
		
		request.setAttribute("dto", dto);
		
		BSearchDto bSearchDto=new BSearchDto();
		int currentPageNum=Integer.parseInt(request.getParameter("page"));
		bSearchDto.setCurrentPageNum(currentPageNum);
		int bPageDataCount=Integer.parseInt(request.getParameter("pageDataCount"));
		bSearchDto.setPageDataCount(bPageDataCount);
		bSearchDto.setSearchCol(request.getParameter("searchCol"));
		bSearchDto.setSearchVal(request.getParameter("searchVal"));
		
		request.setAttribute("bSearchDto", bSearchDto);
	}

}
