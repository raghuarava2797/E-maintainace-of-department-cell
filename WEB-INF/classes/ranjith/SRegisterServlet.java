package ranjith;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBcon;

/**
 * Servlet implementation class SRegisterServlet
 */
@WebServlet("/SRegisterServlet")
public class SRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String sname=request.getParameter("sname");
		String sid=request.getParameter("sid");
		String contact=request.getParameter("phno");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String p=request.getParameter("p");
		String dob=request.getParameter("dob");
		String fathername=request.getParameter("fathername");
		String branch=request.getParameter("branch");
		String section=request.getParameter("section");
		
		// database details

		String sql="insert into student values(?,?,?,?,?,?,?,?,?,?)";
		String sql2="select stid from student where stid=?";
		
		if(sname.equals("")||sid.equals("")||contact.equals("")||address.equals("")||gender.equals("")||p.equals("")||dob.equals("")||fathername.equals(""))
		{
			String message="All fields Are Mandatory";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/sregister.jsp").include(request, response);
		}
		else
		{
			try
			{
			Connection con=DBcon.getCon();
		System.out.println("connected");
		PreparedStatement ps2=con.prepareStatement(sql2);
		ps2.setString(1, sid);
		ResultSet rs=ps2.executeQuery();
		if(rs.next())
		{
			String message="student id Exist! Please enter another student id!!";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/sregister.jsp").include(request, response);
		}
		
		else
		{
			
			Connection conn=DBcon.getCon();
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, sname);
			ps.setString(2, sid);
			ps.setString(3, fathername);
			ps.setString(4, address);
			ps.setString(5, contact);
			ps.setString(6, branch);
			ps.setString(7, dob);
			ps.setString(8, section);
			ps.setString(9, p);
			ps.setString(10, gender);
		int i=ps.executeUpdate();
		if(i!=0)
		{
			String message="Registered Successfully";
			request.setAttribute("msg", message);
			getServletContext().getRequestDispatcher("/sregister.jsp").forward(request, response);
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
