package dao;

import java.util.ArrayList;
import dto.Travier;

public class TravierRepository {
	ArrayList<Travier> listOfBooks = new ArrayList<Travier>();
	private static TravierRepository instance = new TravierRepository();

	public static TravierRepository getInstance() {
		return instance;
	}

	public TravierRepository() {

		Travier book1 = new Travier("10000", "HTML5+CSS", 15000);
		book1.setDescription("워드나 PPT문서를 만들수 있나요? 그러면 문제 없습니다. 지금 바로 웹페이지에 도전하세요.");
		book1.setCategory("Hello Coding");
		book1.setPublisher("한빛미디어");
		book1.setAuthor("황재호");
		book1.setTotalPages(268);
		book1.setUnitInStock(1500);
		book1.setReleaseDate("2019-12-17");
		book1.setFilename("content.png");

		Travier book2 = new Travier("10001", "쉽게 배우는 자바 프로그래밍", 27000);
		book2.setDescription("객체 지향의 핵심과 자바의 현대적 기능을 다루면서 초보자가 쉽게 학습할 수 있습니다.");
		book2.setCategory("IT모바일");
		book2.setPublisher("한빛아카데미");
		book2.setAuthor("우종중");
		book2.setTotalPages(308);
		book2.setUnitInStock(2000);
		book2.setReleaseDate("2020-09-10");
		book2.setFilename("java.jpg");
		
		Travier book3 = new Travier("10002", "스프링4 입문", 27000);
		book3.setDescription("스프링은 단순히 사용 방법만 익히는것보다 아키텍쳐를 이해하는게 중요합니다!");
		book3.setCategory("IT모바일");
		book3.setPublisher("한빛미디어");
		book3.setAuthor("하세가와 유이치,오오노 와타루,토키 코헤이(권은철,전민수)");
		book3.setTotalPages(189);
		book3.setUnitInStock(3000);
		book3.setReleaseDate("2021-09-10");
		book3.setFilename("spring.jpg");
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}

	public ArrayList<Travier> getAllBooks() {
		return listOfBooks;
	}

	public void addBook(Travier book) {
		listOfBooks.add(book);
	}

	public Travier getBookById(String bookId) {
		Travier bookByid = null;
		
		for (int i = 0; i < listOfBooks.size(); i++) {
			Travier book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
				bookByid = book;
				break;
			}
		}
		return bookByid;
	}
}