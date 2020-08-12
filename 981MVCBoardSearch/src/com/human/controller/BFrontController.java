package com.human.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.human.command.BCommand;
import com.human.command.BContentCommand;
import com.human.command.BDeleteCommand;
import com.human.command.BListCommand;
import com.human.command.BListPageCommand;
import com.human.command.BListSearchCommand;
import com.human.command.BModifyCommand;
import com.human.command.BReplyCommand;
import com.human.command.BWriteCommand;

/**
 * Servlet implementation class BFrontController
 */
@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		BCommand bCom=null;
		
		String viewPage=null;
		String uri=request.getRequestURI();
		System.out.println("URI:"+uri);
		String conPath=request.getContextPath();
		System.out.println("ConPath:"+conPath);
		String com=uri.substring(conPath.length());
		System.out.println("command:"+com);
		
		if(com.equals("/list.do")){
			viewPage="list.jsp";
			//Command�� �����͸� ��� viewPage�� �̵��ϸ� .jsp
			//���� �����Ͱ� ������ .do
			bCom=new BListCommand();
			bCom.execute(request,response);
		}else if(com.equals("/write_view.do")) {
			viewPage="write.jsp";
			//DB�� ������ �ʿ� ���� ����ڰ� �Է��ϸ� DB�� ����
		}else if(com.equals("/write.do")) {
			viewPage="listSearch.do";
			bCom=new BWriteCommand();
			bCom.execute(request,response);
			response.sendRedirect(viewPage);
			return;//���ΰ�ħ�� ����ε�Ǵ� ���� ó��
		}else if(com.equals("/content_view.do")) {
			//��ȸ�� hit ����
			viewPage="content.jsp";
			bCom=new BContentCommand();
			bCom.execute(request, response);
		}else if(com.equals("/delete.do")) {
			viewPage="listSearch.do";
			bCom=new BDeleteCommand();
			bCom.execute(request, response);
		}else if(com.equals("/modify_view.do")) {
			//BContentCommand�� ���� ����
			viewPage="modify.jsp";
			bCom=new BContentCommand();
			bCom.execute(request, response);
		}else if(com.equals("/modify.do")) {
			viewPage="listSearch.do";
			bCom=new BModifyCommand();
			bCom.execute(request, response);
		}else if(com.equals("/reply_view.do")) {
			viewPage="reply_view.jsp";
			bCom=new BContentCommand();
			bCom.execute(request, response);
		}else if(com.equals("/reply.do")) {
			viewPage="listSearch.do";
			bCom=new BReplyCommand();
			bCom.execute(request, response);
		}else if(com.equals("/listpage.do")) {
			viewPage="listpage.jsp";
			bCom=new BListPageCommand();
			bCom.execute(request, response);
		}else if(com.equals("/listSearch.do")) {
			viewPage="listSearch.jsp";
			bCom=new BListSearchCommand();
			bCom.execute(request, response);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
