package action;

import java.util.List;

import goods.Goods;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.CommentDAO;
import dao.GoodsDAO;
import comment.Comment;

@SuppressWarnings("serial")
public class DeleteGoodsAction extends ActionSupport {

	private Goods goods;

	private GoodsDAO dao;
	
	private String number;
	
	private List<Comment> list;
	
	private CommentDAO cdao;

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public DeleteGoodsAction() {
		this.dao = new GoodsDAO();
		this.cdao = new CommentDAO();
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public List<Comment> getList() {
		return list;
	}

	public void setList(List<Comment> list) {
		this.list = list;
	}

	/**
	 * 通过商品的id 查找到商品的信息
	 * @return
	 */
	public String getGoodsNumber() {

		goods = dao.findByNumber(number);
		
		ActionContext.getContext().getSession().put("evaluatenumber", number);
		
		list = cdao.findAll(number);
		
		return SUCCESS;
	}
	
	/**
	 * 通过 insertbuycarnumber 进行查找购物车的商品信息
	 * @return
	 */
	public String getGoodsNumber2() {

		goods = dao.findByNumber(number);

		String s = (String) ActionContext.getContext().getSession().get("insertbuycarnumber");
		
		if(s != null){
			
			goods = dao.findByNumber(s);
			list = cdao.findAll(s);
		}
		
		return SUCCESS;
	}

	/**
	 * 
	 * @return
	 */
	public String getGoodsNumber3() {

		goods = dao.findByNumber(number);

		String s = (String) ActionContext.getContext().getSession().get("findmsg");
		
		if(s != null){
			
			goods = dao.findByNumber(s);
			list = cdao.findAll(s);
		}
		
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		String userid = (String)ActionContext.getContext().getSession().get("userid");
		
		boolean flag = dao.doDelete(number, userid);

		String msg = dao.getMsg();

		ActionContext.getContext().getSession().put("deletemsg", msg);

		if (flag == true) {
			return SUCCESS;
		}
		return ERROR;
	}
}
