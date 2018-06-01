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
        String sqlquery = "select * from iner";
  	String username=new String(request.getParameter("username")).trim();//用户名
 	String pwd=new String(request.getParameter("pwd")).trim();//密码
	String email=new String(request.getParameter("email")).trim();//邮箱
 	String address=new String(request.getParameter("address")).trim();//地址

 	String sqlinsert="insert into iner(User_Name,Password,E_Mail,Address) values('"+username+"','"+pwd+"','"+email+"','"+address+"')";//sql语句


        try{    //这里的异常处理语句是必需的.否则不能通过编译!    
         //     Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        	//out.println( "类实例化成功!" );

            	Connection con = DriverManager.getConnection( url, user, password );
            	//out.println( "创建连接对像成功!" );

          	Statement st = con.createStatement();
          	//out.println( "创建Statement成功!" );
		
    		try{
			st.executeUpdate(sqlinsert);//插入数据
 			//out.println( "操作数据表，数据插入成功!" );
    			//out.println(sqlinsert);
			//out.println("------注册成功------");
                        out.println("<script>alert('注册成功'); window.location='index.html';</script>");
		}
		catch(Exception err){
			out.println("<script>alert('注册失败，检查用户名或密码信息！'); window.location='signIn.html';</script>");
		}
            	st.close();
            	con.close();
		
        }
        catch(Exception err){
            err.printStackTrace();
        }
%>