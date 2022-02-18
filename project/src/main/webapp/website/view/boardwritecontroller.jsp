<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");	// 요청시[request] 한글 인코딩
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	contents = contents.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

	title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?","");
	title = title.replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	
	
	String pw = request.getParameter("pw");
	String writer = request.getParameter("writer");
	
	// 객체화
	Board board = new Board( title , contents, pw , writer);
	
	// DB처리
	boolean result = BoardDao.getBoardDao().boardwrite( board);
	if(result){
		out.print(1);
	}
%>