<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int b_num = Integer.parseInt(request.getParameter("b_num"));
/* String b_pw = request.getParameter("b_pw");
String pwconfirm2 = request.getParameter("pwconfirm2");
System.out.print(pwconfirm2); */



String pwconfirm2 = request.getParameter("pwconfirm2");

if(BoardDao.getBoardDao().getboard(b_num).getB_pw().equals(pwconfirm2)){
	//db처리
	boolean result = BoardDao.getBoardDao().boarddelete(b_num);
		if(result){out.print(1);}
} else{
	out.print(2);
}


%>	
