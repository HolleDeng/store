package action;

import tel.Tel;
import user.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

/**
 * �����ܱ���Ϣ
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
		 * ���ñ��ܵ绰
		 */
		String userid = (String) ActionContext.getContext().getSession()
				.get("userid");
		String msg = null;
		boolean flag = dao.findTel(tel.getSectionNo(), tel.getTelNo()); //��֤��У��绰�����Ƿ�Ϸ����Ƿ�������
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
