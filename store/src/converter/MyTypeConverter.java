package converter;

import java.util.Map;

import tel.Tel;

import org.apache.struts2.util.StrutsTypeConverter;

public class MyTypeConverter extends StrutsTypeConverter {

	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Tel t=new Tel();
		String[] str=arg1[0].split("-");
		t.setSectionNo(str[0]);
		t.setTelNo(str[1]);
		return t;
	}

	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		Tel t=(Tel)arg1;
		return "["+t.getSectionNo()+"-"+t.getTelNo()+"]";
	}

}