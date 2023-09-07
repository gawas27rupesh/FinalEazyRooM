package com.eazyroom.web.constants;

public class URLConstants {
	
	public static final String MAIN = "/";
	public static final String LOGIN_PAGE="/";
	public static final String HOME=MAIN+"home";	
	public static final String OWNER=MAIN+"owner";	
	public static final String OWNERADD=MAIN+"owneradd";
	public static final String OWNERDELETE=MAIN+"ownerdelete";	
	public static final String SEEALLOWNER=MAIN+"seeallowner";
	public static final String DONEOWNER=MAIN+"doneowner";
	public static final String REDIRECT="redirect:";
	public static final String LOGINSUCCESS = MAIN+"loginsuccess";
	public static final String REGISTER=MAIN+"register";
	public static final String REGISTERSUCCESS=MAIN+"registersuccess";
	public static final String SEEOWNER=MAIN+"seeowner";
	public static final String POSTDELETEOWN=MAIN+"postdeleteown";
	public static final String DELETEOWN=MAIN+"deleteown";
	public static final String DELETEOWNBYID=DELETEOWN+MAIN+"{eazyId}";
	public static final String UPDATEOWN=MAIN+"updateown";
	public static final String UPDATEOWNBYID=UPDATEOWN+MAIN+"{eid}";
	public static final String TENANT=MAIN+"tenant";	
	public static final String TENANT_DELETE=MAIN+"tenantdelete";	

	
	//PDF
	public static final String PDF_OWNER=MAIN+"pdfowner/{city}";	
	public static final String PDF_TENANT=MAIN+"pdftenant/{city}";	
	
	
}
