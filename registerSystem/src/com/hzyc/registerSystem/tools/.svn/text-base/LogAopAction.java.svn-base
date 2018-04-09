package com.hzyc.registerSystem.tools;


import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.hzyc.registerSystem.po.Log;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.impl.InitServiceImp;


/**
 * @author lvgang
 * 
 */
/**
 * 切面类
 */
@Aspect
public class LogAopAction {
	
	//注入初始化service
	private InitServiceImp initServiceImp;
	
	public void setInitServiceImp(InitServiceImp initserviceimp){
		this.initServiceImp = initserviceimp;
		
	}
	public InitServiceImp getInitServiceImp(){
		return this.initServiceImp;
		
	}
	
    //开始时间
    private long BEGIN_TIME ;

    //结束时间
    private long END_TIME;

    //运行日志
    private Log log = new Log();
    
    //切入点控制在controller层
	@Pointcut("execution(* com.hzyc.registerSystem.controller..*.*(..))")
    private void controllerAspect(){}

    /**
     * 方法执行前操作:记录开始执行时间
     */
    @Before("controllerAspect()")
    public void doBefore(){
        BEGIN_TIME = new Date().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        sdf.format(new Date(BEGIN_TIME));
        System.out.println("方法开始执行.."+ sdf.format(new Date(BEGIN_TIME)));
        
    }

    /**
     * 方法执行后操作：记录结束执行时间
     */
    @After("controllerAspect()")
    public void after(){
        END_TIME = new Date().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        
        System.out.println("方法结束执行.."+sdf.format(new Date(BEGIN_TIME)));
    }

    /**
     * 方法return结束后操作：记录日志
     */
    @AfterReturning("controllerAspect()")
    public void doAfter(){
    	System.out.println(END_TIME-BEGIN_TIME);
    	try {
    		//request.setCharacterEncoding("UTF-8");
        	//response.setCharacterEncoding("UTF-8");
        	
        	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        	
        	log.setActiontime(String.valueOf(END_TIME-BEGIN_TIME));
        	log.setGmtcreate(sdf.format(new Date(BEGIN_TIME)));
        	
        	System.out.println(log.getLoginip()+"日志信息2"+log.toString());
        	
        	LogAopAction laa = (LogAopAction)BeanUtil.getBean("logAop");
        	if(log.getState()==1){
        		System.out.println("执行成功记录信息");
        		
        		
    	    	laa.getInitServiceImp().insertLog(log);
            }else if(log.getState()==-1){
               System.out.println("执行失败记录信息");
    	    	laa.getInitServiceImp().insertLog(log);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }

    /**
     * 抛出异常操作
     */
    @AfterThrowing("controllerAspect()")
    public void doAfterThrow(){
        System.out.println("方法执行失败-----------------------------------");
    }

    /**
     * 方法执行
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around("controllerAspect()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable{
	  //日志实体对象
	    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	    //获取当前登陆用户信息
	    Users us =(Users)request.getSession().getAttribute("user");
	    System.out.println("用户信息"+us);
	    if(us != null){
	    	log.setLoginaccount(us.getName());
	    }else{
	    	 log.setLoginaccount("null");;
	    }
	
	    // 拦截的实体类，就是当前正在执行的controller
	    Object target = pjp.getTarget();
	    // 拦截的方法名称。当前正在执行的方法
	    String methodName = pjp.getSignature().getName();
	    // 拦截的方法参数
	    Object[] args = pjp.getArgs();
	    // 拦截的放参数类型
	    Signature sig = pjp.getSignature();
	    MethodSignature msig = null;
	    if (!(sig instanceof MethodSignature)) {
	        throw new IllegalArgumentException("该注解只能用于方法");
	    }
	    msig = (MethodSignature) sig;
	    Class[] parameterTypes = msig.getMethod().getParameterTypes();
	
	    Object object = null;
	
	    Method method = null;
	    try {
	        method = target.getClass().getMethod(methodName, parameterTypes);
	    } catch (NoSuchMethodException e1) {
	        // TODO Auto-generated catch block
	        e1.printStackTrace();
	    } catch (SecurityException e1) {
	        // TODO Auto-generated catch block
	        e1.printStackTrace();
	    }
	
	    if (null != method) {
	        // 判断是否包含自定义的注解，说明一下这里的SystemLog就是我自己自定义的注解
	        if (method.isAnnotationPresent(SystemLog.class)) {
	            SystemLog systemlog = method.getAnnotation(SystemLog.class);
	            log.setModule(systemlog.module());
	            log.setMethod(systemlog.methods());
	            log.setLoginip(getIp(request));
	            log.setActionurl(request.getRequestURI());
	
	            try {
	                object = pjp.proceed();
	                log.setDescription("执行成功");
	                log.setState((short) 1);
	            } catch (Throwable e) {
	                // TODO Auto-generated catch block
	                log.setDescription("执行失败");
	                log.setState((short)-1);
	            }
	        } else {//没有包含注解
	            object = pjp.proceed();
	            //log.setDescription("此操作不包含注解");
	            log.setState((short)0);
	        }
	    } else { //不需要拦截直接执行
	        object = pjp.proceed();
	        //log.setDescription("不需要拦截直接执行");
	        log.setState((short)0);
	    }
	    return object;
	}

	/**
	 * 获取ip地址
	 * @param request
	 * @return
	 */
	private String getIp(HttpServletRequest request){
	    if (request.getHeader("x-forwarded-for") == null) {
	        try {
				return InetAddress.getLocalHost().getHostAddress();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    return request.getHeader("x-forwarded-for");
	}
	    
    
}