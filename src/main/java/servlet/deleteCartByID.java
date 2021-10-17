package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SanPhamInCart;
import conn.ConnectionUtils;
import utils.DBUtils;

/**
 * Servlet implementation class deleteCartByID
 */
@WebServlet(urlPatterns = "/deleteCartByID", name = "deleteCartByID")
public class deleteCartByID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCartByID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Connection conn;
		List<SanPhamInCart> listSP = null;
		try {
			conn = ConnectionUtils.getConnection();
			//
			String cartID = request.getParameter("cartID");
			DBUtils.deleteCartByID(conn, cartID);
			//
			
			
			listSP = DBUtils.getSanPhamInCart(conn,"1");//
			request.setAttribute("listSPinCart", listSP);
			//
			double sum = DBUtils.tongTienInCart(conn,"1");
			request.setAttribute("sumAll",sum);
			//
			request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
