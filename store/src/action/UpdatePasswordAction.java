package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

@SuppressWarnings("serial")
public class UpdatePasswordAction extends ActionSupport {

	private String password;
	private String rePassword;
	private UserDAO dao;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public UpdatePasswordAction(){
		this.dao = new UserDAO();
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String userid = (String) ActionContext.getContext().getSession().get("userid");
		boolean flag = dao.doPassword(userid, getPassword(), getRePassword());
		String msg = dao.getMsg();
		if(flag == true){
			ActionContext.getContext().getSession().put("updatepasswordsuccessmsg", msg);
			return SUCCESS;
		}
		ActionContext.getContext().getSession().put("updatepassworderrormsg", msg);
		return ERROR;
	}
}
