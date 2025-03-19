package com.musicCloud.member.model.vo;

import java.util.Date;

public class Member {
	
	private int memberNo;
	private int locationNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberAlias;
	private String email;
	private String gender;
	private int age;
	private Date enrollDate;
	private int reportCount;
	private String status;
	private String pfStatus;
	
	public Member() {}

	public Member(int memberNo, int locationNo, String memberId, String memberPwd, String memberName,
			String memberAlias, String email, String gender, int age, Date enrollDate, int reportCount, String status,
			String pfStatus) {
		super();
		this.memberNo = memberNo;
		this.locationNo = locationNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberAlias = memberAlias;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.enrollDate = enrollDate;
		this.reportCount = reportCount;
		this.status = status;
		this.pfStatus = pfStatus;
	}


	public Member(int memberNo, int locationNo, String memberId, String memberPwd, String memberName, String email,
			String gender, int age, Date enrollDate, int reportCount, String status) {
		super();
		this.memberNo = memberNo;
		this.locationNo = locationNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.enrollDate = enrollDate;
		this.reportCount = reportCount;
		this.status = status;
	}

	/**
	 * @param locationNo
	 * @param memberId
	 * @param memberPwd
	 * @param memberName
	 * @param memberAlias
	 * @param email
	 * @param gender
	 * @param age
	 * 설정 : 회원가입 정보를 담기 위한 생성자
	 */
	public Member(int locationNo, String memberId, String memberPwd, String memberName, String memberAlias,
			String email, String gender, int age) {
		super();
		this.locationNo = locationNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberAlias = memberAlias;
		this.email = email;
		this.gender = gender;
		this.age = age;
	}
	

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAlias() {
		return memberAlias;
	}

	public void setMemberAlias(String memberAlias) {
		this.memberAlias = memberAlias;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPfStatus() {
		return pfStatus;
	}

	public void setPfStatus(String pfStatus) {
		this.pfStatus = pfStatus;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", locationNo=" + locationNo + ", memberId=" + memberId + ", memberPwd="
				+ memberPwd + ", memberName=" + memberName + ", email=" + email + ", gender=" + gender + ", age=" + age
				+ ", enrollDate=" + enrollDate + ", reportCount=" + reportCount + ", status=" + status + ", pfStatus="
				+ pfStatus + "]";
	}
	
	}

	
