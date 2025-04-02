package com.musicCloud.cart.model.vo;

public class Cart {
	private int cartNo;
	private int memberNo;
	private String musicNoTotal;
	
	public Cart() {}

	public Cart(int cartNo, int memberNo, String musicNoTotal) {
		super();
		this.cartNo = cartNo;
		this.memberNo = memberNo;
		this.musicNoTotal = musicNoTotal;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMusicNoTotal() {
		return musicNoTotal;
	}

	public void setMusicNoTotal(String musicNoTotal) {
		this.musicNoTotal = musicNoTotal;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", memberNo=" + memberNo + ", musicNoTotal=" + musicNoTotal + "]";
	}
}
