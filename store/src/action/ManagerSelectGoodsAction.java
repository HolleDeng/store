package action;

import goods.Goods;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.GoodsDAO;

@SuppressWarnings("serial")
public class ManagerSelectGoodsAction extends ActionSupport {

	private String select;

	private List<Goods> list;

	private GoodsDAO dao;

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}

	public ManagerSelectGoodsAction() {
		this.dao = new GoodsDAO();
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String userid = (String) ActionContext.getContext().getSession()
				.get("userid");

		list = dao.findByName(select, userid);

		int count = dao.doCount(userid);

		int amount = dao.doAmount(userid);

		ActionContext.getContext().getSession().put("count", count);
		ActionContext.getContext().getSession().put("amount", amount);

		return SUCCESS;
	}
}
