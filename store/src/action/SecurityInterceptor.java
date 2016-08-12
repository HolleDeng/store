package action;

import user.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import dao.UserDAO;

@SuppressWarnings("serial")
public class SecurityInterceptor extends AbstractInterceptor{

	private User user;
	private UserDAO dao;
	
	public SecurityInterceptor(){
		this.user = new User();	
		this.dao = new UserDAO();
	}
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		
		ActionContext ac = arg0.getInvocationContext();
		
		String userid = (String)ac.getSession().get("userid");
		String security = (String)ac.getSession().get("security");
		
		user.setUserid(userid);
		user.setSecurity(security);
		
		String flag = dao.findSecurity(userid);
		
		if(flag != null){
			
			return arg0.invoke();
		}
		
		ActionContext.getContext().getSession().put("nosecurity", "不好意思！您还没有通过密保！请先校验您的密保！");
		
		return "security";
	}
}
