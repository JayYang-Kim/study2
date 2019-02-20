package com.util;

public class MyUtil {
	/**
	 * @param numPerPage // �� ȭ�鿡 ǥ���� ������ ����
	 * @param dataCount  // ��ü ������ ��
	 * @return           // �� ������ ��
	 */
	public int pageCount(int numPerPage, int dataCount) {
		int result = 0;
		
		if(dataCount <= 0) { // �����Ͱ� ���� ���
			return result;
		}
		
		result = dataCount / numPerPage + (dataCount % numPerPage > 0 ? 1 : 0);
		
		return result;
	}
	
	/**
	 * title : ����¡ ó��(GET ���)
	 * @param current_page // ȭ�鿡 ǥ���� ������
	 * @param total_page   // ��ü ������ ��
	 * @param list_url     // ��ũ�� ������ URL
	 * @return             // ����¡ ó�� ���
	 */
	public String paging(int current_page, int total_page, String list_url) {
		StringBuffer sb = new StringBuffer();
		
		int numPerBlock = 10;
		int currentPageSetup;
		int n, page;
		
		// �����Ͱ� ���� ��� ����¡ ó��
		if(current_page < 1 || total_page < 1) {
			return "";
		}
		
		if(list_url.indexOf("?")!= -1) { // list_url�ȿ� ?�� �����ϸ�
			list_url += "&";
		} else {
			list_url += "?";
		}
		
		// currentPageSetup : ǥ���� ù ������ - 1
		// ǥ���� ������(current_page) : 1 ~ 10 / currentPageSetup : 0
		// ǥ���� ������(current_page) : 51 ~ 60 / currentPageSetup : 50
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		
		if(current_page % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		sb.append("<ul class='pagination'>");
		
		// [ó��], [����]
		n = current_page - numPerBlock;
		
		if(currentPageSetup > 0 && total_page > numPerBlock) {
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page=1'>����</a>");
			sb.append("</li>");
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page="+n+"'>��</a>");
			sb.append("</li>");
		}
		
		// ����¡ ó��
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
		
		// [����], [��]
		n = current_page + numPerBlock;
		if(n > total_page) {
			n = total_page;
		}
		
		// �ڿ� ���� �ִ°��
		if(total_page - currentPageSetup > numPerBlock) {
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page="+n+"'>��</a>");
			sb.append("</li>");
			sb.append("<li>");
			sb.append("<a href='"+list_url+"page="+total_page+"'>����</a>");
			sb.append("</li>");
		}
		
		sb.append("</ul>");
		
		return sb.toString();
	}
}
