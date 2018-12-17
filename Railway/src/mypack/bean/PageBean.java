package mypack.bean;
import java.util.List;


public class PageBean<T> {

	private int currentPage = 1; //当前页, 默认显示第一页
	private int pageCount = 10;  //每页显示的行数
	private int totalCount =0;   //总记录数
	private int totalPage =0;    //总页数 = 总记录数 / 每页显示的行数  (+ 1)
	private List<T> pageData = null; //
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public List<T> getPageData() {
		return pageData;
	}
	
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
}
