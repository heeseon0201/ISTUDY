package com.hs.istudy;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;


import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hs.istudy.mapper.UserMapper;

/**
 * @author
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MybatisTest {
 @Autowired UserMapper userMapper;

 @Test
 public void getUserName() {
  String id = "hs";
  String name = userMapper.getUserName(id);
  
  assertThat(name, is("희선"));
 }
 
 public static class MybatisDAO {
  private SqlSession sqlSession;
  
  public void setSqlSession(SqlSession sqlSession) {
   this.sqlSession = sqlSession;
  }
  
  public String getUserName(String id) {
	UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
   return userMapper.getUserName(id);
  }
  
 }
}