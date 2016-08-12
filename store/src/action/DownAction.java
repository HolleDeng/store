package action;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DownAction extends ActionSupport {

	private String inputPath;
	private String contentType;
	private String downFileName;

	public void setInputPath(String inputPath) throws Exception {
		this.inputPath = new String(inputPath.getBytes("iso-8859-1"), "UTF-8");
	}

	public String getInputPath() {
		return inputPath;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentType() {
		return this.contentType;
	}

	public void setDownFileName(String downFileName) throws Exception {
		this.downFileName = new String(downFileName.getBytes("iso-8859-1"),"UTF-8");
	}

	public String getDownFileName() throws Exception {
		this.downFileName = new String(downFileName.getBytes(), "ISO8859-1");
		
		return this.downFileName;
	}

	public InputStream getTargetFile() throws Exception {
		return ServletActionContext.getServletContext().getResourceAsStream(
				inputPath);
	}
}
