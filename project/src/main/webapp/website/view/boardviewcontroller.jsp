<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


int b_num = Integer.parseInt(request.getParameter("b_num"));

Board board = BoardDao.getBoardDao().getboard(b_num);


%>
 <div>
	<div class="row">
		<div class=" col-md-3 offset-2">
			<button type="button" class="w-100 mb-2 btn btn-lg rounded-4 btn-primary">
			 <a data-toggle="modal" href="#modalupdate1" > 수정</a> 
					</button>
			<div class="modal fade" tabindex="-1" id="modalupdate1" data-bs-keyword="false" data-bs-backdrop="static">
                <div class="modal-dialog" role="document">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-body p-4 text-center">
                            <h5 class="mb-0"> 수정 </h5>
                            <p class="mb-3" id="updatemsg">수정시 게시글이 변경니다.</p>
                            <input type="password" placeholder="비밀번호 확인" class="form-control" id="pwconfirm1">
                        </div>
                        <div class="modal-footer flex-nowrap p-0">
                           <!--  <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-right">  <a data-toggle="modal" href="#modalupdate" class="nav-link link-dark"> <strong>수정합니다.</strong> </a></button> -->
                           <button onclick="bupdate(<%=b_num %>);" type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-right"> <strong>수정합니다.</strong></button>
                           <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal"><a href="index.jsp" class="nav-link link-dark">아닙니다.</a></button>
                        </div>
                    </div>
                </div>
            </div>	
					 
		</div>
		
		<div class="col-md-3 offset-2">
			<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" 
					> <a data-toggle="modal" href="#modaldelete1">삭제 </a></button>
					<input type="hidden" name="b_num" value="<%=b_num%>">
			<div class="modal fade" tabindex="-1" id="modaldelete1" data-bs-keyword="false" data-bs-backdrop="static">
                <div class="modal-dialog" role="document">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-body p-4 text-center">
                            <h5 class="mb-0"> 삭제 </h5>
                            <p class="mb-3" id="deletemsg">삭제시 게시글이 사라집니다.</p>
                            <input type="password" placeholder="비밀번호 확인" class="form-control" id="pwconfirm2">
                        </div>
                        <div class="modal-footer flex-nowrap p-0">
                            <button onclick="btndelete(<%=b_num%>);" type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-right"><strong>삭제합니다.</strong></button>
                            <button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal"><a href="index.jsp" class="nav-link link-dark">아닙니다.</a></button>
                        </div>
                    </div>
                </div>
            </div>
					
		</div>
		
	</div> 
	<br>
	<table class="table" border="1" >
	<tr>
			<td>작성자 : <%=board.getB_writer()%>
			</td>
		</tr>
		<tr>	
			<td >작성일 : <%=board.getB_date()%>
			</td>
		</tr>
		<tr>
			<td >제목<br><%=board.getB_title()%></td>
		</tr>
		<tr>
			<td  style="height: 300px;">내용<br> <%=board.getB_contents()%></td>
		</tr>
	</table>
 </div>
 
	<!-- 글 수정 -->
	 <div class="modal" tabindex="-1" role="dialog" id="modalupdate" style="z-index:1000;"
		data-bs-keyboard="false" data-bs-backdrop="static" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h2 class="fw-bold mb-0">Board Update</h2>
					
					<button type="button" class="btn-close" data-dismiss="modal" 
						aria-label="Close"><a href="index.jsp" class="nav-link link-dark"></a></button>
				</div>
				<div class="modal-body p-5 pt-0">
 					<form >
				
						<input type="hidden" name="b_num" value="<%=b_num%>">
						제목 : <input class="form-control" type="text" name="title1"
							id="title1" value="<%=board.getB_title()%>"> <br> 
							내용 : <textarea class="form-control" rows="13" cols="20" name="contents1"
							id="contents1"><%=board.getB_contents()%></textarea><br> 
					</form>
				
						<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" 
						onclick="btnupdate(<%=b_num%>);"> 수정</button>
					
				 
				 </div>
			</div>
		</div>
	</div> 

	
 