package cn.edu.ldu.dao;

import cn.edu.ldu.bean.Article;

import java.util.List;

public interface ArticleDao {
    public Article findbyId(int id);
    public int add(Article article);
    public List<Article> sort(int sortId);
    public List<Article> fuzzySearch(String keyword);
}
