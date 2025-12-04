<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>JSTL - choose/when/otherwise</title></head>
<body>
<!--  
choose태그 : 하위에 when, otherwise 태그를 가지고있다. 여러 조건이
	있는 경우에 사용하기 적합하다. 
--> 
    <c:set var="number" value="100" />

    <h4>choose 태그로 홀짝 판단하기</h4>
    <!-- 
    choose와 when태그 사이에 HTML 주석을 작성하면 에러가 발생한다. 
    또한 when과 otherwise사이에도 작성하면 안된다.
    JSP가 JSTL 태그를 인식하지 못하여 발생되는 에러임.  -->
    <c:choose>
        <c:when test="${ number mod 2 eq 0 }">
            ${ number }는 짝수입니다.
        </c:when>
        <c:otherwise>
        	<!-- else와 동일한 역할. 위 모든 조건을 만족하지 않을때
        	실행된다. -->
            ${ number }는 홀수입니다.
        </c:otherwise>
    </c:choose> 

    <h4>국,영,수 점수를 입력하면 평균을 내어 학점 출력</h4>
    <form> 
        국어 : <input type="text" name="kor" /> <br />
        영어 : <input type="text" name="eng" /> <br />
        수학 : <input type="text" name="math" /> <br />
        <input type="submit" value="학점 구하기" />
    </form>
    
    <!-- 세과목 모두 점수를 입력해야 조건에 만족하므로, 하나라도 입력하지
    않으면 평균점수는 출력되지 않는다.  -->
    <c:if test="${ not (empty param.kor or empty param.eng 
    				or empty param.math) }">
    				
    	<!-- 세과목의 점수를 더한 후 평균을 계산해서 avg 변수에 할당한다.
    	EL은 자동으로 형변환되므로 경우에 따라 실수의 결과가 나올수있다. -->
        <c:set var="avg" value="${(param.kor + param.eng + 
        									param.math) / 3}" />
        평균 점수는 ${avg }으로        
        <c:choose>  
            <c:when test="${ avg >= 90 }">A 학점</c:when>
            <c:when test="${ avg >= 80 }">B 학점</c:when>            
            <c:when test="${ avg ge 70 }">C 학점</c:when>
            <c:when test="${ avg ge 60 }">D 학점</c:when>
            <c:otherwise>F 학점</c:otherwise>
        </c:choose>
        입니다.
    </c:if>
</body>
</html>







