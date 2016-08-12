package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import comment.Comment;

import goods.Goods;
import dbc.DataBaseConnection;
import dao.CommentDAO;

public class GoodsDAO {

	private Connection conn = null;
	private DataBaseConnection dbc = null;
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public GoodsDAO() {
		try {
			this.dbc = new DataBaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.conn = dbc.getConnection();
	}

	public boolean doCreate(Goods goods, String userid) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "insert into goods values(?,?,?,?,?,?,?,?,?)";
		if (this.findByNumber(goods.getNumber()) == null) {
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, goods.getNumber());
				pstmt.setString(2, goods.getName());
				pstmt.setDouble(3, goods.getPrice());
				pstmt.setInt(4, goods.getAmount());
				pstmt.setDate(5, new java.sql.Date(goods.getPublishDate()
						.getTime()));
				pstmt.setString(6, goods.getSavePath());
				pstmt.setString(7, goods.getIntroduction());
				pstmt.setInt(8, goods.getSellAmount());
				pstmt.setString(9, userid);
				if (pstmt.executeUpdate() > 0) {
					flag = true;
					this.setMsg("商品" + goods.getName() + "添加成功！");
				} else {
					this.setMsg("商品" + goods.getName() + "添加失败！");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		} else {
			this.setMsg("商品" + goods.getName() + "添加失败！原因是该商品编号已存在！请重新添加！");
		}
		return flag;
	}

