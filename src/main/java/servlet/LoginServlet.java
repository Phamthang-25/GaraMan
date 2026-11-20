package servlet;

import dao.MemberDAO;
import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

/** Xử lý đăng nhập */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Member member = MemberDAO.login(username, password);

        if (member == null) {
            req.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("member", member);

        if (member instanceof Customer) {
            resp.sendRedirect(req.getContextPath() + "/customer/CustomerView.jsp");
        } else if (member instanceof Manager) {
            resp.sendRedirect(req.getContextPath() + "/manager/ManagerView.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
