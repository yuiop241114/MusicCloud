package com.musicCloud.member.model.vo;

public class Location {
	private int locationNo;
	private String locationName;
	
	public Location() {}

	public Location(int locationNo, String locationName) {
		super();
		this.locationNo = locationNo;
		this.locationName = locationName;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	@Override
	public String toString() {
		return "Location [locationNo=" + locationNo + ", locationName=" + locationName + "]";
	}
	
}
