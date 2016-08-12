package action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import comment.Comment;
import dao.GoodsDAO;

@SuppressWarnings("serial")
public class ManagerAllEvaluateAction extends ActionSupport {

	private List<Comment> list;
	
	private GoodsDAO dao;

	public List<Comment> getList() {
		return list;
	}

	public void setList(List<Comment> list) {
		this.list = list;
	}
	
	public ManagerAllEvaluateAction(){
		this.dao = new GoodsDAO();
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String userid = (String)ActionContext.getContext().getSession().get("userid");
		
		list = dao.findByUserid(userid);
		
		return SUCCESS;
	}
}
