package com.soft.vo;

public class GarbageInfo {

	private String name;
	private String data;//类型
	private int code;


	public GarbageInfo() {

	}

	public GarbageInfo(String name, String data, int code) {
		this.name = name;
		this.data = data;
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "GarbageInfo{" +
				"name='" + name + '\'' +
				", data='" + data + '\'' +
				", code=" + code +
				'}';
	}
}