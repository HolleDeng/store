package action;

import goods.Goods;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import dao.GoodsDAO;

@SuppressWarnings("serial")
public class PageAllGoodsAction extends ActionSupport {

	private List<Goods> list;

	private GoodsDAO dao;

	private int p = 1;

	private int lastpage;

	private int pageSize;

	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}

	public PageAllGoodsAction() {
		this.dao = new GoodsDAO();
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getLastpage() {
		return lastpage;
	}

	public void setLastpage(int lastpage) {
		this.lastpage = lastpage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub

		this.list = dao.findAll();
		int listLength = this.list.size();
		if (listLength % pageSize == 0) {
			lastpage = listLength / pageSize;
		} else {
			lastpage = listLength / pageSize + 1;
		}
		if (this.getP() < 1)
			this.p = 1;
		if (this.getP() > lastpage)
			this.p = lastpage;
		list = dao.findPageAll(this.p, pageSize);
		return SUCCESS;
	}
}
