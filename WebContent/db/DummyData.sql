DROP TABLE  CUSTOMER CASCADE CONSTRAINTS;
--------------------------------------------------------------------
 ---         1.      회원 정보   CUSTOMER    asdasdasd                      -----
--------------------------------------------------------------------
--1. 회원정보
CREATE TABLE CUSTOMER(
     CID          VARCHAR2(50) PRIMARY KEY,
     CPW         VARCHAR2(50) NOT NULL,
     CNAME     VARCHAR2(50) NOT NULL,
     CEMAIL    VARCHAR2(50),
     CBIRTH    DATE ,
     CADDRESS  VARCHAR2(300),
     CRDATE     DATE  DEFAULT SYSDATE NOT NULL
);
    SELECT * FROM CUSTOMER;
    
    
        INSERT INTO CUSTOMER (CID ,  CPW , CNAME , CEMAIL , CBIRTH , CADDRESS )
            VALUES ('AAA','111','백종원','KOK@NN.COM','1994-10-12','강남구 언주로');
SELECT * FROM CUSTOMER;
        INSERT INTO CUSTOMER (CID ,  CPW , CNAME , CEMAIL , CBIRTH , CADDRESS )
            VALUES ('BBB','111','강동원','KOK@NN.COM','2000-07-12','강남구 언주로');
SELECT * FROM CUSTOMER;
        INSERT INTO CUSTOMER (CID ,  CPW , CNAME , CEMAIL , CBIRTH , CADDRESS )
            VALUES ('CCC','111','손석구','KOK@NN.COM','2000-07-12','강남구 언주로');
COMMIT;
--------------------------------------------------------------------
 ---           2.     관리자 등록 ADMIN                     -----
 --------------------------------------------------------------------
--관리자 등록
    DROP TABLE ADMIN;
        CREATE TABLE ADMIN (
            AID VARCHAR2(50) PRIMARY KEY,
            APW VARCHAR2(50) NOT NULL,
            ANAME VARCHAR2(50) NOT NULL
    );
    INSERT INTO ADMIN ( AID , APW , ANAME)
          VALUES('admin','111','오동준');
SELECT * FROM ADMIN;
--3. --------------------------------------------------------------------
  ---           3.     관리자 메뉴 등록 ADMINMENU                   -----
 --------------------------------------------------------------------
    DROP TABLE ADMINMENU;
        CREATE TABLE ADMINMENU(
           FOODID           NUMBER(6) PRIMARY KEY,
           MENUNAME     VARCHAR2(50) NOT NULL,
           MENUPRICE     VARCHAR2(50) NOT NULL,
           APHOTO           VARCHAR2(50) NOT NULL,
           FOODCONTENT  VARCHAR2(2000) NOT NULL
        );
 commit;
--메뉴 번호 시퀀스 생성 / 삭제 
--ADMINMENU_SEQ.NEXTVAL
-- ADMINMENU_SEQ.CURRVAL
 DROP SEQUENCE ADMINMENU_SEQ; 
 CREATE SEQUENCE ADMINMENU_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
 -- 관리자 메뉴등록        
  INSERT INTO ADMINMENU (FOODID , MENUNAME , MENUPRICE,APHOTO,FOODCONTENT)
       VALUES(ADMINMENU_SEQ.NEXTVAL,'갈치조림','40000원','GALCHE.JPG','갈치 조림은 맛있다');
  SELECT * FROM ADMINMENU;  
 
 --------------------------------------------------------------------
 ---               관리자 공지사항 등록 Notice                     -----
 --------------------------------------------------------------------
 DROP TABLE NOTICE;
     CREATE TABLE NOTICE(
     NID              NUMBER(6) PRIMARY KEY,
     AID              VARCHAR2(50) REFERENCES ADMIN(AID),
     ATITLE           VARCHAR2(250) NOT NULL,
     ACONTENT         VARCHAR2(4000) NOT NULL,
     ARDATE           DATE DEFAULT SYSDATE,
     AIP              VARCHAR2(20)
     );
--관리자 글번호 시퀀스 생성
DROP SEQUENCE Notice_SEQ;     
CREATE SEQUENCE Notice_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;

            
    
--------------------------------------------------------------------
 ---   4.             메뉴 후기 글 남기기  MENU_REVIEW               -----
 --------------------------------------------------------------------

-- 메뉴 후기글 

--mId VARCHAR2(30) REFERENCES MVC_MEMBER(MID) 참조 
DROP TABLE  MENU_REVIEW ;
SELECT * FROM MENU_REVIEW;
    CREATE TABLE MENU_REVIEW(
       MID                  NUMBER(6) PRIMARY KEY, --메뉴글번호
       CID                  VARCHAR2(50) REFERENCES CUSTOMER(CID),
       FOODID           NUMBER(6) REFERENCES  ADMINMENU (FOODID),
       STAR             NUMBER(5) DEFAULT 0 ,
       MTITLE            VARCHAR2(250) NOT NULL,
       MCONTENT      VARCHAR2(4000) NOT NULL,
       MPHOTO           VARCHAR2(30),
       MRDATE           DATE DEFAULT SYSDATE,
       MHIT                 NUMBER(6) DEFAULT 0 ,
       MGROUP           NUMBER(6) NOT NULL,
       MSTEP              NUMBER(3) NOT NULL,
       MINDENT          NUMBER(3) NOT NULL,
       MIP                  VARCHAR2(20) NOT NULL);


-- 글번호 시퀀스 생성 삭제       
DROP SEQUENCE MENU_REVIEW_SEQ;     
CREATE SEQUENCE MENU_REVIEW_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;

--(더미데이터 후기 원글작성)
--VALUES (FILEBOARD_SEQ.NEXTVAL, 'go','title','content',null, FILEBOARD_SEQ.CURRVAL, 0, 0, '192.168.20.31');

INSERT INTO MENU_REVIEW ( MID,CID, FOODID ,MTITLE,MCONTENT,MPHOTO,MGROUP,MSTEP,MINDENT,MIP)
            VALUES(MENU_REVIEW_SEQ.NEXTVAL,'AAA',1,'갈치조림짱','갈치가아주좋았어요',NULL,
                 MENU_REVIEW_SEQ.CURRVAL,0,0,'192.');

INSERT INTO MENU_REVIEW ( MID,CID, FOODID ,MTITLE,MCONTENT,MPHOTO,MGROUP,MSTEP,MINDENT,MIP)
            VALUES(MENU_REVIEW_SEQ.NEXTVAL,'BBB',1,'갈치가 싱싱해요','역시 교래향',NULL,
                 MENU_REVIEW_SEQ.CURRVAL,0,0,'193.');
SELECT * FROM MENU_REVIEW ORDER BY MGROUP DESC, MSTEP;

SELECT * FROM MENU_REVIEW;



--------------------------------------------------------------------
 ---               댓글 남기기   REPLY                             -----
 --------------------------------------------------------------------
-- 댓글 테이블 생성 / 삭제 
DROP TABLE REPLY;
 CREATE TABLE REPLY(
    MID            NUMBER(6)   REFERENCES MENU_REVIEW(MID),
    CID          VARCHAR2(50) REFERENCES CUSTOMER(CID),
    REPLYMEMO  VARCHAR2(1000) NOT NULL ,
    RDATE         DATE DEFAULT SYSDATE,
    RIP              VARCHAR2(20) NOT NULL);








