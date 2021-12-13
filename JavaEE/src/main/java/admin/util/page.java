package admin.util;

import java.util.List;

/**
 * ①数据总行数
 * ②页面大小
 * 根据上述两条数据 计算总页数
 * ③总页数＝数据总行数/页面大小 + 数据总行数%页面大小=0？
 *
 * 一个page对象应该对应上述五条数据
 */
public class page {
    private int totalCount;
    private int pageSize;
    private int totalPage;

    //调用方法时 setPageSize比setTotalCount要setTotalCount要早 所以计算总页数应放在此处
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        if(totalCount%pageSize == 0){
            totalPage = (totalCount/pageSize)-1;
        }else {
            totalPage = (totalCount/pageSize);
        }
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalPage(){
        return totalPage;
    }

//    public static void main(String[] args) {
//        page page = new page();
//        page.setPageSize(5);
//        page.setTotalCount(9);
//        System.out.println(page.getTotalCount()/page.getPageSize());
//    }
}
