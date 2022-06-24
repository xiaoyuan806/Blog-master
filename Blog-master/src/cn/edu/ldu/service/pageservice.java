package cn.edu.ldu.service;

import cn.edu.ldu.daoImpl.pageDaoImpI;
import cn.edu.ldu.util.PageModel;

import java.sql.SQLException;
import java.util.List;

public class pageservice {
    public PageModel find(int num) throws SQLException {
  pageDaoImpI pmI=new pageDaoImpI();
  int pagesize=10;
  int totalrecord=pmI.getTotalRecords();
        PageModel pm = new PageModel(num,totalrecord,pagesize);
        List list=pmI.findAll(pm.getStartIndex(),pm.getPageSize());
        pm.setList(list);
        pm.setUrl("/FindAllServlet");
        return pm;
    }
}
