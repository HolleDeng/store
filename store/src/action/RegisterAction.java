package action;

import user.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport {

	private User user;
	private UserDAO dao;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public RegisterAction() {

		this.dao = new UserDAO();
	}

	public String managerRegister() {

		boolean flag = dao.doManagerInsert(getUser());

		String msg = dao.getMsg();

		ActionContext.getContext().getSession().put("msg", msg);
		/*
		 * ֱ��ʹ��ActionContex���put()����
		 * 
		 * ActionContext.getContext().put("msg",
		 * "��ӭ������http://www. sunxin.org");
		 * 
		 * Ȼ���ڽ��ҳ���У������������ȡ��greeting���ԣ����£�
		 * 
		 * ${requestScope.msg} ���� <%=request.getAttribute("msg")%>
		 */
		if (flag == true) {

			return SUCCESS;
		}

		return ERROR;
	}

	public String normalRegister() {

		boolean flag = dao.doNormalInsert(getUser());

		String msg = dao.getMsg();

		ActionContext.getContext().getSession().put("msg", msg);

		if (flag == true) {

			return SUCCESS;
		}

		return ERROR;
	}
}
