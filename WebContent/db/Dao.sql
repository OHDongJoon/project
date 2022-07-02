--DAO에 들어갈 쿼리
commit;
----------------------------------------------------------------------
--                    1. 회원등록     CUSTOMER                             --
----------------------------------------------------------------------
-- (1) 로그인
SELECT * FROM CUSTOMER WHERE CID='AAA' AND CPW='111';
-- (2) MID 로 DTO 가져오기 (로그인 성고시 SESSION 에 넣기 위함)
SELECT * FROM CUSTOMER WHERE CID = 'AAA';

--(3) 회원 ID 중복체크
SELECT * FROM CUSTOMER WHERE CID = 'CCC';

--(4) 회원가입
 INSERT INTO CUSTOMER (CID ,  CPW , CNAME , CEMAIL , CBIRTH , CADDRESS )
            VALUES ('DDD','111','정호영','ABC@NN.COM','1994-10-12','강남구 언주로');

--(5) 회원 정보 수정
UPDATE CUSTOMER SET CPW = '111',
                    CNAME = '호우',
                    CEMAIL = 'ye@nec.com',
                    CBIRTH = '1990-10-11',
                    CADDRESS = '제주'
            WHERE CID = 'DDD';
--(6) 회원리스트(TOP-N구문)
SELECT * FROM (SELECT ROWNUM RN, A. *FROM
                (SELECT * FROM CUSTOMER  ORDER BY CRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 4;
--(7) 회원수
SELECT COUNT(*) CNT FROM CUSTOMER;
--(8) 회원탈퇴
DELETE FROM CUSTOMER WHERE CID ='DDD';
SELECT * FROM CUSTOMER;
--(9) 이메일 중복체크 
SELECT * FROM CUSTOMER WHERE CEMAIL = 'KOK@NN.COM';

----------------------------------------------------------------------
--                  4.    MENU_REVIEW 메뉴리뷰 게시판                              --
----------------------------------------------------------------------

-- (1) 글목록(startRoW 부터 endRow까지) - 글번호 , 작성이름, 등등등 ... 
SELECT M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE M.CID=C.CID
            ORDER BY MGROUP DESC, MSTEP;
SELECT * FROM 
    (SELECT ROWNUM RN, A. * FROM
    (SELECT  M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE M.CID=C.CID
            ORDER BY MGROUP DESC, MSTEP) A)
    WHERE RN BETWEEN 1 AND 5;
    ROLLBACK;

--(2) 글 갯수
SELECT * FROM MENU_REVIEW;
SELECT COUNT(*) FROM MENU_REVIEW ;
--(3) 후기쓰기 원글
SELECT * FROM MENU_REVIEW;
SELECT * FROM ADMINMENU;
INSERT INTO MENU_REVIEW ( MID,CID, FOODID, STAR , MTITLE,MCONTENT,MPHOTO,MGROUP,MSTEP,MINDENT,MIP)
            VALUES(MENU_REVIEW_SEQ.NEXTVAL,'BBB',2,4,'흑돼지','넘맛',NULL,
                 MENU_REVIEW_SEQ.CURRVAL,0,0,'192.');
INSERT INTO MENU_REVIEW ( MID,CID, FOODID, STAR , MTITLE,MCONTENT,MPHOTO,MGROUP,MSTEP,MINDENT,MIP)
            VALUES(MENU_REVIEW_SEQ.NEXTVAL,'AAA',1,3,'흑돼지후기2','넘맛2',NULL,
                 MENU_REVIEW_SEQ.CURRVAL,0,0,'191.');

DELETE MENU_REVIEW WHERE MID='1';
--(4) MHIT 하나 올리기 ( 1번글 조회수 하나 올리기)
UPDATE MENU_REVIEW SET MHIT = MHIT +1 WHERE MID =1;
--(5) MID로 글 DTO 보기 
SELECT M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE C.CID=M.CID AND MID=1;

--(6) 글 수정하기(MID , MTITLE, MCONTNET, MPHOTO , MIP , MRDATE  
UPDATE MENU_REVIEW SET MTITLE= '바뀐갈치후기',
                        MCONTENT = '바뀐본문',
                        MPHOTO = NULL,
                        MIP = '1111',
                        MRDATE =SYSDATE
                WHERE MID = 1;
COMMIT;
--(7) 글 삭제하기 (MID로 삭제하기)
DELETE FROM MENU_REVIEW WHERE MID =1;

-- 더미데이터(위의 1번글에 대한 첫번째 답변글)
INSERT INTO MENU_REVIEW ( MID,CID,FOODID,MTITLE,MCONTENT,MPHOTO,
         MGROUP, MSTEP, MINDENT, MIP)
   VALUES (MENU_REVIEW_SEQ.NEXTVAL,'BBB','1','갈치구이답변','저도가볼게요',NULL,
            1,1,1,'192.168');
-- 더미데이터 (위의 1번글에 대한 두번째 답변글)
-- 답변글 추가전 STEP A 수행
SELECT * FROM MENU_REVIEW;
UPDATE MENU_REVIEW SET MSTEP = MSTEP+1
     WHERE MGROUP = 1 AND MSTEP>0;
INSERT INTO MENU_REVIEW (MID, CID, FOODID,MTITLE, MCONTENT,
        MGROUP, MSTEP, MINDENT, MIP)
    VALUES(MENU_REVIEW_SEQ.NEXTVAL,'CCC','1','갈치구이답답','그럼나도',
           1,1,1, '192.122.');
    
----------------------------------------------------------------------
--                          ADMIN TABLE                             --
----------------------------------------------------------------------
--(1) 관리자 등록
INSERT INTO ADMIN (AID , APW , ANAME)
    VALUES('admin2','111','꼬봉');
--2. 관리자 탈퇴
DELETE FROM ADMIN WHERE AID ='admin2';

--(2) 관리자 로그인 
SELECT * FROM ADMIN WHERE AID='admin' AND APW ='111';

--(3) 로그인 후 세션에 넣을 용도 :  admin aid 로 dto 가져오기
SELECT * FROM ADMIN WHERE AID = 'admin';
--4. 관리자 수정정
UPDATE ADmin SET aPW = '111',
                    aNAME = '야임마'
            WHERE AID = 'admin2';
--5. 관리자등록 id 중복 검사
SELECT * FROM ADMIN WHERE AID='admin';
SELECT * FROM ADMIN;
----------------------------------------------------------------------
--                          ADMINMENU TABLE  (관리자 메뉴등록)                           --
----------------------------------------------------------------------
--(1) 관리자 메뉴 등록(사진도)
   INSERT INTO ADMINMENU ( FOODID , MENUNAME , MENUPRICE,APHOTO,FOODCONTENT)
       VALUES( ADMINMENU_SEQ.NEXTVAL,'옥돔','10000원','OK.JPG','제주산 옥돔');
SELECT * FROM ADMINMENU;
SELECT * FROM MENU_REVIEW;

--(2) FOODID 로 메뉴 리스트가져오기 (메뉴보기 에서 사진 , 메뉴이름 ,평점, 가격) 
-- 최종 
select foodid, avg(star) from menu_review WHERE FOODID=1 group by foodid;
select A.FOODID , A.APHOTO, A.MENUNAME,A.MENUPRICE, (SELECT AVG(STAR) FROM MENU_REVIEW WHERE FOODID=A.FOODID GROUP BY FOODID) AVG from adminmenu A;

--(3) foodId 로 메뉴 상세보기 
SELECT  APHOTO , MENUNAME , FOODCONTENT FROM ADMINMENU WHERE FOODID=1;
--4 메뉴 수정
UPDATE ADMINMENU SET MENUNAME ='갈치2',
                     MENUPRICE ='50000원',
                     APHOTO    ='신상',
                     FOODCONTENT = '오늘 들어와서 올려봐요'
                     WHERE FOODID =1;

SELECT  MENUNAME, MENUPRICE, APHOTO , ROUND(AVG(STAR)) FROM ADMINMENU A,  MENU_REVIEW M WHERE  A.FOODID = M.FOODID GROUP BY MENUNAME , MENUPRICE, APHOTO;


--(3) 메뉴 상세보기 ( 메뉴 상세보기 에서 메뉴 
----------------------------------------------------------------------
--                          ADMINMENU NOTICE  (관리자 공지사항)                           --
----------------------------------------------------------------------

-- 작성자 이름  나오게 조인
SELECT * FROM notice;
SELECT  ANAME , N.*  FROM NOTICE N, ADMIN A WHERE N.AID=A.AID;
commit;

SELECT * FROM 
(SELECT ROWNUM RN, A. * FROM
(SELECT N.*, ANAME FROM NOTICE N, ADMIN A WHERE N.AID=A.AID
ORDER BY NID DESC) A) WHERE RN  BETWEEN 1 AND 5;
---------------------------------------------------------------------

 --(1) 글목록(startRoW 부터 endRow까지) - 글번호 , 작성이름, 등등등 ... 
SELECT N.*, ANAME FROM NOTICE N, ADMIN A WHERE N.AID=A.AID;
    SELECT * FROM 
    (SELECT ROWNUM RN, A. * FROM
    (SELECT  M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE M.CID=C.CID
            ORDER BY MGROUP DESC, MSTEP) A)
    WHERE RN BETWEEN 1 AND 5;  
    
SELECT * FROM 
    (SELECT ROWNUM RN, A. * FROM
    (SELECT N.*, ANAME FROM NOTICE N, ADMIN A WHERE N.AID=A.AID
        ORDER BY NID DESC) A)
    WHERE RN  BETWEEN 1 AND 5;
   commit;
    ROLLBACK;

--(2) 글 갯수
SELECT * FROM NOTICE;
SELECT COUNT(*) FROM NOTICE ;

SELECT * FROM NOTICE;

--(3) 공지사항 등록 글등록

    INSERT INTO NOTICE (NID , AID, ATITLE , ACONTENT ,AIP)
        VALUES(Notice_SEQ.NEXTVAL , 'admin', '공지사항입니다3' , '오늘 오시면 공기밥 서비스 입니다 ' , '192.111');
SELECT * FROM NOTICE;



--(5) MID로 글 DTO 보기 
SELECT N.*, ANAME FROM NOTICE N, ADMIN A WHERE N.AID=A.AID AND NID=1;

--(6) 글 수정하기(NID , ATITLE, ACONTNET,  AIP , ARDATE  
UPDATE NOTICE SET  ATITLE= '오늘 사장이 미쳤어요 ',
                        ACONTENT = '갈치구이 시키면 두루치기가 공짜!',
                        AIP = '1111',
                        ARDATE =SYSDATE
                WHERE NID = 1;
COMMIT;
--(7) 글 삭제하기 (MID로 삭제하기)
DELETE FROM NOTICE WHERE NID =3;

 SELECT * FROM NOTICE;

