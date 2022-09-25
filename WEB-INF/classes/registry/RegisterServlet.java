package registry;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBcon;
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// text field details
		String fname=request.getParameter("fname");
		String fid=request.getParameter("fid");
		String contact=request.getParameter("phno");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String q=request.getParameter("q");
		String ts=request.getParameter("ts");
		String fathername=request.getParameter("fathername");
		String branch=request.getParameter("branch");
		String department=request.getParameter("department");
		
		// database details

		String sql="insert into faculty values(?,?,?,?,?,?,?,?,?,?)";
		String sql2="select facultyid from faculty where facultyid=?";
		
		if(fname.equals("")||fid.equals("")||contact.equals("")||address.equals("")||gender.equals("")||q.equals("")||ts.equals("")||fathername.equals(""))
		{
			String message="All fields Are Mandatory";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/register.jsp").include(request, response);
		}
		else
		{
			try
			{
			Connection con=DBcon.getCon();
		System.out.println("connected");
		PreparedStatement ps2=con.prepareStatement(sql2);
		ps2.setString(1, fid);
		ResultSet rs=ps2.executeQuery();
		if(rs.next())
		{
			String message="facultyid Exist! Please enter another facultyid!!";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/register.jsp").include(request, response);
		}
		
		else
		{
			
			Connection conn=DBcon.getCon();
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, fname);
			ps.setString(2, fid);
			ps.setString(3, fathername);
			ps.setString(4, address);
			ps.setString(5, contact);
			ps.setString(6, q);
			ps.setString(7, ts);
			ps.setString(8, branch);
			ps.setString(9, department);
			ps.setString(10, gender);
		int i=ps.executeUpdate();
		if(i!=0)
		{
			String message="Registered Successfully";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
		}
		
			}
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		
			}	
		}
	
	

