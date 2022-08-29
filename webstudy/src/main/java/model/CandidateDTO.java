package model;

public class CandidateDTO {
	private char number;
	private String name;
	private String code;
	private char school;
	private String jumin;
	private String city;
	private int vote;
	private String mobile;
	private String party;
	
	public CandidateDTO(char number, String name, String code, char school, String jumin, String city, int vote,String mobile, String party) {
		this.number = number;
		this.name=name;
		this.code = code;
		this.school = school;
		this.jumin = jumin;
		this.city = city;
		this.vote = vote;
		this.mobile = mobile;
		this.party = party;
	}

	public char getNumber() {
		return number;
	}

	public String getName() {
		return name;
	}

	public String getCode() {
		return code;
	}

	public char getSchool() {
		return school;
	}

	public String getJumin() {
		return jumin;
	}

	public String getCity() {
		return city;
	}
	
	public int getVote() {
		return vote;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public String getParty() {
		return party;
	}
}
