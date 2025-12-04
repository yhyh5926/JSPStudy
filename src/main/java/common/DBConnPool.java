package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
JNDI(Java Naming Directory Interface)
:디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서 참조(lookup)하는 
API로 쉽게 말하면 외부에 있는 개체를 이름으로 찾아오기 위한 기술

DBCP(Datebase Connection Pool : 커넥션풀)
:DB와 연결된 커넥션 객체를 미리 만들어 풀에 저장해 두었다가 필요할 때 
가져다 쓰고 반납하는 기법
DB의 부하를 줄이고 자원을 효율적으로 관리 가능.
워터파크의 유수풀 같은 거다
*/
public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public DBConnPool() {
		try {
			//Context 인스턴스 생성(Tomcat 컨테이너 생성)
			Context initCtx = new InitialContext();
			//Tomcat의 Root 디렉토리를 얻어온다
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			//그 안에서 미리 생성한 커넥션 풀 객체를 얻어온다
			DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");
			//이를 통해 DB에 연결, 즉 커ㅓ넥션 객체를 가져다가 사용한다
			con = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("DB 커넥션 풀 자원 반납");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
