package action;

import user.User;
import dao.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class LoginInterceptor extends AbstractInterceptor {

	private User user;
	private UserDAO dao;
	
	public LoginInterceptor(){
		this.user = new User();	
		this.dao = new UserDAO();
	}
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		
		ActionContext ac = arg0.getInvocationContext();
		
		String userid = (String)ac.getSession().get("userid");
		String password = (String)ac.getSession().get("password");
		String role = (String)ac.getSession().get("role");
		
		user.setUserid(userid);
		user.setPassword(password);
		user.setRole(role);
		
		boolean flag = dao.findLogin(user);
		
		if(flag == true){
			
			return arg0.invoke();
		}
		
		ActionContext.getContext().getSession().put("nologin", "不好意思！你还没有登录！请先登录！");
		
		return "login";
	}

}
