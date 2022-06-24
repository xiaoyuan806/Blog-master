package cn.edu.ldu.bean;

public class sort {
    private  int sortId;
    private  String sortname;
    private String sorScription;

    public sort(int sortId, String sortname, String sorScription) {

        this.sortId = sortId;
        this.sortname = sortname;
        this.sorScription = sorScription;
    }

    public int getSortId() {
        return sortId;
    }

    public void setSortId(int sortId) {
        this.sortId = sortId;
    }

    public String getSortname() {
        return sortname;
    }

    public void setSortname(String sortname) {
        this.sortname = sortname;
    }

    public String getSorScription() {
        return sorScription;
    }

    public void setSorScription(String sorScription) {
        this.sorScription = sorScription;
    }
}
