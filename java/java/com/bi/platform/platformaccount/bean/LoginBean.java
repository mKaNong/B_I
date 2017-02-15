package com.bi.platform.platformaccount.bean;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component
public class LoginBean {
	@NotEmpty(message = "{platform.userName.empty.error}")
	private String userName;
	@NotEmpty(message = "{platform.password.empty.error}")
	private String password;

	//@NotEmpty(message = "{platform.code.empty.error}")
	private String code;
	
    //自动登陆
	private String remMe;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getRemMe() {
		return remMe;
	}

	public void setRemMe(String remMe) {
		this.remMe = remMe;
	}

}
