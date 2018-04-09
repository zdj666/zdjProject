package com.hzyc.registerSystem.tools;

import java.util.ArrayList;
import java.util.HashMap;



public  class Dict {
	
	private static ArrayList<HashMap<String,String>> dict = new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> sexs = new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> RoleName = new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> SchooleName = new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> QuestionName = new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> ClassName= new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> ClassTypeName= new  ArrayList<HashMap<String,String>>();
	
	private static ArrayList<HashMap<String,String>> ClassPlace= new  ArrayList<HashMap<String,String>>();
	
	
	public static ArrayList<HashMap<String, String>> getQuestionName() {
		return QuestionName;
	}
	public static void setQuestionName(
			ArrayList<HashMap<String, String>> questionName) {
		QuestionName = questionName;
	}
	public static ArrayList<HashMap<String, String>> getSex() {
		return sexs;
	}
	public static void setSex(ArrayList<HashMap<String, String>> getper) {
		Dict.sexs =getper;
	
	}

	

	private Dict(){
		
	}
	
	public static ArrayList<HashMap<String, String>> getDict() {
		return dict;
	}

	public static void setDict(ArrayList<HashMap<String, String>> dict) {
		Dict.dict = dict;
	}
		
	/**
	 * sex:�� Ů
	 * 
	 * */
	public static String[] getAllData(){
		
		 String getValue=sexs.get(0).get("sex");
		 String[] splits=getValue.split(",");
		 int size=splits.length-1;
		 String[]  sexValue=new  String[size];
		for(int j=1;j<splits.length;j++){
			sexValue[j-1]=splits[j];
			
		}
		return sexValue;
	}

	public static String[] getRoleData(){
		
		String getRoleName=RoleName.get(0).get("JueName");
		String[] RoleNameSpl=getRoleName.split(",");
		int size=RoleNameSpl.length-1;
		String[] addRoleValue=new String[size];
		for(int j=1;j<RoleNameSpl.length;j++){
			addRoleValue[j-1]=RoleNameSpl[j];
			
		}
		
		return addRoleValue;
	}
	
public static String[] getSchoolData(){
		
		String getSchooleName=SchooleName.get(0).get("SchooleName");
		String[] SchooleNameSpl=getSchooleName.split(",");
	
		int size=SchooleNameSpl.length-1;
		String[] addSchooleValue=new String[size];
		for(int j=1;j<SchooleNameSpl.length;j++){
			addSchooleValue[j-1]=SchooleNameSpl[j];
			
		}
		
		return addSchooleValue;
	}
	
public static String[] getQuestionData(){
	
	String getQuestionName=QuestionName.get(0).get("QuestionName");
	String[] QuestionNameSpl=getQuestionName.split(",");
	int size=QuestionNameSpl.length-1;
	String[] addQuestionValue=new String[size];
	for(int j=1;j<QuestionNameSpl.length;j++){
		addQuestionValue[j-1]=QuestionNameSpl[j];
		
	}
	
	return addQuestionValue;
}	

public static String[] getClassData(){
	
	String getClassName=ClassName.get(0).get("ClassName");
	String[] ClassNameSpl=getClassName.split(",");
	int size=ClassNameSpl.length-1;
	String[] addClassValue=new String[size];
	for(int j=1;j<ClassNameSpl.length;j++){
		addClassValue[j-1]=ClassNameSpl[j];
		
	}
	
	return addClassValue;
}	


public static String[] getClassTypeData(){
	
	String getClassTypeName=ClassTypeName.get(0).get("ClassTypeName");
	String[] ClassTypeNameSpl=getClassTypeName.split(",");
	int size=ClassTypeNameSpl.length-1;
	String[] addClassTypeValue=new String[size];
	for(int j=1;j<ClassTypeNameSpl.length;j++){
		addClassTypeValue[j-1]=ClassTypeNameSpl[j];
		
	}
	
	return addClassTypeValue;
}

public static String[] getClassPlaces(){
	
	String getClassPlace=ClassPlace.get(0).get("ClassPlace");
	String[] ClassPlaceSpl=getClassPlace.split(",");
	int size=ClassPlaceSpl.length-1;
	String[] addClassPlaceValue=new String[size];
	for(int j=1;j<ClassPlaceSpl.length;j++){
		addClassPlaceValue[j-1]=ClassPlaceSpl[j];
		
	}
	
	return addClassPlaceValue;
}




	
	public static void setClassPlace(ArrayList<HashMap<String, String>> classPlace) {
	ClassPlace = classPlace;
}
	public static ArrayList<HashMap<String,String>> getClassPlace() {
		return ClassPlace;
	}
	public static void setRoleName(ArrayList<HashMap<String,String>> roleName) {
		RoleName = roleName;
	}
	public static ArrayList<HashMap<String,String>> getRoleName() {
		return RoleName;
	}
	public static void setSchooleName(ArrayList<HashMap<String,String>> schooleName) {
		SchooleName = schooleName;
	}
	public static ArrayList<HashMap<String,String>> getSchooleName() {
		return SchooleName;
	}
	public static void setClassName(ArrayList<HashMap<String,String>> className) {
		ClassName = className;
	}
	public static ArrayList<HashMap<String,String>> getClassName() {
		return ClassName;
	}
	public static void setClassTypeName(ArrayList<HashMap<String,String>> classTypeName) {
		ClassTypeName = classTypeName;
	}
	public static ArrayList<HashMap<String,String>> getClassTypeName() {
		return ClassTypeName;
	}
	

	
	
	

}
