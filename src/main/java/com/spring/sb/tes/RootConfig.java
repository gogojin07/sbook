package com.spring.sb.tes;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages= {"com.spring.sb"})

public class RootConfig {
@Bean
public DataSource dataSource() {
	HikariConfig hc = new HikariConfig();
	hc.setDriverClassName("oracle.jdbc.driver.OracleDriver");
	hc.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:XE");
	hc.setUsername("sbook");
	hc.setPassword("1111");
	HikariDataSource ds = new HikariDataSource(hc);
	return ds;
}
}
