package cn.techtutorial.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ThongTinKH
 */
@WebServlet("/TTKH")
public class ThongTinKH extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
try {
	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flower", "roor", "1924052002");

     // Câu lệnh SQL JOIN
     String sql = "Select users.name,users.email,users.password,comfirm.name,comfirm.address,comfirm.phone\r\n"
     		+ "from users\r\n"
     		+ "join comfirm on users.id=comfirm.u_id";

     stmt = conn.prepareStatement(sql);
     rs = stmt.executeQuery();

     // Tạo danh sách kết quả
     List<String[]> results = new ArrayList<>();
     while (rs.next()) {
         String[] result = new String[6];
         result[0] = rs.getString("name");
         result[1] = rs.getString("email");
         result[2] = rs.getString("password");
         result[3] = rs.getString("name");
         result[4] = rs.getString("address");
         result[5] = rs.getString("phone");
         
         results.add(result);
     }

     // Chuyển dữ liệu vào request attribute
     request.setAttribute("results", results);

     // Chuyển hướng đến trang JSP để hiển thị kết quả
    // request.getRequestDispatcher("ThongtinKH.jsp").forward(request, response);
     response.sendRedirect("ThongtinKH.jsp");
 
} catch (Exception e) {
	// TODO: handle exception
}finally {
    // Đảm bảo kết nối được đóng sau khi sử dụng
    if (conn != null) {
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
	}
}


