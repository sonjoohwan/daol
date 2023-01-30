<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="util.*,vo.Product_ph"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
 <link rel="stylesheet" href="css/productPage.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<title>에텔랑 상품보기 </title>

</head>
<body>
<% 
int productPageNum = (int)request.getAttribute("productPageNum"); 
int MaxProductPageNum = (int)request.getAttribute("MaxProductPageNum"); 
%>
<%@ include file="../header_nav3.jsp" %>

  <img class="top-img" src="images/메인_에텔랑.jpg" style="background: black;">
 <!----------------------------------------------------------------------->
<div style="text-align:center; padding: 0px; border-bottom: 1px solid rgba(2,82,168); " >
		<ul class="custom-navbar" >
            <li><a href="product_ph.daol" class="titletip"><strong>PHPOMULA</strong><span class="textTop">Ph포뮬라</span></a></li>
            <li><a href="product_et.daol" class="titletip"><strong>ETELANC</strong><span class="textTop">에텔랑</span></a></li>
            <li><a href="product_de.daol" class="titletip"><strong>D.L THE AROMA</strong><span class="textTop">디.엘더아로마</span></a></li>
            <li><a href="product_2B.daol" class="titletip"><strong>2B.BIO BEAUTY</strong><span class="textTop">2B바이오뷰티</span></a></li>
            <li><a href="product_my.daol" class="titletip"><strong>BEAUTY DEVICE</strong><span class="textTop">미용기기</span></a></li>
            <li><a href="other_product.daol" class="titletip"><strong>OTHER PRODUCTS</strong><span class="textTop">기타 제품</span></a></li>
        </ul>
	</div>

<!--윗부분  --------------------------------------------------------------------------------------->
<div style="text-align: center;">
<img class="senter-img" src="images/메인_에텔랑.jpg" >
</div>

<div class="s-div">
		<dl class="ss-dl">  
		<dt class="fo_noto" style="color:rgb(2,82,168); ">Etelanc</dt>
		<dd>에텔랑은 AESTHETIC + BLANC의 합성어로 '에스테틱의 순수함' 이라는 뜻을 지닌 에스테틱 전문 브랜드. 자연에서 찾은 건강한 성분으로 피부의 자생능력을 키워
		건강한 피부를 목표로하는 제품이며, 천연성분으로 정직하고 순수한 아름다움이 가득 담겨져 있는 '에텔랑'
		에스테틱의 전통과 자연의 건강한 아름다움이 만나 최상의  시너지를 얻을 수 있게 도움을 주는 '에텔랑'
		</dd>


	</dl>
	<br><br><br>
</div>


 <section id = "listForm">
  <div class ="divide30" style="border-top: 1px solid #e5e5e5; width: 1020px;  margin: 0 auto;"></div> 
 <h5 style="text-align: center; margin-top: 40px; margin-bottom: 40px;"><strong style="font-size: 50px; color: rgba(2,82,168);">Etelanc</strong></h5>
	<c:if test="${product_etList != null }"> <!--1. 상품목록이 있으면 -->
			<table class="productListTBL">
				<tr>
					<c:forEach var="product_et" items="${product_etList}" varStatus="i">
					<td class="productListTD">
						<div class="carbox">
						<a style="padding : 60px; padding-bottom: -10px;" href="product_etView.daol?product_no=${product_et.product_no}"><img src="images/${product_et.product_image}" style="margin-top: 10px;" id="productImage"/></a>
						<hr>
						<strong>${product_et.product_name }</strong><br/>
						<strong>${product_et.product_cap }</strong><br/>
						</div>
					</td>
					  <input type="hidden" id="width-var" value="">
					<!--상품 목록을 출력할 때 1줄에 4개씩만 나란히 출력되도록 하기위해  -->
					<c:if test="${((i.index+1) mod 4)==0}">
						</tr>
						<tr>
					</c:if>
					</c:forEach>
			</tr>
			</table>
	</c:if>
	
	<c:if test="${product_etList == null }"> <!--2. 상품목록이 없으면 -->
		<div class="div_empty">상품이 없습니다.</div>
	</c:if>
	<br>
	
<nav aria-label="Page navigation example" style="margin: 20px 0 20px 0;">
  <ul class="pagination justify-content-center">
  <%if(productPageNum ==1 ) { %>
   <li class="page-item" >
      <a class="page-link" href="#" aria-label="Previous" >
        <span aria-hidden="true" style="color: 	#DC143C;">&laquo;</span>
      </a>
    </li>
    <%}else if(productPageNum!=1) { %>
    <li class="page-item">
      <a class="page-link" href="product_et.daol?productPageNum=${productPageNum-1}" aria-label="Previous">
        <span aria-hidden="true" style="color: 	#DC143C;">&laquo;</span>
      </a>
    </li>
    <%} %>
    <c:forEach var="i" begin="1" end="${MaxProductPageNum }" step="1" >
   		<li class="page-item" ><a class="page-link" href="product_et.daol?productPageNum=${i}" style="color: black;">${i}</a> </li>
	</c:forEach>
	<%if(productPageNum < MaxProductPageNum){%>
     <li class="page-item">
      <a  class="page-link" href="product_et.daol?productPageNum=${productPageNum+1}" aria-label="Next">
        <span aria-hidden="true" style="color: 	#DC143C;">&raquo;</span>
      </a>
    </li>
    <%}else if(productPageNum == MaxProductPageNum){%>
     <li class="page-item">
      <a class="page-link" href="product_et.daol?productPageNum=${productPageNum+1}" aria-label="Next">
        <span aria-hidden="true" style="color: 	#DC143C;">&raquo;</span>
      </a>
    </li>
    <%} %>
  </ul>
</nav>



</section>
<script>//첫페이지, 마지막페이지 표시용
	function firstPage() {alert("첫 페이지입니다.");}
	function lastPage() {alert("마지막 페이지입니다.");}
</script>
 

<%@ include file ="../footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>