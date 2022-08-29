package model;

public class VoteDTO {
	private String jumin;
	private String name;
	private char number;
	private String time;
	private String area;
	private char confirm;
	
	public VoteDTO(String jumin, String name, char number, String time,String area, char confirm) {
		this.jumin = jumin;
		this.name = name;
		this.number = number;
		this.time = time;
		this.area = area;
		this.confirm = confirm;
	}

	public String getJumin() {
		return jumin;
	}

	public String getName() {
		return name;
	}

	public char getNumber() {
		return number;
	}

	public String getTime() {
		return time;
	}

	public String getArea() {
		return area;
	}

	public char getConfirm() {
		return confirm;
	}
}
