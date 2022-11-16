package dto;

public class Souvenir implements java.io.Serializable{
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String Id; 			    //아이디
	private String name; 			//이름
	private String author;			//글쓴이
	private int price;              //가격
	private String description;		//설명
	private String continent;       //대륙
	private String country;			//나라
	private String destination;	    //여행지
	private String filename;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
