<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	int b_num = Integer.parseInt(request.getParameter("b_num"));

	
	String pwconfirm1 = request.getParameter("pwconfirm1");

	if(BoardDao.getBoardDao().getboard(b_num).getB_pw().equals(pwconfirm1)){
		
		
		out.print(1);
		
	} else {
		out.print(2);
	}
	

	
%>
 