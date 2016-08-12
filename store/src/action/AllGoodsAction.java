package action;

import goods.Goods;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.GoodsDAO;

@SuppressWarnings("serial")
public class AllGoodsAction extends ActionSupport {

	private Goods goods;

	private List<Goods> list;

	private GoodsDAO dao;

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}

	public AllGoodsAction() {
		this.dao = new GoodsDAO();
	}

	
	@Override
	public String execute() throws Exception {
		/*
		 * 取出商品的全部信息，
		 * 取出商品的总数，
		 * 商品库存总数
		 */

			list = dao.findAll();
			
			int count = dao.doCount();
			
			int amount = dao.doAmount();
			
			ActionContext.getContext().getSession().put("count", count);
			ActionContext.getContext().getSession().put("amount", amount);
			
		return SUCCESS;
	}
}
