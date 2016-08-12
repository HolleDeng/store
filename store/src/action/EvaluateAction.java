package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.CommentDAO;

@SuppressWarnings("serial")
public class EvaluateAction extends ActionSupport {

	private String evaluate;

	CommentDAO dao;

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	public EvaluateAction() {
		this.dao = new CommentDAO();
	}

	@Override
	public String execute() throws Exception {
		/*
		 * ����һ���û�������
		 *  param userid �û���id
		 *  param number ���۵���Ʒ��id
		 *  param evaluate ���۵���Ϣ
		 */
		String userid = (String) ActionContext.getContext().getSession()
				.get("userid");

		String number = (String) ActionContext.getContext().getSession()
				.get("evaluatenumber");
		
		boolean flag = dao.doInsert(userid, number, evaluate);

		String msg = dao.getMsg();

		ActionContext.getContext().getSession().put("evaluatemsg", msg);

		ActionContext.getContext().getSession().put("findmsg", number);

		if (flag == true) {
			return SUCCESS;
		}
		return ERROR;
	}
}
