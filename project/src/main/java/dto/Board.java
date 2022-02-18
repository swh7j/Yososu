package dto;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Board {
	private int b_num;
	private String b_title;
	private String b_contents;
	private String b_pw;
	private String b_date;
	private int b_view;
	private String b_writer; // �옉�꽦�옄
	
	// �깮�꽦�옄 [ 1.鍮덉깮�꽦�옄 2.�쟾泥댁깮�꽦�옄 3.�벑濡앹깮�꽦�옄 4.�닔�젙�깮�꽦�옄 ]
	public Board() {}
	public Board(int b_num, String b_title, String b_contents, String b_pw, String b_writer,String b_date ,int b_view) {
		super();
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_pw = b_pw;
		// 1. �옉�꽦�옄 = �쉶�썝踰덊샇瑜� �씠�슜�븳 �븘�씠�뵒 李얠븘�꽌 ���엯
		this.b_writer = b_writer;
		// 2. �벑濡앸궇吏쒖� �삤�뒛�궇吏쒖� �룞�씪�븯硫� �떆媛� �븘�땲硫� �궇吏� �몴�떆
		this.b_date = b_date;
		
		/*
		 * Date today = new Date(); // 1. �삤�뒛�궇吏� SimpleDateFormat datetimeformat = new
		 * SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); // �궇吏�,�떆媛꾪삎�떇 SimpleDateFormat
		 * dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // �궇吏� �삎�떇 SimpleDateFormat
		 * timeformat = new SimpleDateFormat("a hh:mm"); // �떆媛� �삎�떇 try { Date date =
		 * datetimeformat.parse( b_date ); // [臾몄옄�뿴]DB -> �궇吏�/�떆媛� �삎�떇 蹂��솚 if(
		 * dateFormat.format( date ).equals( dateFormat.format( today ) ) ) { // �벑濡앸궇吏� =
		 * �삤�뒛�궇吏� 鍮꾧탳 this.b_date = timeformat.format(date); // �궇吏쒓� �룞�씪�븯硫� �떆媛꾪삎�떇 �쟻�슜 }else {
		 * this.b_date = dateFormat.format(date); // �궇吏쒓� �룞�씪�븯吏� �븡�쑝硫� �궇吏쒗삎�떇 �쟻�슜 } } catch
		 * (Exception e) {}
		 */

		this.b_view = b_view;

		
	}
	public Board(String b_title, String b_contents, String b_pw, String b_writer) {
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_pw = b_pw;
		this.b_writer = b_writer;

	}
	
	public Board(int b_num, String b_title, String b_contents, String b_pw, String b_writer) {
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_pw = b_pw;
		this.b_writer = b_writer;
	
	}
	
	public Board( String b_title, String b_contents, int b_num) {
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_contents = b_contents;

	}
	
	
	public Board(int b_num, String b_title, String b_contents, String b_writer, String b_date, int b_view) {
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_date = b_date;
		this.b_writer = b_writer;
		this.b_view = b_view;
	}
	
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_contents() {
		return b_contents;
	}
	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}
	public String getB_pw() {
		return b_pw;
	}
	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_view() {
		return b_view;
	}
	public void setB_view(int b_view) {
		this.b_view = b_view;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}	
	
	
	
}
