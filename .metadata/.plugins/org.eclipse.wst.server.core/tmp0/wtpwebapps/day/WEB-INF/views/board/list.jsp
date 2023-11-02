<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	  <h2>Spring MVC 09</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">
	    
	    <c:if test = "${empty mvo}"> 
	    	<form class="form-inline" action="${cpath}/login/loginProcess" method = "post">
				<div class="form-group">
					<label for="id">ID:</label>
					<input type="text" class="form-control" id="id" name="memid">
				</div>
				<div class="form-group">
					<label for="pw">PW:</label>
					<input type="password" class="form-control" id="pw" name="mempw">
				</div>
				<button type="submit" class="btn btn-default" >로그인</button>	    	
	    	</form>
	    </c:if>	
	    <c:if test = "${not empty mvo}"> 
	    	<form class="form-inline" action="${cpath}/login/logoutProcess" method="post">
	    		<div>
	    			<label>${mvo.memname}님 방문을 환영합니다.</label>
	    			<button type="submit" class="btn btn-default pull-right">로그아웃</button>
	    		</div>
	    		
	    	</form>
	    	
	    	
	    	
	    </c:if>	
	    </div>
	    <div class="panel-body">
	    	<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<tbody>
						<c:forEach items = "${list}" var = "list" varStatus="i">
							<tr>
								<td>${i.count}</td>
								
								<td>
								<c:if test = "${list.boardavailable == 0 }">
									<a href="javascript:alert('삭제된 게시글입니다.')">
									<c:if test="${list.boardlevel>0}">
										<c:forEach begin="0" end="${list.boardlevel}" step="1"> 
											<span style="padding-left:15px"></span>
										</c:forEach>
									ㄴ[RE]
									</c:if>	
									삭제된 게시물 입니다. 
									</a>
								</c:if>
								<c:if test = "${list.boardavailable > 0 }">
									<a class="move" href="${list.idx }">
									<c:if test="${list.boardlevel>0}">
										<c:forEach begin="0" end="${list.boardlevel}" step="1"> 
											<span style="padding-left:15px"></span>
										</c:forEach>
									ㄴ[RE]
									</c:if>	
									<c:out value="${list.title}" />
									</a>
									</c:if>	
								</td>
								
								
								<td>${list.writer}</td>
								<td>
									<fmt:formatDate value="${list.indate}" pattern="yyyy-MM-dd"/>
								</td>
								<td>${list.count}</td>
							</tr>
						</c:forEach>
					</tbody>
					<c:if test = "${not empty mvo}"> 
						<tr>
							<td colspan="5">
								<button id="regBtn" class="btn btn-info pull-right">글쓰기</button>
							</td>
						</tr>
					</c:if>		
				</thead>	    	
	    	</table>
	    	<!-- 검색메뉴 -->
	    	<div style="text-align : center">
	    		<form class="form-inline" action="${cpath}/board/list" method="post">
	    			<div class="form-group">
	    				<select name="type" class="form-control">
	    					<option value="writer" ${pageMaker.cri.type=='writer'? 'selected' : ''}>이름</option>
	    					<option value="title" ${pageMaker.cri.type=='title'? 'selected' : ''}>제목</option>
	    					<option value="content" ${pageMaker.cri.type=='content'? 'selected' : ''}>내용</option>
	    				</select>
	    			</div>
	    			<div class="form-group">
	    				<input type="text" value="${pageMaker.cri.keyword }" class="form-control" name="keyword">
	    			</div>
	    			<button type="submit" class="btn btn-success">검색</button>
	    		</form>
	    	</div>
	    	
	    	<div class="col text-center">
				  <ul class="pagination">
				    <!-- 이전 번호 처리 -->
				    <c:if test = "${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage - 1}">◀</a>
						</li>
				    </c:if>
				    <!-- 페이지 번호 처리 -->
				    <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				    	<c:if test="${pageMaker.cri.page == pageNum}">
				    		<li class="active"><a>${pageNum}</a></li>	
				    	</c:if>
				    	<c:if test="${pageMaker.cri.page != pageNum}">
				    		<li class="paginate_button"><a href="${pageNum}">${pageNum}</a></li>	
				    	</c:if>
				    </c:forEach>
				     <!-- 다음 번호 처리 -->
				    <c:if test = "${pageMaker.next}">
						<li class="paginate_button previous">
							<a href="${pageMaker.endPage + 1}">▶</a>
						</li>
				    </c:if>
				  </ul>
				</div>
				<form action="${cpath}/board/list" id = "pageFrm">
					<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum" value="${pageMaker.cri.perPageNum}">
					<!-- type과 keyword를 넘기기위한 부분 추가 -->
					<input type="hidden" id="type" name="type" value="${pageMaker.cri.type}">
					<input type="hidden" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
				</form>
	    	
	    </div>
	    <div class="panel-footer">-편승훈-</div>
	  </div>
	</div>
	 <!-- Modal -->
  <div class="modal fade" id="myMessage" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="messageType" class="modal-content">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">modal header</h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			// 페이지 번호 클릭시 이동하기
			var pageFrm = $("#pageFrm")
			$(".paginate_button a").on("click", function(e){
				//e 현재 클릭한 a태그 요소 자체
				e.preventDefault(); // a태그의 href속성 작동막기
				var page = $(this).attr("href"); //클릭한 a태그의 href의 값
				pageFrm.find("#page").val(page);
				pageFrm.submit();
			});
			
			//상세보기 클릭시 이동
			$(".move").on("click",function(e){
				e.preventDefault(); // a태그의 href속성 작동막기
				var idx = $(this).attr("href");
				var tag = "<input type='hidden' name='idx' value='"+idx+"'>";
				pageFrm.append(tag);
				pageFrm.attr("action", "${cpath}/board/get")
				pageFrm.submit();
				
				
				
			});
			
			
						
			var result = "${result}";
			checkModal(result);
			
			$("#regBtn").click(function(){
				location.href="${cpath}/board/register";
				
			});	
		});
	
		function checkModal(result){
			if(result==""){
				return;
			}
			if(parseInt(result) > 0){
				$(".modal-body").text("게시글" + result + "번이 등록되었습니다.")
				$("#myMessage").modal("show");
			}
		}
		
	
	
	</script>
</body>
</html>
