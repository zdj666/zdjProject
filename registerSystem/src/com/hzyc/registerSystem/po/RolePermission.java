package com.hzyc.registerSystem.po;

public class RolePermission {
    private Integer id;

    private Integer roleId;

    private Integer permissionId;
    
    private Integer nowId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

	public void setNowId(Integer nowId) {
		this.nowId = nowId;
	}

	public Integer getNowId() {
		return nowId;
	}
}