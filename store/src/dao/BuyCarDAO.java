package dao;

import goods.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import buycar.BuyCar;
import dbc.DataBaseConnection;

public class BuyCarDAO {

	private Connection conn = null;
	private DataBaseConnection dbc = null;
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public BuyCarDAO() {
		try {
			this.dbc = new DataBaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.conn = dbc.getConnection();
	}

	public int doBuyCarCount(String userid, String number) {
		int count = 0;
		BuyCar buycar = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count from buycar where userid=? and number=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				buycar = new BuyCar();
				buycar.setCount(rs.getInt(1));
				count = buycar.getCount();
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
		return count;
	}

	public int doGoodsAmount(String number) {
		int count = 0;
		Goods goods = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select amount from goods where number=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				goods = new Goods();
				goods.setAmount(rs.getInt(1));
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
		count = goods.getAmount();
		return count;
	}

	public int doGoodsSellAmount(String number) {
		int count = 0;
		Goods goods = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select sellAmount from goods where number=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				goods = new Goods();
				goods.setSellAmount(rs.getInt(1));
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
		count = goods.getSellAmount();
		return count;
	}

	public boolean doGoodsUpdate(String number, int amount, int sellAmount) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "update goods set amount=?,sellAmount=? where number=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(3, number);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, sellAmount);
			if (pstmt.executeUpdate() > 0) {
				flag = true;
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

	public boolean doBuyCarUpdate(String userid, String number, int count) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "update buycar set count=? where userid=? and number=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, userid);
			pstmt.setString(3, number);
			pstmt.setInt(1, count);
			if (pstmt.executeUpdate() > 0) {
				flag = true;
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

	public boolean doInsert(String userid, String number) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		int amount = this.doGoodsAmount(number);
		int count = 0;
		if (amount <= 0) {
			flag = false;
			this.setMsg("添加失败！因为该商品库存量不足！");
			return flag;
		} else {
			count = this.doBuyCarCount(userid, number);
			if (count != 0) {
				count = count + 1;
				flag = this.doBuyCarUpdate(userid, number, count);
				if (flag == true) {
					amount = this.doGoodsAmount(number) - 1;
					count = this.doGoodsSellAmount(number) + 1;
					flag = this.doGoodsUpdate(number, amount, count);
					if (flag == true) {
						this.setMsg("添加成功！");
					}
				}
			} else {
				String sql = "insert into buycar(userid, number, count) values(?,?,?)";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, number);
					pstmt.setInt(3, count);
					if (pstmt.executeUpdate() > 0) {
						count = count + 1;
						flag = this.doBuyCarUpdate(userid, number, count);
						if (flag == true) {
							amount = this.doGoodsAmount(number) - 1;
							count = this.doGoodsSellAmount(number) + 1;
							flag = this.doGoodsUpdate(number, amount, count);
							if (flag == true) {
								this.setMsg("添加成功！");
							}
						}
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
			}
		}
		return flag;
	}

	public boolean doDelete(String userid, String number) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		int count = this.doBuyCarCount(userid, number);
		int amount = 0;
		String sql = "delete from buycar where userid=? and number=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, number);
			if (pstmt.executeUpdate() > 0) {
				amount = this.doGoodsAmount(number) + count;
				count = this.doGoodsSellAmount(number) - count;
				flag = this.doGoodsUpdate(number, amount, count);
				if (flag == true) {
					this.setMsg("移出成功！");
				}
			} else {
				this.setMsg("移出失败！");
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
		Goods goods = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select number from buycar where userid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				goods = new Goods();
				goods.setNumber(rs.getString(1));
				all.add(this.findByNumber(userid, goods.getNumber()));
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

	public Goods findByNumber(String userid, String number) {
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
				goods.setBuyAmount(this.doBuyCarCount(userid, number));
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

	/**
	 * 计算list<Goods>中的全部的价格，即：购买商品的总和
	 * @param userid
	 * @param all
	 * @return
	 */
	public double doPrice(String userid, List<Goods> all) {
		Goods goods = null;
		double sum = 0;
		for (Iterator<Goods> iter = all.iterator(); iter.hasNext();) {
			goods = iter.next();
			int count = this.doBuyCarCount(userid, goods.getNumber());
			sum = sum + goods.getPrice() * count;
		}
		return sum;
	}
	
	// 分页显示
	public List<Goods> findPageAll(String userid, int currentPage, int pageSize) {
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
}
