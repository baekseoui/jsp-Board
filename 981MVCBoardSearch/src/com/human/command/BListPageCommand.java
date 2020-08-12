package com.human.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.dao.BDao;
import com.human.dto.BDto;
import com.human.dto.BPageDto;

public class BListPageCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String page=(String)request.getParameter("page");
		String pageDataCount=(String)request.getParameter("pageDataCount");//���������� ��� �����Ͱ� �ִ���
		//page&pageDataCount ���� �ȳѾ�ö��� ����ó��
		if(page==null) {
			page="1";
		}
		if(pageDataCount==null) {
			pageDataCount="15";
		}
		
		System.out.println(page);
		System.out.println(pageDataCount);
		BDao bDao=new BDao();
		ArrayList<BDto> dtos=bDao.select(page, pageDataCount);
		request.setAttribute("dtos", dtos);
		
		int totalDataCount=bDao.dataCount();
		
		BPageDto bPageDto=new BPageDto();
		bPageDto.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		request.setAttribute("bPageDto", bPageDto);
		
		System.out.println(bPageDto);
	}

}
