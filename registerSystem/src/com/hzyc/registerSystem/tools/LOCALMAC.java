package com.hzyc.registerSystem.tools;
	import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
	import java.net.NetworkInterface;
	import java.net.SocketException;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
	/*
	 * 物理地址是48位，别和ipv6搞错了
	 */
	public class LOCALMAC {
		/**
		 * @param args
		 * @throws UnknownHostException 
		 * @throws SocketException 
		 */
		 static String  hexByte(byte b)
		    {
		        String s="000000"+Integer.toHexString(b);
		        return s.substring(s.length()-2);
		    }
		 
 		public static void main(String[] args) throws UnknownHostException, SocketException {
			// TODO Auto-generated method stub
			System.out.println("192.168.1.187对应网卡的MAC是:");
			NetworkInterface ne=NetworkInterface.getByInetAddress(InetAddress.getByName("192.168.1.107"));
			byte[]mac=ne.getHardwareAddress();
			String mac_s=hexByte(mac[0])+":"+
			hexByte(mac[1])+":"+ 
			hexByte(mac[2])+":"+
			hexByte(mac[3])+":"+ 
			hexByte(mac[4])+":"+
			hexByte(mac[5])
			;
			System.out.println(mac_s);   
		
			InetAddress ia = InetAddress.getLocalHost();
			System.out.println(ia);
			getLocalMac(ia);

	
		}
		public static String getLocalMac(InetAddress ia) throws SocketException {
			// TODO Auto-generated method stub
			//获取网卡，获取地址
			byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
			System.out.println("mac数组长度："+mac.length);
			StringBuffer sb = new StringBuffer("");
			for(int i=0; i<mac.length; i++) {
				if(i!=0) {
					sb.append("-");
				}
				//字节转换为整数
				int temp = mac[i]&0xff;
				String str = Integer.toHexString(temp);
				System.out.println("每8位:"+str);
				if(str.length()==1) {
					sb.append("0"+str);
				}else {
					sb.append(str);
				}
			}
			System.out.println("本机MAC地址:"+sb.toString().toUpperCase());
			return sb.toString().toUpperCase();
		}
		
		public String getClientIp(HttpServletRequest request) {
	        String ip = request.getHeader("x-forwarded-for");
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            ip = request.getHeader("Proxy-Client-IP");

	        }

	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

	            ip = request.getHeader("WL-Proxy-Client-IP");

	        }

	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

	            ip = request.getRemoteAddr();

	        }
	        if(ip.trim().contains(",")){
	            String [] ips=ip.split(",");
	            ip=ips[0];
	        }
	        return ip;
	    }
		public String getMac(String ip) throws IOException{
			Process p = Runtime.getRuntime().exec("cmd /c C:\\Windows\\sysnative\\arp -a "+ip);
			BufferedReader read = new BufferedReader(new InputStreamReader(p.getInputStream()));
	        StringBuffer str = new StringBuffer(""); 
	        String temp = null;
	       while ((temp = read.readLine()) != null) { 
	          str.append(temp);
	       } 
	       int last = str.lastIndexOf("-");
	       String mac = str.substring(last-14,last+3);
	       return mac;
		}
	}