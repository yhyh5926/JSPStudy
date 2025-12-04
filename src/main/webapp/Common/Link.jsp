<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 페이지</title>
<style>
.header {
    width: 100%;
    background-color: yellowgreen;
    padding: 10px;
}

.header tr td {
    display: flex;
    justify-content: flex-end; 
    align-items: center;      
}

.header a {
    text-decoration: none;
    margin-left: 15px;
    font-size: 16px;
    font-weight: bold;
    color: white;
    transition: color 0.3s ease;
}

.header div {
    margin-right: 15px;
    color: white;
    font-weight: bold;
}

.header-login:hover {
    color: red;
}
.header-logout:hover {
    color: orange;
}
.header-board1:hover {
    color: yellow;
}
.header-board2:hover {
    color: blue;
}
</style>
</head>
<body>
    <table class="header">
        <tr>
            <td>
                <% if (session.getAttribute("UserId") == null) { %>
                      <a href="../06Session/LoginForm.jsp" class="header-login">로그인</a>
                <% } else { %>
                                    <div>
                        <%=session.getAttribute("UserName")%> 회원님, 로그인하셨습니다.
                    </div>
                    <a href="../06Session/Logout.jsp" class="header-logout">로그아웃</a>
                <% } %>

                <!-- 회원제 게시판 링크 -->
                <a href="../mvcboard/list.do" class="header-board1">게시판1(페이징x)</a>
                <a href="../mvcboard/listPage.do" class="header-board2">게시판2(페이징o)</a>
            </td>
        </tr>
    </table>
</body>
</html>