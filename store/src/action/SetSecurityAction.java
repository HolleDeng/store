package action;

import tel.Tel;
import user.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

/**
 * 设置密保信息
 * @author hadoop
 *
 */
@SuppressWarnings("serial")
public class SetSecurityAction extends ActionSupport {

	private Tel tel;
	private User user;
	private UserDAO dao;

	public Tel getTel() {
		return tel;
	}

	public void setTel(Tel tel) {
		this.tel = tel;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public SetSecurityAction() {
		this.dao = new UserDAO();
	}

	@Override
	public String execute() throws Exception {
		/*
		 * 设置保密电话
		 */
		String userid = (String) ActionContext.getContext().getSession()
				.get("userid");
		String msg = null;
		boolean flag = dao.findTel(tel.getSectionNo(), tel.getTelNo()); //验证或校验电话号码是否合法，是否都是数字
		if(flag == false){
			msg = dao.getMsg();
			ActionContext.getContext().getSession().put("savesecuritymsg", msg); 
			return ERROR;
		}
		
		String security = tel.getSectionNo() + "-" + tel.getTelNo();
		flag = dao.saveSecurity(userid, security);
		msg = dao.getMsg();
		ActionContext.getContext().getSession().put("savesecuritymsg", msg);
		if (flag == true) {
			return SUCCESS;
		}
		return ERROR;
	}
}
