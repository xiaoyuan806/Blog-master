package cn.edu.ldu.dao;

import cn.edu.ldu.bean.comment;

import java.util.List;

public interface commentDao {
    public List<comment> findbyId(int id);
}
