package com.musicCloud.member.model.vo;

public class NaverMember {

	private String uniqueId;
	private String nickName;
	private String name;
	private String email;
	private String age; //연령대
	private String gender; //M, F
	private String birthday; 
	private String birthyear;
	private String mobile;
	
	public NaverMember() {}

	public NaverMember(String uniqueId, String nickName, String name, String email, String age, String gender,
			String birthday, String birthyear, String mobile) {
		super();
		this.uniqueId = uniqueId;
		this.nickName = nickName;
		this.name = name;
		this.email = email;
		this.age = age;
		this.gender = gender;
		this.birthday = birthday;
		this.birthyear = birthyear;
		this.mobile = mobile;
	}


	public String getUniqueId() {
		return uniqueId;
	}


	public void setUniqueId(String uniqueId) {
		this.uniqueId = uniqueId;
	}


	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getBirthyear() {
		return birthyear;
	}

	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Override
	public String toString() {
		return "NaverMember [uniqueId=" + uniqueId + ", nickName=" + nickName + ", name=" + name + ", email=" + email
				+ ", age=" + age + ", gender=" + gender + ", birthday=" + birthday + ", birthyear=" + birthyear
				+ ", mobile=" + mobile + "]";
	}

}
