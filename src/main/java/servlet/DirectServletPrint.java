package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DirectServletPrint extends HttpServlet {

	/*
	사용자가 POST 방식으로 전송한 요청 처리르 ㄹ위해 doPost()를 오버라이딩
	만약 이 메서드가 없으면 요청을 처리할 수 없어 405 에러 발생 
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		서블릿에서 직접 HTML태그를 출력하기 위해 문서의 콘텐츠 타입 설정
		JSP의 경우 page 지시어에 의해 설정된다. 
		 */
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();

		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력합니다</h2>");
		writer.println("<p>jsp로 포워드하지 않습니다.</p>");
		writer.println("</body>");
		writer.println("<html>");
		writer.close();
		
		/*
		 이 방식은 JSP 없이 서블릿에서 직접 내용 출력해야 할 때 사용
		 주로 REST API를 만들 때 사용
		 */
	}

}
