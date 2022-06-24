package cn.edu.ldu.dao;

import cn.edu.ldu.bean.Draft;

import java.util.List;

public interface draftDao {
    public int add(Draft draft);
    public List<Draft> findall();
    public Draft findById(int draftId);

}
