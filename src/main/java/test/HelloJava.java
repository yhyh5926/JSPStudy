package test;

public class HelloJava {

	/*
	 * static으로 선언했으므로 인스턴스 생성 없이 클래스명으로 직접 호출 가능
	 */
	public static int myFx() {
		int sum = 0;
		for (int i = 0; i <= 10; i++) {
			sum += i;
		}
		return sum;
	}

	public int myFx(int s, int e) {
		int sum = 0;
		for (int i = s; i <= e; i++) {
			sum += i;
		}
		return sum;
	}
}
