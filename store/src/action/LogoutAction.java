package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

@SuppressWarnings("serial")
public class LogoutAction extends ActionSupport {

	private UserDAO dao;
	
	public LogoutAction(){
		this.dao = new UserDAO();
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		String userid = (String)ActionContext.getContext().getSession().get("userid");
		
		boolean flag1 = dao.saveLastdate(userid);
		
		String msg = dao.getMsg();

		ActionContext.getContext().getSession().put("saveLastdatemsg", msg);
		
		boolean flag2 = dao.saveLoginNum(userid);
		
		msg = dao.getMsg();
		
		ActionContext.getContext().getSession().put("saveloginNummsg", msg);
		
		if((flag1 == true) && (flag2 == true)){
			return SUCCESS;
		}
		return ERROR;
	}
}
