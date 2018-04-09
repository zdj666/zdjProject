package com.hzyc.registerSystem.po;

public class Dictionary {
    private Integer id;

    private String type;

    private String code;

    private String name;
    
    private String shunXuId;
    
    private String states;
    
    private int page;
    
    private String nowCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

	public void setShunXuId(String shunXuId) {
		this.shunXuId = shunXuId;
	}

	public String getShunXuId() {
		return shunXuId;
	}

	public void setStates(String states) {
		this.states = states;
	}

	public String getStates() {
		return states;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPage() {
		return page;
	}

	public void setNowCode(String nowCode) {
		this.nowCode = nowCode;
	}

	public String getNowCode() {
		return nowCode;
	}
}