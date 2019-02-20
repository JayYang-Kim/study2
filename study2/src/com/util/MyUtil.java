package com.util;

public class MyUtil {
	/**
	 * @param numPerPage // 한 화면에 표시할 데이터 개수
	 * @param dataCount  // 전체 데이터 수
	 * @return           // 총 페이지 수
	 */
	public int pageCount(int numPerPage, int dataCount) {
		int result = 0;
		
		if(dataCount <= 0) { // 데이터가 없을 경우
			return result;
		}
		
		result = dataCount / numPerPage + (dataCount % numPerPage > 0 ? 1 : 0);
		
		return result;
	}
	
	/**
	 * title : 페이징 처리(GET 방식)
	 * @param current_page // 화면에 표시할 페이지
	 * @param total_page   // 전체 페이지 수
	 * @param list_url     // 링크를 설정할 URL
	 * @return             // 페이징 처리 결과
	 */
	public String paging(int current_page, int total_page, String list_url) {
		StringBuffer sb = new StringBuffer();
		
		int numPerBlock = 10;
		int currentPageSetup;
		int n, page;
		
		// 데이터가 없을 경우 페이징 처리
		if(current_page < 1 || total_page < 1) {
			return "";
		}
		
		if(list_url.indexOf("?")!= -1) { // list_url안에 ?가 존재하면
			list_url += "&";
		} else {
			list_url += "?";
		}
		
		// currentPageSetup : 표시할 첫 페이지 - 1
		// 표시할 페이지(current_page) : 1 ~ 10 / currentPageSetup : 0
		// 표시할 페이지(current_page) : 51 ~ 60 / currentPageSetup : 50
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		
		if(current_page % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		sb.append("<ul class='pagination'>");
		
		// [처음], [이전]
		n = current_page - numPerBlock;
		
		if(currentPageSetup > 0 && total_page > numPerBlock) {
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page=1'>◀◀</a>");
			sb.append("</li>");
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page="+n+"'>◀</a>");
			sb.append("</li>");
		}
		
		// 페이징 처리
		page = currentPageSetup + 1;
		
		while(page <= total_page && page <= (currentPageSetup + numPerBlock)) {
			if(page == current_page) {
				sb.append("<li class='active'>");
				sb.append("<a>"+page+"</a>");
				sb.append("</li>");
			} else {
				sb.append("<li>");
				sb.append("<a href='"+list_url+"page="+page+"'>"+page+"</a>");
				sb.append("</li>");
			}
			
			page++;
		}
		
		// [다음], [끝]
		n = current_page + numPerBlock;
		if(n > total_page) {
			n = total_page;
		}
		
		// 뒤에 값이 있는경우
		if(total_page - currentPageSetup > numPerBlock) {
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page="+n+"'>▶</a>");
			sb.append("</li>");
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page="+total_page+"'>▶▶</a>");
			sb.append("</li>");
		}
		
		sb.append("</ul>");
		
		return sb.toString();
	}
}
