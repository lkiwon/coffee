<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<% request.setCharacterEncoding("utf-8");

	Connection conn = null;
	Statement stmt = null;

	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select MAX(saleno)+1 saleno from tbl_salelist_01";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String saleno = rs.getString("saleno");
%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>매장별 커피 판매관리 프로그램</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
	   <h3>판매등록</h3>
           <form name="form1" method="post" action="action.jsp">
                <table border="1">
                    <tr>
                        <td>비번호</td>
                        <td><input type="text" name="saleno" value="<%= saleno %>"></td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td><input type="text" name="pcode" value=""></td>
                    </tr>
                    <tr>
                        <td>판매날짜</td>
                        <td><input type="date" name="saledate" value=""></td>
                    </tr>
                    <tr>
                        <td>매장코드</td>
                        <td><input type="text" name="scode" value=""></td>
                    </tr>
                    <tr>
                        <td>판매수량</td>
                        <td><input type="text" name="amount" value=""></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="등  록" onclick="">
                            <input type="reset" value="다시쓰기" onclick="">
                        </td>
                    </tr>
                </table>
            </form>
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>