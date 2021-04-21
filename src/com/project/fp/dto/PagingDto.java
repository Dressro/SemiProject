package com.project.fp.dto;

public class PagingDto {
	
	// 한 페이지에 출력할 게시글 수
	public static final int DISPLAY_BOARD = 10;
	// 한 블록에 출력할 페이지 수
	public static final int DISPLAY_PAGE = 5;
	
	private int nowPage;		// 현재 페이지
	private int totalBoard;		// 총 게시글 수
	
	private int blockBegin;		// 현재 블록의 시작 페이지 번호
	private int blockEnd;		// 현재 블록의 마지막 페이지 번호
	
	boolean prev;				// [이전] 버튼
	boolean next;				// [다음] 버튼
	
	private void paging() {
		// 현재 블록의 마지막 페이지 번호 구하기
		blockEnd = ((int)Math.ceil(nowPage/(double)DISPLAY_PAGE))*DISPLAY_PAGE;
		// 현재 블록의 시작 페이지 번호 구하기
		blockBegin = blockEnd - (DISPLAY_PAGE - 1);
		// 총 페이지 수 구하기
		int totalPage = (int)Math.ceil(totalBoard / (double)DISPLAY_BOARD);
		// [이전] 버튼 (첫번째 블록에서는 이전 버튼 비활성화)
		prev = (blockBegin == 1)? false:true;
		// [다음] 버튼 (마지막 블록에서는 다음 버튼 비활성화)
		if (totalPage < blockEnd) {
			blockEnd = totalPage;
			next = false;
		} else {
			next = true;
		}
	}
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalBoard() {
		return totalBoard;
	}
	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
		paging();
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public static int getDisplayBoard() {
		return DISPLAY_BOARD;
	}
	public static int getDisplayPage() {
		return DISPLAY_PAGE;
	}
	

}
