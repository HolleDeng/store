package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import comment.Comment;

import dbc.DataBaseConnection;

public class CommentDAO {

	private Connection conn = null;
	private DataBaseConnection dbc = null;
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public CommentDAO() {
		try {
			this.dbc = new DataBaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.conn = dbc.getConnection();
	}

	/**
	 * 插入一条用户的评价
	 * @param userid  用户的id
	 * @param number  评价的商品的id
	 * @param evaluate 评价的信息
	 * @return
	 */
	public boolean doInsert(String userid, String number, String evaluate) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "insert into comment(userid, number, evaluate) values(?,?,?)";
		if (this.findEvaluate(userid, number) == null) {
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, number);
				pstmt.setString(3, evaluate);
				if (pstmt.executeUpdate() > 0) {
					flag = true;
					this.setMsg("评论成功！");
				} else {
					this.setMsg("评论失败！");
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
			this.setMsg("不好意思！您已经评论过了！您只能评论一次！");
		}
		return flag;
	}

	public String findEvaluate(String userid, String number) {
		String evaluate = null;
		PreparedStatement pstmt = null;
		String sql = "select evaluate from comment where userid=? and number=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				evaluate = rs.getString(1);
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
		return evaluate;
	}
	
	/**
	 * 通过商品的id 查找到全部的评论信息
	 * @param number
	 * @return
	 */
	public List<Comment> findAll(String number) {
		
		List<Comment> all = new ArrayList<Comment>();
		PreparedStatement pstmt = null;
		String sql = "select * from comment where number=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs = pstmt.executeQuery();
			Comment comment = null;
			while (rs.next()) {
				comment = new Comment();
				comment.setUserid(rs.getString("userid"));
				comment.setNumber(rs.getString("number"));
				comment.setEvaluate(rs.getString("evaluate"));
				all.add(comment);
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
