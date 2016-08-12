package action;

import goods.Goods;

import java.util.List;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.BuyCarDAO;

@SuppressWarnings("serial")
public class BuyCarAction extends ActionSupport {

	private Goods goods;

	private List<Goods> list;

	private BuyCarDAO dao;

	private double sum;


	public BuyCarAction() {
		this.dao = new BuyCarDAO();
	}
	
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

	
	public double getSum() {
		return sum;
	}

	public void setSum(double sum) {
		this.sum = sum;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String userid = (String)ActionContext.getContext().getSession().get("userid");
		
		list = dao.findAll(userid);
		
		sum = dao.doPrice(userid, list); //购买商品的总和
		
		String priceSum = "您购物车中所有商品的价格为" + sum;
		
		ActionContext.getContext().getSession().put("buycarpricesum", priceSum);
		
		return SUCCESS;
	}
}
