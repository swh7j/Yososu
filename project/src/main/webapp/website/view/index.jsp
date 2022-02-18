<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="com.mysql.cj.xdevapi.JsonParser"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="">
<meta name="author" content="">


<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet" type="text/css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/project/website/css/styles.css" rel="stylesheet">
</head>
<body id="page-top" onload="map()">

	<!-- jquery [ajax 필수]-->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- 부스트랩 js 설정 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- kakao지도 api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4b311c12f156511eb9b89bf63938e65"></script>
	<!-- 본인 js 호출 -->
	<script type="text/javascript" src="/project/website/js/main.js"></script>
	<!-- 부트스트랩 js호출 -->
	<script type="text/javascript" src="/project/website/js/scripts.js"></script>
	<%
	String key = request.getParameter("key");
	String keyword = request.getParameter("keyword");

	String cartegory = request.getParameter("cartegory");

	int s = 1;
	int e = 2000;

	URL url = new URL("https://api.odcloud.kr/api/uws/v1/inventory?page=" + s + "&perPage=" + e
			+ "&serviceKey=PGVtm4jDhZvj1x1LQZQ902znlkuU1SXojUN4uaP6VAATxh562RB%2Bsk5W6obsub4hCwvKxyPG29sb7y1mrxZKTA%3D%3D");

	BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

	String result = bf.readLine();

	JSONParser jsonParser = new JSONParser();
	JSONObject jsonObject = (JSONObject) jsonParser.parse(result);

	JSONArray jsonArray = (JSONArray) jsonObject.get("data");

	JSONArray cartegory_array = new JSONArray();

	if (cartegory != null) {

		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject content = (JSONObject) jsonArray.get(i);
			if (content.get("addr").toString().contains(cartegory)) {
		cartegory_array.add(content);
			}
		}
	}

	JSONObject siteDataMain = new JSONObject();

	// 크롤링 내용 JSON화 시키기 위해 반복적으로 많기 때매 JsonArray로

	JSONArray siteJsonArray = new JSONArray();

	Document doc2 = Jsoup.connect(
			"https://search.naver.com/search.naver?where=news&sm=tab_pge&query=%EC%9A%94%EC%86%8C%EC%88%98%20%ED%99%94%EB%AC%BC%EC%B0%A8%20%ED%95%84%EC%88%98&sort=0&photo=0&field=0&pd=0&ds=&de=&cluster_rank=28&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:r,p:all,a:all&start=1")
			.get();
	Elements posts = doc2.body().getElementsByClass("list_news");
	Elements file = posts.select("li");
	%>




	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
		id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span
			class="d-block d-lg-none">Yososu Map</span> <span
			class="d-none d-lg-block"><img
				class="img-fluid img-profile rounded-circle mx-auto mb-2"
				src="/project/website/img/Yososu.png" alt="..." /></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#about">About</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#map3">Map</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#news">News</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#board">Board</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#info">Info</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#skills">Skills</a></li>

			</ul>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container-fluid p-0">

		<!-- About-->
		<section class="resume-section" id="about">
			<div class="resume-section-content">
				<h1 class="mb-0">
					Yososu <span class="text-primary">Map</span>
				</h1>
				<div class="subheading mb-5">
					경기도 안산시 상록구 광덕1로 375 KR 강우빌딩 5층 이젠아카데미컴퓨터학원 · 031-502-2632 · <a
						href="swh_77@naver.com">swh_77@naver.com</a>
				</div>
				<p class="lead mb-5">요소수 판매처와 재고, 정보, 최신뉴스를 Yososu Map에서 한눈에 확인
					하세요!</p>
				<div class="social-icons">
					<a class="social-icon" href="#!"><i class="fab fa-youtube"></i></a>
					<a class="social-icon" href="#!"><i class="fab fa-github"></i></a>
					<a class="social-icon" href="#!"><i class="fab fa-instagram"></i></a>
					<a class="social-icon" href="#!"><i class="fab fa-facebook-f"></i></a>
				</div>
			</div>
		</section>
		<hr class="m-0" />


		<section class="resume-section" id="map3">
			<div class="resume-section-content">

				<h2 class="mb-5">Map</h2>
				<div class="subheading mb-3">* 요소수를 제공하는 주유소 현황을 지도에 표시합니다.</div>
				<br> <br>
				<div class="row">
					<div class="col-md-6 ">

						<div class="row">
							<div class="col-md-3" style="padding-left: 50px;">
								<select class="custom-select " onchange="chageSelect()"
									id="test" name="key" style="width: 70px; height: 40px;">
									<option value="지역">선택</option>
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="인천">인천</option>
									<option value="대구">대구</option>
									<option value="대전">대전</option>
									<option value="충북">충북</option>
									<option value="충남">충남</option>
									<option value="경북">경북</option>
									<option value="경남">경남</option>
									<option value="강원">강원</option>
									<option value="전북">전북</option>
									<option value="전남">전남</option>
									<option value="제주">제주</option>
								</select>
							</div>
							<div class="col-md-4" id="input-form">
								<input type="text" id="keyword"
									style="width: 180px; height: 40px;" placeholder="search...">
							</div>

						</div>

						<br>
						<div class="row" style="overflow: auto; height: 500px;">

							<table class="table" border="1" id="item-table">
								<thead>
									<tr>

										<th>주유소명</th>
										<th>주소</th>
										<th>연락처</th>
										<th>재고</th>
										<th>가격</th>
										<th>지도</th>
									</tr>
								</thead>
								<tbody>
									<%
									if (cartegory != null) {
										for (int i = 0; i < cartegory_array.size(); i++) {
											JSONObject content = (JSONObject) cartegory_array.get(i);
									%>
									<tr>
										<td><%=content.get("name")%></td>
										<td><%=content.get("addr")%></td>
										<td><%=content.get("tel")%></td>
										<td><%=content.get("inventory")%></td>
										<td><%=content.get("price")%></td>
										<td>
											<button class="form-control"
												onclick="map( '<%=content.get("code")%>' ,  <%=content.get("lat")%> , <%=content.get("lng")%>) ">MAP</button>
										</td>
									</tr>
								</tbody>

								<tbody>
									<%
									}
									} else {
									for (int i = 0; i < jsonArray.size(); i++) {
									JSONObject content = (JSONObject) jsonArray.get(i);
									%>
									<tr>
										<td><%=content.get("name")%></td>
										<td><%=content.get("addr")%></td>
										<td><%=content.get("tel")%></td>
										<td><%=content.get("inventory")%></td>
										<td><%=content.get("price")%></td>
										<td>
											<button class="form-control"
												onclick="map( '<%=content.get("code")%>' ,  <%=content.get("lat")%> , <%=content.get("lng")%>) ">MAP</button>
										</td>
									</tr>
								</tbody>
								<%
								}
								}
								%>

							</table>

						</div>
					</div>



					<div class="col-md-6">
						<h3 style="padding-left: 50px;">Yososu Map</h3>
						<div style="padding-left: 40px;">
							<div id="map"
								style="width: 900px; height: 550px; border: solid 3px black;">
							</div>
							<br>
							<div class="row">
								<button class=" col-md-4 offset-4 ml-5 btn btn-dark"
									style="color: white;" type="button" onclick="map(null,0,0);">Find
									Near</button>

							</div>
							<br>

						</div>


					</div>
				</div>

			</div>
		</section>
		<hr class="m-0" />
	
		<section class="resume-section" id="news">
			<div class="resume-section-content">
				<h2 class="mb-5">News</h2>
				<div class="subheading mb-3">* 요소수 관련 실시간 뉴스정보입니다.</div>
				<br>
				<%
				int j = 4;
				for (Element element : file) {

					JSONObject siteJsonObject = new JSONObject();
				%>
				<div
					class="d-flex flex-column flex-md-row justify-content-between mb-5">
					<div class="flex-grow-1">
						<h3 class="mb-0">
							<a href="<%=element.select(".news_tit").attr("href")%>"><%=element.select(".news_tit").text()%></a>
						</h3>
						<div class="subheading mb-3"><%=element.select(".dsc_txt_wrap").text()%></div>
					</div>

				</div>

				<%
				j++;
				if (j == 8) {
					break;
				}
				}
				%>

			</div>
		</section>

		<hr class="m-0" />
		<!-- Board -->
		<section class="resume-section" id="board">
			<div class="resume-section-content">
				<h2 class="mb-5">Board</h2>
				<div class="subheading mb-3">* 익명게시판입니다. 심한 욕설이나 비방글은 자제해주세요!</div>
				<br> <br>
				<div class="row">
					<div class="row col-md-6 offset-6">
						<div class="col-md-3 offset-4">
							<button type="button" class="btn btn-outline-dark me-2"
								data-bs-target="#modallogin" data-bs-toggle="modal">글
								등록</button>
						</div>
						<div class="col-md-3" id="input-form1">
							<input type="text" id="keyword1"
								style="width: 180px; height: 40px;" placeholder="search...">
						</div>
					</div>
				</div>

				<br> <br>
				<div style="overflow: auto; height: 550px;">

					<table class="table" border="1" id="txt">
						<tr>
							<th style="width: 10%; text-align: center;">No.</th>
							<th style="width: 50%; text-align: center;">제목</th>
							<th style="width: 20%; text-align: center;">작성자</th>
							<th style="width: 20%; text-align: center;">작성일</th>

						</tr>
						<tbody>
							<%
							ArrayList<Board> boards = BoardDao.getBoardDao().boardlist();

							for (Board board : boards) {
							%>
							<tr>
								<td style="width: 10%; text-align: center;"><%=board.getB_num()%></td>
								<td style="width: 50%; text-align: center;">
									<%-- 	<a href="#btnview"><%=board.getB_title() %>assa</a> --%>
									<button onclick="btnview(<%=board.getB_num()%>);" type="button"
										class="btn btn-outline-none me-2" data-bs-target="#modalview"
										data-bs-toggle="modal">
										<%=board.getB_title()%></button>
								</td>
								<td style="width: 20%; text-align: center;"><%=board.getB_writer()%></td>
								<td style="width: 20%; text-align: center;"><%=board.getB_date()%></td>

							</tr>
							<%
							}
							%>
						</tbody>
					</table>

				</div>
			</div>

		</section>
		<hr class="m-0" />
		<!-- Experience-->
		<section class="resume-section" id="info">
			<div class="resume-section-content">
				<h2 class="mb-5">Info</h2>
				<div
					class="d-flex flex-column flex-md-row justify-content-between mb-5">
					<div class="flex-grow-1">
						<h3 class="mb-0">요소수란?</h3>
						<div class="subheading mb-3">Yososu Explanation</div>
						<p>디젤 차량에서 발생하는 질소산화물(NOx)을 정화시키기 위해 디젤 차량에 탑재된 SCR(Selective
							Catalyst Reduction, 선택적 촉매 감소기술)에 사용되는 물질을 말한다. 질소와 산소가 결합된 화합물인
							질소산화물(NOx)은 미세먼지를 유발하는 것은 물론 비에 섞여 내리면 토양을 오염시킨다. 따라서 촉매를 통해
							질소산화물을 화학 분해하는 SCR이 반드시 필요한데, 이 SCR의 핵심이 '요소수'이다. 경유차에 반드시 들어가야
							하는 물질. 청소용차, 쓰레기 수거용차, 오물 수거용차, 소방차, 구급차 등에 사용됩니다. 2015년 이후부터는
							환경규제가 강화되면서 자동차의 배출가스에 대한 규제가 강화됐습니다. 특히 경유차 같은 데는 매연이라든지 질소산화물
							문제가 많이 부각이 됐는데 질소산화물 하게 되면 발암물질이면서도 또 미세먼지, 초미세먼지의 원인 물질이거든요. 따라서
							이것의 배출규제를 위해서 경유차에 2015년 이후 차량에는 SCR 장치를 의무 장치화했습니다. 이 SCR 장치는
							질소산화물 저감장치인데 바로 질소산화물을 저감시키기 위해서 요소수를 정기적으로 주입하여야 질소나 물로 바꿀 수
							있습니다. 그래서 2015년 이후의 디젤차에는 대부분 이 요소수를 사용한다고 볼 수 있습니다. 요소수가 사용되는
							사용처가 일상생활에 밀접한 트럭, 버스(시외, 시내 등), 중장비, 물류, 여객, 건설 등이므로 대란이 예상되고
							있습니다.</p>
					</div>

				</div>

				<div
					class="d-flex flex-column flex-md-row justify-content-between mb-5">
					<div class="flex-grow-1">
						<h3 class="mb-0">수입 현황 & 품귀 현상</h3>
						<div class="subheading mb-3">Income Status & Yososu Shortage</div>
						<p>한국에서 요소수는 롯데정밀화학, 휴켐스 등이 생산하고 있는데, 원료인 요소는 대부분 중국에서 들여온다.
							중국은 전 세계 요소의 30%를 생산한다. 중국이 요소 수출을 가장 많이 하는 국가 순위를 보면 1위 인도, 2위가
							한국이다. 한국에 수출하는 양은 56만4000톤, 중국 요소 수출 총량의 14%를 차지한다. 한국은 전체 필요 요소수
							중 66.1%를 중국에서 수입한다. 특히 공업용 요소의 중국 수입 의존도는 지난해 80% 이상, 올해는 97.66%에
							달한다. 요소수 대란은 전 세계적 상황이지만, 중국에 전적으로 의존했던 우리나라는 직격타를 맞았다. 요소수 품귀
							현상으로 평소 10리터에 1만원 하던 요소수가 최근에는 10만원을 지불해도 구하기 어려운 상황입니다. 자동차용 요소는
							물론이고 심지어 농가마저도 요소 품귀에 현상에 따른 불안감이 극대화 되고 있습니다. 요소 대란으로 인해 비료 수급에
							문제가 발생하고 비료값 인상으로 이어지고 있기 때문입니다. 요소수 품귀 현상이 장기간 지속된다면 화물 운송 차질로
							인해 경제 전반에 심각한 악영향을 미칠 수 있습니다. 물류 산업 전체가 멈출 수 있으며, 이는 물가 상승의 직접적인
							요인이 됩니다. 코로나19 팬데믹으로 전국민이 경제적 고충을 호소하고 있는 상황에 물류 대란과 물가 상승까지 덮친다면
							헤어 나올 수 없는 위기에 빠질 수 있습니다.직접적으로 우리나라에서 쓰는 요소수의 97% 가량이 중국산인데 외교문제로
							현재 호주산 석탄 수입을 중단한 중국이 요소수 생산이 줄어들어 한국으로의 요소수 수출량을 대폭 줄였기 때문입니다.
							중국은 아예 요소수의 수출 검사를 의무화하기 까지 했기 때문입니다.</p>
					</div>

				</div>

			</div>
		</section>
		<hr class="m-0" />
		<!-- Skills-->
		<section class="resume-section" id="skills">
			<div class="resume-section-content">
				<h2 class="mb-5">Skills</h2>
				<div class="subheading mb-3">Main Programming Languages &
					Tools</div>
				<ul class="list-inline dev-icons">
					<li class="list-inline-item"><i class="fab fa-html5"></i></li>
					<li class="list-inline-item"><i class="fab fa-css3"></i></li>
					<li class="list-inline-item"><i class="fab fa-js"></i></li>
					<li class="list-inline-item"><i class="fab fa-java"></i></li>
					<li class="list-inline-item"><i class="fab fa-bootstrap"></i></li>
					<li class="list-inline-item"><i class="fab fa-git"></i></li>
					<li class="list-inline-item"><i class="fab fa-windows"></i></li>

				</ul>
				<div class="subheading mb-3">Detail Work-Skill</div>
				<ul class="fa-ul mb-0">
					<li><span class="fa-li"><i class="fas fa-check"></i></span>
						Frontend : HTML , JS , CSS, JQUERTY , AJAX , Bootstrap</li>
					<li><span class="fa-li"><i class="fas fa-check"></i></span>
						Backend : Java Servlet , Jsp , Mysql</li>
					<li><span class="fa-li"><i class="fas fa-check"></i></span>
						Etc : Map, Crawling, Git, Windows</li>
				</ul>
			</div>
		</section>
		<hr class="m-0" />
		<!-- Interests-->

	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>





	<!-- 글등록 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="modallogin"
		data-bs-keyboard="false" data-bs-backdrop="static" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h2 class="fw-bold mb-0">Board Write</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body p-5 pt-0">

					<form action="../../controller/boardwritecontroller.jsp"
						method="post" enctype="multipart/form-data">
						제목 : <input class="form-control" type="text" name="title"
							id="title"> <br> 내용 :
						<textarea class="form-control" rows="10" cols="20" name="contents"
							id="contents"></textarea>
						<br> 작성자 : <input class="form-control" type="text"
							name="writer" id="writer"> <br> 비밀번호 : <input
							class="form-control" type="password" name="pw" id="pw"> <br>
					</form>
					<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary"
						onclick="btnwrite()">글 등록</button>
				</div>
			</div>
		</div>
	</div>




	<!-- 글 목록 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="modalview"
		data-bs-keyboard="false" data-bs-backdrop="static" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h2 class="fw-bold mb-0">Board View</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body p-5 pt-0" id="modaltest1"></div>
			</div>
		</div>
	</div>


</body>
</html>
