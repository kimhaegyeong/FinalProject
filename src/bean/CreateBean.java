package bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import admin.AdminDBBean;
import admin.AdminDao;
import bike.BikeDBBean;
import bike.BikeDao;
import delivery.DeliveryDBBean;
import delivery.DeliveryDao;
import orders.OrdersDBBean;
import orders.OrdersDao;
import qna.QnADBBean;
import qna.QnADao;
import stores.StoresDBBean;
import stores.StoresDao;

@Configuration
public class CreateBean {
	
	@Bean
	public DeliveryDao deliveryDao() {
		return new DeliveryDBBean();
	}
	
	@Bean
	public AdminDao adminDao(){
		return new AdminDBBean();
	} 
	
	@Bean
	public BikeDao bikeDao(){
		return new BikeDBBean();
	}
	
	@Bean
	public OrdersDao ordersDao(){
		return new OrdersDBBean();
	}
	
	
	@Bean
	public StoresDao storesDao(){
		return new StoresDBBean();
	}
	
	@Bean
	public QnADao qnaDao(){
		return new QnADBBean();
	}
	
	@Bean
	public ViewResolver viewResolver() throws ClassNotFoundException {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		Class <?> viewClass = Class.forName( "org.springframework.web.servlet.view.JstlView" );
		viewResolver.setViewClass( viewClass );		
		viewResolver.setSuffix( ".jsp" );
		return viewResolver;
	}	
}
