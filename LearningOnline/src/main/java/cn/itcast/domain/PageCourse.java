package cn.itcast.domain;

import java.io.Serializable;
import java.util.List;

public class PageCourse implements Serializable {

    private int counts;//总记录数
    private int totalPage;//总页数
    private int rows;//每页多少行
    private int currentPage;//当前第几页
    private List<Course> list;

    public PageCourse(){}

    public PageCourse(int counts, int totalPage, int rows, int currentPage, List<Course> list) {
        this.counts = counts;
        this.totalPage = totalPage;
        this.rows = rows;
        this.currentPage = currentPage;
        this.list = list;
    }

    public int getCounts() {
        return counts;
    }

    public void setCounts(int counts) {
        this.counts = counts;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<Course> getList() {
        return list;
    }

    public void setList(List<Course> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageCourse{" +
                "counts=" + counts +
                ", totalPage=" + totalPage +
                ", rows=" + rows +
                ", currentPage=" + currentPage +
                ", list=" + list +
                '}';
    }
}
