package com.hs.istudy;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
//xml설정을 이용하는 경우
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DataSourceTest {
	@Inject
	private DataSource dataSource;
    
	@Test 
	public void testConnection() throws Exception{ 
		try(Connection conn = dataSource.getConnection()){ 
			System.out.println(conn); 
		}catch(Exception e){ e.printStackTrace(); } 
	} 

}
