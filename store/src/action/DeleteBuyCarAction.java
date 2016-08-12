package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.BuyCarDAO;

@SuppressWarnings("serial")
public class DeleteBuyCarAction extends ActionSupport {

	private BuyCarDAO dao;

	private String number;

	public DeleteBuyCarAction() {
		this.dao = new BuyCarDAO();
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		String userid = (String) ActionContext.getContext().getSession()
				.get("userid");
		
		boolean flag = dao.doDelete(userid, number);

		String msg = dao.getMsg();

		ActionContext.getContext().getSession().put("deletebuycarmsg", msg);

		if (flag == true) {
			return SUCCESS;
		}

		return ERROR;
	}
}
