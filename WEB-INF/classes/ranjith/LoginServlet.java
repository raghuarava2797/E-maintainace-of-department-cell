package ranjith;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("usename");
		String passwrd=request.getParameter("password");	// TODO Auto-generated method stub
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/emaintainance";
	String username="root";
	String password="root";
	String sql="select * from admin where username=? and password=?";
	if(user.equals("")||passwrd.equals(""))
	{
		String message="userid or password connot be empty";
		request.setAttribute("msg", message);// TODO Auto-generated method stub
	getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
	}
	else
		{
		try
		{
		Class.forName(driver);
		Connection conn= DriverManager.getConnection(url,username,password);
		PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1,user);
		ps.setString(2,passwrd);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			HttpSession session=request.getSession();
			session.setAttribute("user",user);
			getServletContext().getRequestDispatcher("/adminhome.jsp").forward(request,response);
			
		}
		else
		{
			String message="please enter valid emailid or password";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/login.jsp").include(request,response);
		}
				
				
		}
		catch(Exception e)
	
		
		{
			e.printStackTrace();
			}
		}

}
}
