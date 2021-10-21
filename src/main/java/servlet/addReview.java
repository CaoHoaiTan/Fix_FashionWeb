package servlet;

import beans.Users;
import conn.ConnectionUtils;
import utils.DBUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/addReview", name = "addReview")
public class addReview extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn;
        String maSP  = request.getParameter("maSP");
        try {
            conn = ConnectionUtils.getConnection();
            HttpSession session= request.getSession();
            Users a = (Users) session.getAttribute("loginedUser");

            if (a!=null)
            {
                int maKH=a.getMaKH();

                String noiDung = request.getParameter("textReview");
                DBUtils.Addreview(conn, maKH,maSP,noiDung);
                response.sendRedirect("detail");

            }
            else {
                request.getRequestDispatcher("signIn").forward(request,response);
            }

        } catch (ClassNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}