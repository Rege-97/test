package com.yong.scope;

public class ScopeTest {
	private int count;

	public ScopeTest() {
		count = 0;
		System.out.println("ScopeTest객체 생성됨!");
	}

	public int getCount() {
		System.out.println("돌려준 count값 : " + count);
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count + "값이 입력되고 누적된 값은 " + this.count + " 입니다.");
	}

}
