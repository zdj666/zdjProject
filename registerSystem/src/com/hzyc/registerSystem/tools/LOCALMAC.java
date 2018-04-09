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
	 * ������ַ��48λ�����ipv6�����
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
			System.out.println("192.168.1.187��Ӧ������MAC��:");
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
			//��ȡ��������ȡ��ַ
			byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
			System.out.println("mac���鳤�ȣ�"+mac.length);
			StringBuffer sb = new StringBuffer("");
			for(int i=0; i<mac.length; i++) {
				if(i!=0) {
					sb.append("-");
				}
				//�ֽ�ת��Ϊ����
				int temp = mac[i]&0xff;
				String str = Integer.toHexString(temp);
				System.out.println("ÿ8λ:"+str);
				if(str.length()==1) {
					sb.append("0"+str);
				}else {
					sb.append(str);
				}
			}
			System.out.println("����MAC��ַ:"+sb.toString().toUpperCase());
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