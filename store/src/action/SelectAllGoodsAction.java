package action;

import goods.Goods;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.GoodsDAO;

@SuppressWarnings("serial")
public class SelectAllGoodsAction extends ActionSupport {

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

	public SelectAllGoodsAction() {
		this.dao = new GoodsDAO();
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub

		list = dao.findByUseridName(select);

		int count = dao.doCount();

		int amount = dao.doAmount();

		ActionContext.getContext().getSession().put("count", count);
		ActionContext.getContext().getSession().put("amount", amount);
		return SUCCESS;
	}
}
