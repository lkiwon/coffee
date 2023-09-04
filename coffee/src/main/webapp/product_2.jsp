<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<% request.setCharacterEncoding("utf-8"); %>
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
		<h3>판매현황</h3>
		<table border=1>
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>상품별 판매액</td>
		</tr>
	<%
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT DISTINCT A.pcode, A.name, TO_CHAR(SUM(A.cost*B.amount) OVER(PARTITION BY A.pcode), '999,999,999') cost "
					+ "FROM tbl_product_01 A, tbl_salelist_01 B, tbl_shop_01 C "
					+ "WHERE C.scode = b.scode AND A.pcode = B.pcode "
					+ "ORDER BY 1";

			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
	%>			
				<tr>
					<td><%=rs.getString("pcode") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("cost") %></td>
				</tr>	
	<%			
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}	
	%>
		</table>
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>