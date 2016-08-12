package action;

import goods.Goods;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.GoodsDAO;

@SuppressWarnings("serial")
public class InsertGoodsAction extends ActionSupport {

	private File upload;

	private String uploadContentType;

	private String uploadFileName;

	private String savePath;

	private Goods goods;

	private List<Goods> list;

	private GoodsDAO dao;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
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

	public InsertGoodsAction() {
		this.dao = new GoodsDAO();
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String newName = UUID.randomUUID()
				+ uploadFileName.substring(uploadFileName.lastIndexOf("."));

		FileOutputStream fos = new FileOutputStream(ServletActionContext
				.getServletContext().getRealPath(this.getSavePath())
				+ "\\"
				+ newName);
		FileInputStream fis = new FileInputStream(getUpload());

		byte[] buffer = new byte[1024];

		int len = 0;

		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}

		setUploadFileName(newName);

		fos.close();
		fis.close();

		String path = savePath.substring(1);

		goods.setSavePath(path + "/" + uploadFileName);
		
		String userid = (String)ActionContext.getContext().getSession().get("userid");

		boolean flag = dao.doCreate(goods, userid);

		String msg = dao.getMsg();

		ActionContext.getContext().getSession().put("insertmsg", msg);

		if (flag == true) {
			return SUCCESS;
		}
		return ERROR;
	}
}
