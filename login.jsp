<%@ page contentType="text/html;charset=utf-8"%>
<!--首先导入一些必要的packages-->
<%@ page info="database handler"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<!--告诉编译器使用SQL包--> 
<%@ page import="java.sql.*"%>
<% 

        //String url = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=JDBCTEST";
	String url="jdbc:odbc:Test2";
        String user ="sa";//这里替换成你自已的数据库用户名
        String password = "";//这里替换成你自已的数据库用户密码
        //String sqlquery = "select * from iner";
	
  	String username=new String(request.getParameter("username")).trim();//用户名
 	String pwd=new String(request.getParameter("pwd")).trim();//密码

        try{    //这里的异常处理语句是必需的.否则不能通过编译!    
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        	//out.println( "类实例化成功!" );

            	Connection con = DriverManager.getConnection( url, user, password );
            	//out.println( "创建连接对像成功!" );

          	Statement st = con.createStatement();
          	//out.println( "创建Statement成功!" );
		String sql="select * from iner where User_Name='"+username+"'";
		sql+="and Password='"+pwd+"'";
		ResultSet rs = st.executeQuery( sql );
		if(rs.next()){
			session.setAttribute("username",username);//存入session
                //out.println(username);
                out.println("<script>alert('登录成功'); window.location='index.html';sessionStorage.setItem('username','"+username+"');</script>");//修改跳转页面，这里的setItem（'id','value'）;一定要加上单引号
		}
		else{
			out.println("<script>alert('登陆失败,请检查用户名或密码');window.location='login.html'; </script>");///////////
		}
           	rs.close();
            	st.close();
            	con.close();
		
        }
        catch(Exception err){
            err.printStackTrace();
        }
%>