package action;

import java.util.Map;

import user.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {

	private User user;
	private UserDAO dao;
	private String savetime;
	private String code;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public LoginAction() {

		this.dao = new UserDAO();
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String internationalization() {
		return SUCCESS;
	}

	@Override
	public String execute() throws Exception {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		String rand = (String) session.get("rand"); // 从session中取出验证码
		String msg = "验证码验证通过！";
		if (rand.equals(code)) {
			ActionContext.getContext().getSession().put("codemsg", msg);
			boolean flag = dao.findLogin(getUser());
			msg = dao.getMsg();
			String lastdate = dao.findLastdate(user.getUserid());
			if (lastdate == null) {
				lastdate = "您是第一次登陆！";
			} else {
				lastdate = "上次登录时间为：" + lastdate;
			}
			ActionContext.getContext().getSession().put("loginmsg", msg);
			int loginNum = dao.findLoginNum(user.getUserid());
			String loginnummsg = "您是第" + loginNum + "登录！";
			if (flag == true) {
				ActionContext.getContext().getSession()
						.put("lastdate", lastdate);
				ActionContext.getContext().getSession()
						.put("userid", user.getUserid());
				ActionContext.getContext().getSession()
						.put("password", user.getPassword());
				ActionContext.getContext().getSession()
						.put("role", user.getRole());
				ActionContext.getContext().getSession()
						.put("cookiesavetime", savetime);
				ActionContext.getContext().getSession()
						.put("loginnummsg", loginnummsg);
				return SUCCESS;
			} else {
				return "loginerror";
			}
		}
		msg = "验证码输入错误！请重新输入正确的验证码！";
		ActionContext.getContext().getSession().put("codemsg", msg);
		return "codeerror";
	}
}
