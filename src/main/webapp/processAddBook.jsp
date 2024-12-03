<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<% 
request.setCharacterEncoding("UTF-8");

String filename="";
String realFolder="D:\eclipse-workspace2\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\0-directives-actions-swallow02";

int maxSize = 5 * 1024 * 1024;
String encType="utf-8";

MultipartRequest multi=new MultipartRequest(request,realFolder,
		maxSize,encType,new DefaultFileRenamePolicy())

String bookId=multi.getParameter("bookId");
String name=multi.getParameter("name");
String unitPrice=multi.getParameter("unitPrice");
String author=multi.getParameter("author");
String publisher=multi.getParameter("publisher");
String releaseDate=multi.getParameter("releaseDate");
String description=multi.getParameter("description");
String category=multi.getParameter("category");
String unitsInStock=multi.getParameter("unitInStock");
String condition=multi.getParameter("condition");

Enumeration files=multi.getFileNames();
String fname=(String) files.nextElement();
String fileName=multi.getFilesystemName(fname);

Integer price;

if(unitPrice.isEmpty())
	price=0;
else
	price=Integer.valueOf(unitPrice);

long stock;

if(unitsInStock.isEmpty())
	stock=0;
else
	stock=Long.valueOf(unitsInStock);

PreparedStatement pstmt=null;

String sql="INSERT INTO book VALUES(?,?,?,?,?,?,?,?,?,?,?)";

pstmt=conn.prepareStatement(sql);
pstmt.setString(1,boolId);
pstmt.setString(2,name);
pstmt.setString(3,price);
pstmt.setString(4,author);
pstmt.setString(5,description);
pstmt.setString(6,publisher);
pstmt.setString(7,category);
pstmt.setString(8,stock);
pstmt.setString(9,releaseDate);
pstmt.setString(10,condition);
pstmt.setString(11,fileName);
pstmt.executeUpdate();

if(pstmt!=null)
	pstmt.close();
if(conn!=null)
	conn.close();

response.sendRedirect("books.jsp");
%>
