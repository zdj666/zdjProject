package com.hzyc.registerSystem.po;

public class Permission {
    private Integer id;

    private String menuBar;

    private String resourcePath;

    private Integer menuLevel;

    private Integer parentMenu;

    private byte[] picturePath;
    
    private String lineId;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMenuBar() {
        return menuBar;
    }

    public void setMenuBar(String menuBar) {
        this.menuBar = menuBar == null ? null : menuBar.trim();
    }

    public String getResourcePath() {
        return resourcePath;
    }

    public void setResourcePath(String resourcePath) {
        this.resourcePath = resourcePath == null ? null : resourcePath.trim();
    }

    public Integer getMenuLevel() {
        return menuLevel;
    }

    public void setMenuLevel(Integer menuLevel) {
        this.menuLevel = menuLevel;
    }

    public Integer getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(Integer parentMenu) {
        this.parentMenu = parentMenu;
    }

    public byte[] getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(byte[] picturePath) {
        this.picturePath = picturePath;
    }

	public void setLineId(String lineId) {
		this.lineId = lineId;
	}

	public String getLineId() {
		return lineId;
	}
}