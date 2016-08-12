package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

@SuppressWarnings("serial")
public class FindPasswordAction extends ActionSupport {

	private String userid;
	private String security;
	private UserDAO dao;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSecurity() {
		return security;
	}

	public void setSecurity(String security) {
		this.security = security;
	}

	public FindPasswordAction() {
		this.dao = new UserDAO();
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String s = dao.findSecurity(getUserid());
		if (s != null && s.equals(getSecurity())) {
			ActionContext.getContext().getSession()
					.put("findpasswordsuccessmsg", "密保验证通过！");
			ActionContext.getContext().getSession().put("userid", getUserid());
			ActionContext.getContext().getSession().put("security", getSecurity());
			return SUCCESS;
		}
		ActionContext.getContext().getSession()
				.put("findpassworderrormsg", "密保验证失败！请重新输入！");
		return ERROR;
	}
}
