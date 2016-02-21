package me.jmll.tag;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.JspWriter;

public class FileTag extends SimpleTagSupport {
	private String fileName = "";
	private String attributeName = "";
	private String downloadController = "";
	private boolean openNewWindow = false;
	
	public void setFileName(String fileName){
		this.fileName = fileName;
	}
	
	public void setDownloadController(String downloadController){
		this.downloadController = downloadController;
	}
	
	public void setAttributeName(String attributeName){
		this.attributeName = attributeName;
	}
	
	public void setOpenNewWindow(boolean openNewWindow){
		this.openNewWindow = openNewWindow;
	}
	
	@Override
	public void doTag(){
		JspWriter out = this.getJspContext().getOut();
		try {
			StringBuffer sb = new StringBuffer();
			sb.append("<a href=\"").append(this.downloadController).append("?");
			sb.append(this.attributeName).append("=").append(this.fileName).append("\"");
			if (this.openNewWindow)
				sb.append("target = \"_new\"");
			sb.append(">");
			sb.append(fileName).append("</a>");
			out.println(sb.toString());
		} catch (Exception ex){
			ex.printStackTrace();
		}
	}
}
