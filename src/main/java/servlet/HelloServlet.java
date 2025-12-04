package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class HelloServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//request 영역에 속성 저장
		req.setAttribute("message", "Hello Servlet..!!");
		//View에 해당하는 JSP로 포워드
		req.getRequestDispatcher("/12Servlet/HelloServlet.jsp").forward(req, resp);
		
		/*
		request 영역에 저장된 데이터는 포워드된 페이지까지 공유되므로 
		서블릿에서 저장한 여러가지 타입의 속성은 JSP에서 사용 가능
		*/
	}
}
