package cxcom.cx.www.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 추상 메소드
	public String execute(HttpServletRequest req, HttpServletResponse resp);
}