	public boolean doUpdate(Goods goods, String userid) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "update goods set name=?,price=?,amount=?,publishDate=?,savePath=?,introduction=? where number=? and userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(7, goods.getNumber());
			pstmt.setString(8, userid);
			pstmt.setString(1, goods.getName());
			pstmt.setDouble(2, goods.getPrice());
			pstmt.setInt(3, goods.getAmount());
			pstmt.setDate(4,
					new java.sql.Date(goods.getPublishDate().getTime()));
			pstmt.setString(5, goods.getSavePath());
			pstmt.setString(6, goods.getIntroduction());
			if (pstmt.executeUpdate() > 0) {
				flag = true;
				this.setMsg("商品修改成功！");
			} else {
				this.setMsg("商品修改失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return flag;
	}

	public boolean doDelete(String number, String userid) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "delete from goods where number=? and userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			pstmt.setString(2, userid);
			if (pstmt.executeUpdate() > 0) {
				flag = true;
				this.setMsg("商品删除成功！");
			} else {
				this.setMsg("商品删除失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return flag;

	}

	public List<Goods> findAll(String userid) {
		List<Goods> all = new ArrayList<Goods>();
		PreparedStatement pstmt = null;
		String sql = "select * from goods where userid=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			Goods goods = null;
			while (rs.next()) {
				goods = new Goods();
				goods.setNumber(rs.getString("number"));
				goods.setName(rs.getString("name"));
				goods.setPrice(rs.getFloat("price"));
				goods.setAmount(rs.getInt("amount"));
				goods.setPublishDate(rs.getDate("publishDate"));
				goods.setSavePath(rs.getString("savePath"));
				goods.setIntroduction(rs.getString("introduction"));
				goods.setSellAmount(rs.getInt("sellAmount"));
				all.add(goods);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return all;
	}

	/**
	 * 查找全部的货物
	 * @return
	 */
	public List<Goods> findAll() {
		List<Goods> all = new ArrayList<Goods>();
		PreparedStatement pstmt = null;
		String sql = "select * from goods";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Goods goods = null;
			while (rs.next()) {
				goods = new Goods();
				goods.setNumber(rs.getString("number"));
				goods.setName(rs.getString("name"));
				goods.setPrice(rs.getFloat("price"));
				goods.setAmount(rs.getInt("amount"));
				goods.setPublishDate(rs.getDate("publishDate"));
				goods.setSavePath(rs.getString("savePath"));
				goods.setIntroduction(rs.getString("introduction"));
				goods.setSellAmount(rs.getInt("sellAmount"));
				goods.setUserid(rs.getString("userid"));
				all.add(goods);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return all;
	}

	/**
	 * 通过商品的id 查找到全部的商品信息
	 * @param number
	 * @return
	 */
	public Goods findByNumber(String number) {
		Goods goods = null;
		PreparedStatement pstmt = null;
		String sql = "select * from goods where number=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				goods = new Goods();
				goods.setNumber(rs.getString("number"));
				goods.setName(rs.getString("name"));
				goods.setPrice(rs.getFloat("price"));
				goods.setAmount(rs.getInt("amount"));
				goods.setPublishDate(rs.getDate("publishDate"));
				goods.setSavePath(rs.getString("savepath"));
				goods.setIntroduction(rs.getString("introduction"));
				goods.setSellAmount(rs.getInt("sellAmount"));
				goods.setUserid(rs.getString("userid"));
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return goods;
	}

	public List<Goods> findByName(String name, String userid) {
		List<Goods> all = new ArrayList<Goods>();
		PreparedStatement pstmt = null;
		String sql = "select * from goods where name like ? and userid=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery();
			Goods goods = null;
			while (rs.next()) {
				goods = new Goods();
				goods.setNumber(rs.getString("number"));
				goods.setName(rs.getString("name"));
				goods.setPrice(rs.getFloat("price"));
				goods.setAmount(rs.getInt("amount"));
				goods.setPublishDate(rs.getDate("publishDate"));
				goods.setSavePath(rs.getString("savePath"));
				goods.setIntroduction(rs.getString("introduction"));
				goods.setSellAmount(rs.getInt("sellAmount"));
				all.add(goods);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return all;
	}

	public List<Goods> findByUseridName(String useridName) {
		List<Goods> all = new ArrayList<Goods>();
		PreparedStatement pstmt = null;
		String sql = "select * from goods where name like ? or userid =?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + useridName + "%");
			pstmt.setString(2, useridName);
			rs = pstmt.executeQuery();
			Goods goods = null;
			while (rs.next()) {
				goods = new Goods();
				goods.setNumber(rs.getString("number"));
				goods.setName(rs.getString("name"));
				goods.setPrice(rs.getFloat("price"));
				goods.setAmount(rs.getInt("amount"));
				goods.setPublishDate(rs.getDate("publishDate"));
				goods.setSavePath(rs.getString("savePath"));
				goods.setIntroduction(rs.getString("introduction"));
				goods.setSellAmount(rs.getInt("sellAmount"));
				goods.setUserid(rs.getString("userid"));
				all.add(goods);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return all;
	}

	public int doCount(String userid) {
		int sum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(number) from goods where userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return sum;
	}

	/**
	 * 查找商品的个数
	 * @return
	 */
	public int doCount() {
		int sum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(number) from goods";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return sum;
	}

	public int doAmount(String userid) {
		int sum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select sum(amount) from goods where userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return sum;
	}

	/**
	 * 计算商品库存数量总和
	 * @return
	 */
	public int doAmount() {
		int sum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select sum(amount) from goods";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return sum;
	}

	/**
	 * 分页显示
	 * @param currentPage
	 * @param pageSize
	 * @param userid
	 * @return
	 */
	public List<Goods> findPageAll(int currentPage, int pageSize, String userid) {
		List<Goods> goodsList = new ArrayList<Goods>();
		goodsList = this.findAll(userid);
		int listLength = goodsList.size();

		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = startIndex + pageSize;

		if (endIndex >= listLength)
			endIndex = listLength;
		goodsList = goodsList.subList(startIndex, endIndex);
		return goodsList;
	}

	// 分页显示
	public List<Goods> findPageAll(int currentPage, int pageSize) {
		List<Goods> goodsList = new ArrayList<Goods>();
		goodsList = this.findAll();
		int listLength = goodsList.size();

		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = startIndex + pageSize;

		if (endIndex >= listLength)
			endIndex = listLength;
		goodsList = goodsList.subList(startIndex, endIndex);
		return goodsList;
	}
	
	/**
	 * 通过用户的id进行查找数量
	 * select number from goods where userid=?
	 * @param userid
	 * @return
	 */
	public List<Comment> findByUserid(String userid) {
		List<Comment> all = new ArrayList<Comment>();
		PreparedStatement pstmt = null;
		String sql = "select number from goods where userid=?";
		ResultSet rs = null;
		CommentDAO dao = new CommentDAO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			Goods goods = null;
			while (rs.next()) {
				goods = new Goods();
				goods.setNumber(rs.getString("number"));
				all.addAll( dao.findAll(goods.getNumber()) );
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return all;
	}

}
