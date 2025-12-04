package apps;

import jakarta.servlet.ServletContext;

public class MyGlobalVar {

	/*
	 JSP에서 인수로 전달해준 application 내장 객체를 받아서
	 경로를 반환
	 */
	public String useImplicitObject(ServletContext app) {
		return app.getRealPath("/02ImplicitObject");
	}

}
