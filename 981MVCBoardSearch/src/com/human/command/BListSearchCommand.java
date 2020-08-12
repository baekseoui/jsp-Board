package com.human.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.dao.BDao;
import com.human.dto.BDto;
import com.human.dto.BPageDto;
import com.human.dto.BSearchDto;

public class BListSearchCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String page=(String)request.getParameter("page");
		String pageDataCount=(String)request.getParameter("pageDataCount");//한페이지에 몇개의 데이터가 있는지
		//page&pageDataCount 값이 안넘어올때의 예외처리
		if(page==null) {
			page="1";
		}
		if(pageDataCount==null) {
			pageDataCount="10";
		}
		String searchCol=(String)request.getParameter("searchCol");
		String searchVal=(String)request.getParameter("searchVal");
		if(searchCol==null||searchVal==null) {
			searchCol="bTitle";
			searchVal="";
		}
		if(searchCol.equals("")||searchVal.equals("")) {
			searchCol="bTitle";
			searchVal="";
		}
		
		System.out.println(page);
		System.out.println(pageDataCount);
		System.out.println(searchCol);
		System.out.println(searchVal);
		
		BDao bDao=new BDao();
		ArrayList<BDto> dtos=bDao.searchSelect(page, pageDataCount, searchCol, searchVal);
		request.setAttribute("dtos", dtos);
		
		int totalDataCount=bDao.dataCount(searchCol, searchVal);
		BSearchDto bSearchDto=new BSearchDto();
		bSearchDto.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount, searchCol, searchVal);
		
		request.setAttribute("bSearchDto", bSearchDto);
		
		System.out.println(bSearchDto);

	}

}
