DROP SEQUENCE SEQ_LNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_MUSICNO;
DROP SEQUENCE SEQ_MUSIC_COMMENT_NO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_BOARD_COMMENT_NO;
DROP SEQUENCE SEQ_PLAYLIST_NO;

--지역번호 시퀀스
CREATE SEQUENCE SEQ_LNO
NOCACHE;
--회원번호 시퀀스
CREATE SEQUENCE SEQ_MNO
NOCACHE;
--음원번호 시퀀스
CREATE SEQUENCE SEQ_MUSICNO
NOCACHE;
--음원댓글 시퀀스
CREATE SEQUENCE SEQ_MUSIC_COMMENT_NO
NOCACHE;
--게시글 번호 시퀀스 
CREATE SEQUENCE SEQ_BNO
NOCACHE;
--게시글 댓글 번호 시퀀스
CREATE SEQUENCE SEQ_BOARD_COMMENT_NO
NOCACHE;
--플레이 리스트 번호 시퀀스
CREATE SEQUENCE SEQ_PLAYLIST_NO
NOCACHE;


DELETE FROM LOCATION;
DELETE FROM MEMBER;
--샘플데이터
--LOCATION 테이블
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '서울시 강남구');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '서울시 강북구');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '서울시 강동구');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '서울시 송파구');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '서울시 강서구');
     
INSERT 
  INTO MEMBER 
     (
       MEMBER_NO
     , LOCATION_NO
     , MEMBER_ID
     , MEMBER_PWD
     , MEMBER_NAME
     , EMAIL
     , GENDER
     , AGE
     )
     VALUES
     (
       SEQ_MNO.NEXTVAL
     , 1
     , 'admin'
     , 'pwd123'
     , '관리자'
     , 'admin@naver.com'
     , 'M'
     , 99
     );
INSERT 
  INTO MEMBER 
     (
       MEMBER_NO
     , LOCATION_NO
     , MEMBER_ID
     , MEMBER_PWD
     , MEMBER_NAME
     , EMAIL
     , GENDER
     , AGE
     )
     VALUES
     (
       SEQ_MNO.NEXTVAL
     , 2
     , 'user01'
     , 'pass01'
     , '유저1'
     , 'aaa@naver.com'
     , 'M'
     , 22
     );
INSERT 
  INTO MEMBER 
     (
       MEMBER_NO
     , LOCATION_NO
     , MEMBER_ID
     , MEMBER_PWD
     , MEMBER_NAME
     , EMAIL
     , GENDER
     , AGE
     )
     VALUES
     (
       SEQ_MNO.NEXTVAL
     , 3
     , 'user02'
     , 'pass02'
     , '유저2'
     , 'b@naver.com'
     , 'F'
     , 20
     );
INSERT 
  INTO MEMBER 
     (
       MEMBER_NO
     , LOCATION_NO
     , MEMBER_ID
     , MEMBER_PWD
     , MEMBER_NAME
     , EMAIL
     , GENDER
     , AGE
     )
     VALUES
     (
       SEQ_MNO.NEXTVAL
     , 4
     , 'user03'
     , 'pass03'
     , '유저3'
     , 'ccc@naver.com'
     , 'F'
     , 20
     );
INSERT 
  INTO MEMBER 
     (
       MEMBER_NO
     , LOCATION_NO
     , MEMBER_ID
     , MEMBER_PWD
     , MEMBER_NAME
     , EMAIL
     , GENDER
     , AGE
     )
     VALUES
     (
       SEQ_MNO.NEXTVAL
     , 5
     , 'user04'
     , 'pass04'
     , '유저4'
     , 'dddd@naver.com'
     , 'F'
     , 30
     );
COMMIT;