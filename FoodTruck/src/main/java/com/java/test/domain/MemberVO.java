package com.java.test.domain;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	// �쉶�썝媛��엯 �뀒�씠釉�
	private String userId;
	private String userPass;
	private String userName;
	private String userNick;
	private int userIdnum;
	private int userPhone;
	private String userEmail;
	private int userChk;
	private int userCount;
	private String userPhoto;

	// �뙆�씪泥⑤�瑜� �쐞�븳 �옉�뾽
	MultipartFile userfile;

	public MultipartFile getUserfile() {
		return userfile;
	}

	public void setUserfile(MultipartFile userfile) {
		this.userfile = userfile;
		if (!userfile.isEmpty()) {

			this.userPhoto = userfile.getOriginalFilename();

//			/* 愿��닚�븰�썝而� 寃쎈줈 */File f = new File(
//					"C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
//							+ userPhoto);
//			/*愿��닚�끂�듃遺� 寃쎈줈*/File f = new File("C:\\Users\\john\\Documents\\workspace-sts-3.9.12.RELEASE\\FoodTruck\\src\\main\\webapp\\resources\\upload\\" +feedContent_photo );
			
//			/* 瑜섑븰�썝而� 寃쎈줈 */File f = new File(
//					"C:\\Users\\User\\Desktop\\Spring\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
//							+ userPhoto);
			/* 류세환 집컴퓨터 */File f = new File(
					"C:\\Users\\pc\\Desktop\\FoodTruck Final Folder\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
							+ userPhoto);
			
			

			try {
				userfile.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	// QnA �뀒�씠釉�
	private String qnaTitle;
	private String qnaContent;
	private String qnaContent_photo;
	private Date qnaContentdate;
	private String qnaComment;
//	private String title;
//	private String content;

	// �씠踰ㅽ듃 寃뚯떆�뙋 �뀒�씠釉�
	private int eventseq;
	private String eventTitle;
	private String eventContent;
	private String eventmm;
	private String eventdd;
	private String eventContent_photo;
	private Date eventdate;

	public Date getEventdate() {
		return eventdate;
	}

	public void setEventdate(Date eventdate) {
		this.eventdate = eventdate;
	}

	MultipartFile eventfile;

	public MultipartFile getEventfile() {
		return eventfile;
	}

	public void setEventfile(MultipartFile eventfile) {
		this.eventfile = eventfile;

		// �뙆�씪�씠 �뾽濡쒕뱶媛� �맆 寃쎌슦 (�뙆�씪�씠 鍮꾩뼱�엳吏� �븡�쓣 �븣)
		if (!eventfile.isEmpty()) {

			this.eventContent_photo = eventfile.getOriginalFilename();
//			
//			// 32媛쒖쓽 �옖�뜡�븳 臾몄옄�뿴(�닽�옄�룷�븿)�쓣 �깮�꽦�븯�뒗 �겢�옒�뒪(�솗�옣�옄 �뾾�뼱)
//			String fileExtension = b_fname.substring(b_fname.lastIndexOf(".")); // �솗�옣�옄紐낅쭔 �뵲�삤湲�
//			this.b_fname_en = UUID.randomUUID().toString().replaceAll("-","") + fileExtension;
//

			// 臾댁“嫄� �뙆�씪�쓣 �깮�꽦
			// "臾댁“嫄�" : �뙆�씪�씠 媛숇뜑�씪�룄 �삤瑜섎�� 諛쒖깮�븯嫄곕굹 吏덉쓽瑜� 二쇰뒗寃� �븘�땲�씪 臾댁“嫄� �깮�꽦
			// -> 媛숈� �씠由꾩쓣 媛�吏� �뙆�씪�쓣 泥⑤��븷 寃쎌슦 �삤瑜섎컻�깮

			// �궗�슜�옄媛� �엯�젰�빐以� �뙆�씪紐낆쓣 �슦由щ쭔�쓽 �뙆�씪紐낆쑝濡� 諛붽퓭�꽌(�븫�샇�솕) ���옣�븯怨�
			// �븫�샇�쉶�맂(���옣�맂) �뙆�씪�쓣 �떎�떆 蹂듯샇�솕�빐�꽌 �궗�슜�옄�뿉寃� �쟾�떖
//			/*�젙誘쇱씠�삎而� 寃쎈줈*/File f = new File("C:\\Users\\User\\Desktop\\FoodTruck\\src\\main\\webapp\\resources\\upload\\" +eventContent_photo);
//			/* 愿��닚�븰�썝而� 寃쎈줈 */File f = new File(
//					"C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
//							+ eventContent_photo);
			
//			/* 瑜섑븰�썝而� 寃쎈줈 */File f = new File(
//					"C:\\Users\\User\\Desktop\\Spring\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
//							+ eventContent_photo);
			
			/* 류세환 집컴퓨터 */File f = new File(
					"C:\\Users\\pc\\Desktop\\FoodTruck Final Folder\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
							+ eventContent_photo);
			
			try {
				eventfile.transferTo(f);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 怨듦났湲곌� �삊�뾽 �떊泥� 寃뚯떆�뙋 �뀒�씠釉�
	private int ballSeq;
	private String ballTitle;
	private String ballContent;
	private String ballContent_photo;
	private Date ballContentdate;
	private String ballComment;

	// �솉蹂� �삊李� �슂泥� �떊泥� 寃뚯떆�뙋 �뀒�씠釉�
	private int promotionseq;
	private String promotionTitle;
	private String promotionContent;
	private String promotionContent_photo;
	private Date promotionContentdate;
	private String promotionComment;
	private int qnaSeq;

	// �뫖�뱶�듃�윮 �슂泥� �뀒�씠釉�
	private int requestSeq; // 湲� 踰덊샇
	private String requestWriter; // 湲� �옉�꽦�옄
	private String requestTitle; // 湲� �젣紐�
	private String requestDate; // �뫖�뱶�듃�윮 �옣�궗 �궇吏�
	private String requestLocation; // �뫖�뱶�듃�윮 �옣�궗 �쐞移�
	private String requestContent; // 湲� �궡�슜

	// �뫖�뱶�듃�윮 紐⑥쭛 �뀒�씠釉�
	private int recruitSeq; // 湲�踰덊샇
	private String recruitWriter; // 湲��옉�꽦�옄
	private String recruitTitle; // 湲��젣紐�
	private String recruitDate; // �뫖�뱶�듃�윮�옣�궗�궇吏�
	private String recruitLocation; // �뫖�뱶�듃�윮�옣�궗�쐞移�
	private String recruitContent; // 湲��궡�슜

	// �뫖�뱶�듃�윮 �슂泥� & 紐⑥쭛 �뀒�씠釉� 怨듯넻 蹂��닔
	private String r_fname; // 泥⑤��뙆�씪紐�
	private String r_fname_en; // 泥⑤��뙆�씪 �솗�옣�옄紐�
	private int contentLike; // 寃뚯떆湲� 醫뗭븘�슂 �닔

	// �뫖�뱶�듃�윮 �슂泥� 寃뚯떆湲� �뙎湲� �뀒�씠釉�
	private int commentSeq; // �뙎湲� 踰덊샇
	private String commentWriter; // �뙎湲� �옉�꽦�옄
	private String commentContent; // �뙎湲� �궡�슜
	private int commentLike; // �뙎湲� 醫뗭븘�슂 �닔
	private int commentCnt; // �뙎湲� �닔

	// �뫖�뱶�듃�윮 紐⑥쭛 寃뚯떆湲� �뙎湲� �뀒�씠釉�
	private int recruitcmtSeq; // �뙎湲� 踰덊샇
	private String recruitcmtWriter; // �뙎湲� �옉�꽦�옄
	private String recruitcmtContent; // �뙎湲� �궡�슜
	private int recruitcmtLike; // �뙎湲� 醫뗭븘�슂 �닔
	private int recruitcmtCnt; // �뙎湲� �닔

	// 異뺤젣蹂� �뫖�뱶�듃�윮 議� 寃뚯떆�뙋 �뀒�씠釉�
	private int festivalSeq; // 湲� 踰덊샇
	private String festivalWriter; // 湲� �옉�꽦�옄
	private String festivalTitle; // 異뺤젣 �젣紐�
	private String festivalContent; // 異뺤젣 �궡�슜
	private String festivalDate; // 異뺤젣 �궇吏�
	private String festivalContentdate; // 寃뚯떆湲� �옉�꽦�씪
	private String f_fname; // �뙆�씪紐�
	private String f_fname_en; // �솗�옣�옄紐�

	// 異뺤젣蹂� �뫖�뱶�듃�윮 議� 寃뚯떆�뙋 寃뚯떆湲� �뙎湲� �뀒�씠釉�
	private int fcommentSeq; // �뙎湲� 踰덊샇
	private String fcommentWriter; // �뙎湲� �옉�꽦�옄
	private String fcommentContent; // �뙎援� �궡�슜
	private int fcommentLike; // �뙎湲� 醫뗭븘�슂
	private int fcommentCnt; // �뙎湲� �닔

	// �뫖�뱶�듃�윮議� Map �뀒�씠釉�
	private int applySeq; // �떆���뒪踰덊샇
	private String applyTitle; // �뫖�뱶�듃�윮議� �씠由�
	private String applyAdd; // �뫖�뱶�듃�윮議� 二쇱냼
	private String applyWebAddr; // �뫖�뱶�듃�윮�떊泥��븯�윭 媛�湲� url二쇱냼
	private String applyDate; // �뫖�뱶�듃�윮議� �궇吏�

	// �뫖�뱶�듃�윮議� �옄由ъ떊泥� �뀒�씠釉�
	private int reservationSeq; // �떆���뒪踰덊샇
	private String reservationTitle; // �긽�샇紐�
	private String reservationDate; // �떊泥��궇吏�
	private int reservationPhone; // �빖�뱶�룿踰�
	private String reservationEmail; // �씠硫붿씪
	private String reservationMarkZone; // �삁�빟�옄由�

	
	
	
	
	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public int getQnaSeq() {
		return qnaSeq;
	}

	public String getReservationMarkZone() {
		return reservationMarkZone;
	}

	public void setReservationMarkZone(String reservationMarkZone) {
		this.reservationMarkZone = reservationMarkZone;
	}

	public void setQnaSeq(int qnaSeq) {
		this.qnaSeq = qnaSeq;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaContent_photo() {
		return qnaContent_photo;
	}

	public void setQnaContent_photo(String qnaContent_photo) {
		this.qnaContent_photo = qnaContent_photo;
	}

	public Date getQnaContentdate() {
		return qnaContentdate;
	}

	public void setQnaContentdate(Date qnaContentdate) {
		this.qnaContentdate = qnaContentdate;
	}

	public String getQnaComment() {
		return qnaComment;
	}

	public void setQnaComment(String qnaComment) {
		this.qnaComment = qnaComment;
	}

	public int getEventseq() {
		return eventseq;
	}

	public void setEventseq(int eventseq) {
		this.eventseq = eventseq;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventmm() {
		return eventmm;
	}

	public void setEventmm(String eventmm) {
		this.eventmm = eventmm;
	}

	public String getEventdd() {
		return eventdd;
	}

	public void setEventdd(String eventdd) {
		this.eventdd = eventdd;
	}

	public String getEventContent_photo() {
		return eventContent_photo;
	}

	public void setEventContent_photo(String eventContent_photo) {
		this.eventContent_photo = eventContent_photo;
	}

	public int getBallSeq() {
		return ballSeq;
	}

	public void setBallSeq(int ballSeq) {
		this.ballSeq = ballSeq;
	}

	public String getBallTitle() {
		return ballTitle;
	}

	public void setBallTitle(String ballTitle) {
		this.ballTitle = ballTitle;
	}

	public String getBallContent() {
		return ballContent;
	}

	public void setBallContent(String ballContent) {
		this.ballContent = ballContent;
	}

	public String getBallContent_photo() {
		return ballContent_photo;
	}

	public void setBallContent_photo(String ballContent_photo) {
		this.ballContent_photo = ballContent_photo;
	}

	public Date getBallContentdate() {
		return ballContentdate;
	}

	public void setBallContentdate(Date ballContentdate) {
		this.ballContentdate = ballContentdate;
	}

	public String getBallComment() {
		return ballComment;
	}

	public void setBallComment(String ballComment) {
		this.ballComment = ballComment;
	}

	public int getPromotionseq() {
		return promotionseq;
	}

	public void setPromotionseq(int promotionseq) {
		this.promotionseq = promotionseq;
	}

	public String getPromotionTitle() {
		return promotionTitle;
	}

	public void setPromotionTitle(String promotionTitle) {
		this.promotionTitle = promotionTitle;
	}

	public String getPromotionContent() {
		return promotionContent;
	}

	public void setPromotionContent(String promotionContent) {
		this.promotionContent = promotionContent;
	}

	public String getPromotionContent_photo() {
		return promotionContent_photo;
	}

	public void setPromotionContent_photo(String promotionContent_photo) {
		this.promotionContent_photo = promotionContent_photo;
	}

	public Date getPromotionContentdate() {
		return promotionContentdate;
	}

	public void setPromotionContentdate(Date promotionContentdate) {
		this.promotionContentdate = promotionContentdate;
	}

	public String getPromotionComment() {
		return promotionComment;
	}

	public void setPromotionComment(String promotionComment) {
		this.promotionComment = promotionComment;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getUserIdnum() {
		return userIdnum;
	}

	public void setUserIdnum(int userIdnum) {
		this.userIdnum = userIdnum;
	}

	public int getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserChk() {
		return userChk;
	}

	public void setUserChk(int userChk) {
		this.userChk = userChk;
	}

	public int getRequestSeq() {
		return requestSeq;
	}

	public void setRequestSeq(int requestSeq) {
		this.requestSeq = requestSeq;
	}

	public String getRequestWriter() {
		return requestWriter;
	}

	public void setRequestWriter(String requestWriter) {
		this.requestWriter = requestWriter;
	}

	public String getRequestTitle() {
		return requestTitle;
	}

	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getRequestLocation() {
		return requestLocation;
	}

	public void setRequestLocation(String requestLocation) {
		this.requestLocation = requestLocation;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public int getRecruitSeq() {
		return recruitSeq;
	}

	public void setRecruitSeq(int recruitSeq) {
		this.recruitSeq = recruitSeq;
	}

	public String getRecruitWriter() {
		return recruitWriter;
	}

	public void setRecruitWriter(String recruitWriter) {
		this.recruitWriter = recruitWriter;
	}

	public String getRecruitTitle() {
		return recruitTitle;
	}

	public void setRecruitTitle(String recruitTitle) {
		this.recruitTitle = recruitTitle;
	}

	public String getRecruitDate() {
		return recruitDate;
	}

	public void setRecruitDate(String recruitDate) {
		this.recruitDate = recruitDate;
	}

	public String getRecruitLocation() {
		return recruitLocation;
	}

	public void setRecruitLocation(String recruitLocation) {
		this.recruitLocation = recruitLocation;
	}

	public String getRecruitContent() {
		return recruitContent;
	}

	public void setRecruitContent(String recruitContent) {
		this.recruitContent = recruitContent;
	}

	public String getR_fname() {
		return r_fname;
	}

	public void setR_fname(String r_fname) {
		this.r_fname = r_fname;
	}

	public String getR_fname_en() {
		return r_fname_en;
	}

	public void setR_fname_en(String r_fname_en) {
		this.r_fname_en = r_fname_en;
	}

	public int getContentLike() {
		return contentLike;
	}

	public void setContentLike(int contentLike) {
		this.contentLike = contentLike;
	}

	public int getCommentSeq() {
		return commentSeq;
	}

	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getCommentLike() {
		return commentLike;
	}

	public void setCommentLike(int commentLike) {
		this.commentLike = commentLike;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public int getRecruitcmtSeq() {
		return recruitcmtSeq;
	}

	public void setRecruitcmtSeq(int recruitcmtSeq) {
		this.recruitcmtSeq = recruitcmtSeq;
	}

	public String getRecruitcmtWriter() {
		return recruitcmtWriter;
	}

	public void setRecruitcmtWriter(String recruitcmtWriter) {
		this.recruitcmtWriter = recruitcmtWriter;
	}

	public String getRecruitcmtContent() {
		return recruitcmtContent;
	}

	public void setRecruitcmtContent(String recruitcmtContent) {
		this.recruitcmtContent = recruitcmtContent;
	}

	public int getRecruitcmtLike() {
		return recruitcmtLike;
	}

	public void setRecruitcmtLike(int recruitcmtLike) {
		this.recruitcmtLike = recruitcmtLike;
	}

	public int getRecruitcmtCnt() {
		return recruitcmtCnt;
	}

	public void setRecruitcmtCnt(int recruitcmtCnt) {
		this.recruitcmtCnt = recruitcmtCnt;
	}

	public int getFestivalSeq() {
		return festivalSeq;
	}

	public void setFestivalSeq(int festivalSeq) {
		this.festivalSeq = festivalSeq;
	}

	public String getFestivalWriter() {
		return festivalWriter;
	}

	public void setFestivalWriter(String festivalWriter) {
		this.festivalWriter = festivalWriter;
	}

	public String getFestivalTitle() {
		return festivalTitle;
	}

	public void setFestivalTitle(String festivalTitle) {
		this.festivalTitle = festivalTitle;
	}

	public String getFestivalContent() {
		return festivalContent;
	}

	public void setFestivalContent(String festivalContent) {
		this.festivalContent = festivalContent;
	}

	public String getFestivalDate() {
		return festivalDate;
	}

	public void setFestivalDate(String festivalDate) {
		this.festivalDate = festivalDate;
	}

	public String getFestivalContentdate() {
		return festivalContentdate;
	}

	public void setFestivalContentdate(String festivalContentdate) {
		this.festivalContentdate = festivalContentdate;
	}

	public String getF_fname() {
		return f_fname;
	}

	public void setF_fname(String f_fname) {
		this.f_fname = f_fname;
	}

	public String getF_fname_en() {
		return f_fname_en;
	}

	public void setF_fname_en(String f_fname_en) {
		this.f_fname_en = f_fname_en;
	}

	public int getFcommentSeq() {
		return fcommentSeq;
	}

	public void setFcommentSeq(int fcommentSeq) {
		this.fcommentSeq = fcommentSeq;
	}

	public String getFcommentWriter() {
		return fcommentWriter;
	}

	public void setFcommentWriter(String fcommentWriter) {
		this.fcommentWriter = fcommentWriter;
	}

	public String getFcommentContent() {
		return fcommentContent;
	}

	public void setFcommentContent(String fcommentContent) {
		this.fcommentContent = fcommentContent;
	}

	public int getFcommentLike() {
		return fcommentLike;
	}

	public void setFcommentLike(int fcommentLike) {
		this.fcommentLike = fcommentLike;
	}

	public int getFcommentCnt() {
		return fcommentCnt;
	}

	public void setFcommentCnt(int fcommentCnt) {
		this.fcommentCnt = fcommentCnt;
	}

	public int getApplySeq() {
		return applySeq;
	}

	public void setApplySeq(int applySeq) {
		this.applySeq = applySeq;
	}

	public String getApplyTitle() {
		return applyTitle;
	}

	public void setApplyTitle(String applyTitle) {
		this.applyTitle = applyTitle;
	}

	public String getApplyAdd() {
		return applyAdd;
	}

	public void setApplyAdd(String applyAdd) {
		this.applyAdd = applyAdd;
	}

	public String getApplyWebAddr() {
		return applyWebAddr;
	}

	public void setApplyWebAddr(String applyWebAddr) {
		this.applyWebAddr = applyWebAddr;
	}

	public int getReservationSeq() {
		return reservationSeq;
	}

	public void setReservationSeq(int reservationSeq) {
		this.reservationSeq = reservationSeq;
	}

	public String getReservationTitle() {
		return reservationTitle;
	}

	public void setReservationTitle(String reservationTitle) {
		this.reservationTitle = reservationTitle;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public int getReservationPhone() {
		return reservationPhone;
	}

	public void setReservationPhone(int reservationPhone) {
		this.reservationPhone = reservationPhone;
	}

	public String getReservationEmail() {
		return reservationEmail;
	}

	public void setReservationEmail(String reservationEmail) {
		this.reservationEmail = reservationEmail;
	}

	// ----------------------------------------------------------------------------------
	// �뵾�뱶 寃뚯떆湲� �뀒�씠釉�
	private int feedSeq;

	// userid
	private String feedContent;
	private String feedContent_photo;
	private int feedCommentCnt;
	private Date feedDate;

	// �뙆�씪泥⑤�瑜� �쐞�븳 �옉�뾽
	MultipartFile feedfile;

	public MultipartFile getFeedfile() {
		return feedfile;
	}

	public void setFeedfile(MultipartFile feedfile) { // 留덉씠�뵾�뱶 �궗吏� 寃쎈줈
		this.feedfile = feedfile;
		if (!feedfile.isEmpty()) {

			this.feedContent_photo = feedfile.getOriginalFilename();
//
//			/* 愿��닚�븰�썝而� 寃쎈줈 */File f = new File(
//					"C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
//							+ feedContent_photo);
//				/*愿��닚�끂�듃遺� 寃쎈줈*/File f = new File("C:\\Users\\john\\Documents\\workspace-sts-3.9.12.RELEASE\\FoodTruck\\src\\main\\webapp\\resources\\upload\\" +feedContent_photo );
			
//			/* 瑜섑븰�썝而� 寃쎈줈 */File f = new File(
//					"C:\\Users\\User\\Desktop\\Spring\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
//							+ feedContent_photo);
			
			/* 류세환 집컴퓨터 */File f = new File(
					"C:\\Users\\pc\\Desktop\\FoodTruck Final Folder\\FoodTruck\\src\\main\\webapp\\resources\\upload\\"
							+ feedContent_photo);
			
			try {
				feedfile.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int getFeedSeq() {
		return feedSeq;
	}

	public void setFeedSeq(int feedSeq) {
		this.feedSeq = feedSeq;
	}

	public String getFeedContent() {
		return feedContent;
	}

	public void setFeedContent(String feedContent) {
		this.feedContent = feedContent;
	}

	public String getFeedContent_photo() {
		return feedContent_photo;
	}

	public void setFeedContent_photo(String feedContent_photo) {
		this.feedContent_photo = feedContent_photo;
	}

	public int getFeedCommentCnt() {
		return feedCommentCnt;
	}

	public void setFeedCommentCnt(int feedCommentCnt) {
		this.feedCommentCnt = feedCommentCnt;
	}

	public Date getFeedDate() {
		return feedDate;
	}

	public void setFeedDate(Date feedDate) {
		this.feedDate = feedDate;
	}

	// ---------------------------------------------------------------
	// �뵾�뱶 寃뚯떆湲� �뀒�씠釉�

	// feedSeq
	private String commentCont;
	private Date commentDate;

	public String getCommentCont() {
		return commentCont;
	}

	public void setCommentCont(String commentCont) {
		this.commentCont = commentCont;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	// -------------------------------------------------------------------
	private String truckContent;
	private String truckName;
	private String truckNum;

	public String getTruckContent() {
		return truckContent;
	}

	public void setTruckContent(String truckContent) {
		this.truckContent = truckContent;
	}

	public String getTruckName() {
		return truckName;
	}

	public void setTruckName(String truckName) {
		this.truckName = truckName;
	}

	public String getTruckNum() {
		return truckNum;
	}

	public void setTruckNum(String truckNum) {
		this.truckNum = truckNum;
	}

}
