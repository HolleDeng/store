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
		 * 直接使用ActionContex类的put()方法
		 * 
		 * ActionContext.getContext().put("msg",
		 * "欢迎您来到http://www. sunxin.org");
		 * 
		 * 然后在结果页面中，从请求对象中取出greeting属性，如下：
		 * 
		 * ${requestScope.msg} 或者 <%=request.getAttribute("msg")%>
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
