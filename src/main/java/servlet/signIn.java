package servlet;

import beans.Users;
import conn.ConnectionUtils;
import utils.DBUtils;
import utils.MyUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import static java.lang.Thread.sleep;

/**
 * Servlet implementation class signIn
 */
@WebServlet(urlPatterns = "/signIn", name = "signIn")
public class signIn extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public signIn() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());

        request.getRequestDispatcher("/WEB-INF/views/signIn.jsp").forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // check number of login fail
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorString = null;
        String rememberMeStr = request.getParameter("rememberMe");
        boolean remember = "Y".equals(rememberMeStr);
        Users u = new Users();
        try {
            Connection conn = MyUtils.getStoredConnection(request);
            u = DBUtils.findUser(conn, username, password);

            if (u != null) {
                MyUtils.storeLoginedUser(session, u);

                // Nếu người dùng chọn tính năng "Remember me".
                if (remember) {
                    MyUtils.storeUserCookie(response, u);
                }
                // Ngược lại xóa Cookie
                else {
                    MyUtils.deleteUserCookie(response);
                }
                // set login fail = 0
                MyUtils.storeLoginFail(session,0);

                Users loginedUser = MyUtils.getLoginedUser(session);
                // Tạo đối tượng Connection kết nối database.
                conn = ConnectionUtils.getConnection(loginedUser.getUserName(), loginedUser.getPassword());
				// Lưu connection lại
				MyUtils.storeConnection(request, conn);

                if (loginedUser.getRoleID() == 3 || loginedUser.getRoleID() == 2 )
                    response.sendRedirect(request.getContextPath() + "/admin");
                else
                    response.sendRedirect(request.getContextPath() + "/home");
            } else {
                // set login fail = login fail + 1
                MyUtils.storeLoginFail(session,MyUtils.getLoginFail(session) + 1);
                //check number login fail > 3
                if (MyUtils.getLoginFail(session) > 3) {
                    MyUtils.storeLoginFail(session,0);
                    errorString = "Tài khoản đã bị khóa. Vui lòng liên hệ quản trị viên để mở khóa.";
                    request.setAttribute("errorString", errorString);
                    sleep(5000);
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                else {
                    errorString = "Sai tên đăng nhập hoặc mật khẩu. Vui lòng nhập lại.";
                    request.setAttribute("errorString", errorString);
                    request.getRequestDispatcher("/WEB-INF/views/signIn.jsp").forward(request, response);

                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}