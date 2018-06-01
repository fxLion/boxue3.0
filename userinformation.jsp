
<!DOCTYPE html>
<html lang="en">
<head>
		<title>用户信息</title>
	<link rel="stylesheet" type="text/css" href="styles/reset.css">
	<link rel="stylesheet" type="text/css" href="styles/main.css">
	<!-- 让IE6支持透明 -->
	<!--[if IE 6]>
	<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
	<script type="text/javascript" src="js/ie6Fixpng.js"></script>
	<![endif]-->
</head>
<body>
	
 <%@ page contentType="text/html;charset=utf-8"%>
<!--首先导入一些必要的packages-->
<%@ page info="database handler"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<!--告诉编译器使用SQL包--> 
<%@ page import="java.sql.*"%>
<% 
	String url="jdbc:odbc:Test2";
        String user ="sa";//这里替换成你自已的数据库用户名
        String password = "";//这里替换成你自已的数据库用户密码
	String username=(String)session.getAttribute("username");
	String sqlStr = "select * from iner where User_Name='"+username+"'";
	String email="";
	String address="";
	
        try{    //这里的异常处理语句是必需的.否则不能通过编译!
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        	//out.println( "类实例化成功!" );

            	Connection con = DriverManager.getConnection( url, user, password );
            	//out.println( "创建连接对像成功!" );

          	Statement st = con.createStatement();
          	//out.println( "创建Statement成功!" );
		
		ResultSet rs = st.executeQuery( sqlStr );
		rs.next();
		email=rs.getString("E_Mail");
		address=rs.getString("Address");
           	rs.close();
            	st.close();
            	con.close();
		
        }
        catch(Exception err){
            err.printStackTrace();
        }
%>

	<div class="headerBar">
		<div class="logo reg-logo">
			<div class="commonWidth">
				<div class="logo-pic fl">
					<a href="index.html"><img src="images/logo.png" alt="博学书城"></a>
				</div><!-- logoPic结束 -->
				<div class="welcome">欢迎注册</div>
			</div><!-- commonWidth结束 -->
		</div><!-- logo结束 -->
	</div><!-- headerBar结束 -->

	<div class="reg-box">
		<div class="login-cont">
			<ul class="login-list" >
				<h2>用户信息：</h2>
					<li class="clearfix" >
					<span class="reg-text-info" >用户名称：<%=username%></span>
					<!-- 直接从session中获取到username。上面的<%=%>是调用jsp的输出格式 -->
				</li>
				<li class="clearfix">
					<span class="reg-text-info" >用户邮箱：<%= email%></span>
				</li>
				<li class="clearfix">
					<span class="reg-text-info" >用户地址：<%=address%></span>
				</li>
				
				<li class="clearfix">
					<span class="reg-text">&nbsp;</span>
					<input type="button" name="" value="返 回" class="login-btn"  onclick='location.href="index.html"'>
				</li>
			
				
			</ul>
		</div><!-- login-cont结束 -->
	</div><!-- login-box结束 -->

	<div style="height:25px"></div>
	<!-- 这个div是为了撑开高度的，没有什么语意，不好！ -->
	<div class="footer">
		<P>
			<a href="#">博学简介</a><i>|</i>
			<a href="#">博学公告</a><i>|</i>
			<a href="#">招纳贤士</a><i>|</i>
			<a href="#">联系我们</a><i>|</i>客服热线：400-675-1234
		</P>
		<p>Copyright © 2017 - 2018 博学版权所有&nbsp;&nbsp;&nbsp;京ICP备09037834号&nbsp;&nbsp;&nbsp;京ICP证B1034-8373&nbsp;&nbsp;&nbsp;某市某公安局备案编号：10086580</p>
		<p class="footer-logo">
			<a href="#"><img src="images/footer-logo.png" alt="logo" /></a>
			<a href="#"><img src="images/footer-logo.png" alt="logo" /></a>
			<a href="#"><img src="images/footer-logo.png" alt="logo" /></a>
			<a href="#"><img src="images/footer-logo.png" alt="logo" /></a>
		</p>
	</div><!-- footer结束 -->
</body>
</html>