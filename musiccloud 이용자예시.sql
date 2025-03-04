DROP SEQUENCE SEQ_LNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_MUSICNO;
DROP SEQUENCE SEQ_MUSIC_COMMENT_NO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_BOARD_COMMENT_NO;
DROP SEQUENCE SEQ_PLAYLIST_NO;

--������ȣ ������
CREATE SEQUENCE SEQ_LNO
NOCACHE;
--ȸ����ȣ ������
CREATE SEQUENCE SEQ_MNO
NOCACHE;
--������ȣ ������
CREATE SEQUENCE SEQ_MUSICNO
NOCACHE;
--������� ������
CREATE SEQUENCE SEQ_MUSIC_COMMENT_NO
NOCACHE;
--�Խñ� ��ȣ ������ 
CREATE SEQUENCE SEQ_BNO
NOCACHE;
--�Խñ� ��� ��ȣ ������
CREATE SEQUENCE SEQ_BOARD_COMMENT_NO
NOCACHE;
--�÷��� ����Ʈ ��ȣ ������
CREATE SEQUENCE SEQ_PLAYLIST_NO
NOCACHE;


DELETE FROM LOCATION;
DELETE FROM MEMBER;
--���õ�����
--LOCATION ���̺�
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '����� ������');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '����� ���ϱ�');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '����� ������');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '����� ���ı�');
INSERT
  INTO LOCATION 
     ( LOCATION_NO, LOCATION_NAME)
VALUES
     ( SEQ_LNO.NEXTVAL, '����� ������');
     
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
     , '������'
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
     , '����1'
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
     , '����2'
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
     , '����3'
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
     , '����4'
     , 'dddd@naver.com'
     , 'F'
     , 30
     );
COMMIT;