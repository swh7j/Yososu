<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩

int b_num = Integer.parseInt(request.getParameter("b_num"));
String title = request.getParameter("title");
String contents = request.getParameter("contents");

contents = contents.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");

// 객체화
Board board = new Board( title, contents, b_num );
// DB처리
boolean result = BoardDao.getBoardDao().boardupdate(board);
out.print(1);
%>