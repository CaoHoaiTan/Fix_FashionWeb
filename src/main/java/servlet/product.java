package servlet;

import beans.LoaiSP;
import beans.SanPham;
import utils.DBUtils;
import utils.MyUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "product", value = "/product")
public class product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        List<SanPham> listSP;
        List<LoaiSP> listLoaiSP;
        int numP_display = 12;
        int page = 1;
        int brand = 0;
        int totalpage;
        try {
            Connection conn = MyUtils.getStoredConnection(request);
            listLoaiSP = DBUtils.getAllLoaiSP(conn);

            brand = request.getParameter("brand") == null ? 0 : Integer.valueOf(request.getParameter("brand"));
            page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));

            if (brand != 0) {
                listSP = DBUtils.getSanPhambymaLoaiSP(conn, String.valueOf(brand));
            } else
                listSP = DBUtils.getAllSanPham(conn);

            totalpage = listSP.size() % numP_display == 0 ? listSP.size() / numP_display : listSP.size() / numP_display + 1;

            if (page < 0 || page > totalpage)
                page = totalpage;
            request.setAttribute("listSP", listSP);
            request.setAttribute("listLoaiSP", listLoaiSP);
            request.setAttribute("page", page);
            request.setAttribute("brand", brand);
            request.setAttribute("numP_display", numP_display);
            request.setAttribute("totalpage", totalpage);
            new cart().doPost(request, response);
            request.getRequestDispatcher("/WEB-INF/views/product.jsp").forward(request, response);
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
