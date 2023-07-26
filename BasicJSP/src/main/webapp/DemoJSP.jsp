<%@page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!Connection con;
PreparedStatement ps;
public void jspInit(){
	
try{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","open6162");
	ps=con.prepareStatement("insert into student values(?,?,?)");
}catch(Exception e){
	e.printStackTrace();
}
}

public void jspDestroy()  {
	try{
		ps.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>

<%
String name=request.getParameter("name");
int id=Integer.parseInt(request.getParameter("id"));
int age=Integer.parseInt(request.getParameter("age"));

ps.setString(1,name);
ps.setInt(2,id);
ps.setInt(3,age);
ps.executeUpdate();

%>
</body>
</html>