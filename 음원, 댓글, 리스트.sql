DELETE
  FROM MUSIC_COMMENT;



-- MUSICLIST ����5�� == �ѱ� ������ �� �뷡���� �ȴ�� VARCHAR2 �� �÷����ҵ�
INSERT 
  INTO MUSIC_LIST 
(
      MUSIC_NO
    , MUSIC_TITLE
    , MUSIC_SINGER
    , MUSIC_COUNT
    , MUSIC_GENRE
    , MUSIC_LIKE
    , MUSIC_DISLIKE
    , LYRICS
    , MUSIC_PUBLIC_STATUS
) 
VALUES 
(
      1
    , 'WAY_BACK_HOME'
    , 'SHAWN'
    , 32
    , 'HIP'
    , 20
    , 1
    , '�ƹ�����'
    , 'Y'
);

INSERT 
  INTO MUSIC_LIST 
(
      MUSIC_NO
    , MUSIC_TITLE
    , MUSIC_SINGER
    , MUSIC_COUNT
    , MUSIC_GENRE
    , MUSIC_LIKE
    , MUSIC_DISLIKE
    , LYRICS
    , MUSIC_PUBLIC_STATUS
) 
VALUES 
(
      2
    , 'SOLO'
    , 'JENNY'
    , 19
    , 'POP'
    , 6
    , 0
    , '���¼ַ�'
    , 'Y'
);

INSERT 
  INTO MUSIC_LIST 
(
      MUSIC_NO
    , MUSIC_TITLE
    , MUSIC_SINGER
    , MUSIC_COUNT
    , MUSIC_GENRE
    , MUSIC_LIKE
    , MUSIC_DISLIKE
    , LYRICS
    , MUSIC_PUBLIC_STATUS
) 
VALUES 
(
      3
    , 'POWER'
    , 'G-DRAGON'
    , 30
    , 'RAP'
    , 7
    , 4
    , '����'
    , 'Y'
);

INSERT 
  INTO MUSIC_LIST 
(
      MUSIC_NO
    , MUSIC_TITLE
    , MUSIC_SINGER
    , MUSIC_COUNT
    , MUSIC_GENRE
    , MUSIC_LIKE
    , MUSIC_DISLIKE
    , LYRICS
    , MUSIC_PUBLIC_STATUS
) 
VALUES 
(
      4
    , '�״��»�ġ'
    , '�ѵ���'
    , 40
    , '�߶��'
    , 35
    , 5
    , '��ġ�θ�����'
    , 'Y'
);

INSERT 
  INTO MUSIC_LIST 
(
      MUSIC_NO
    , MUSIC_TITLE
    , MUSIC_SINGER
    , MUSIC_COUNT
    , MUSIC_GENRE
    , MUSIC_LIKE
    , MUSIC_DISLIKE
    , LYRICS
    , MUSIC_PUBLIC_STATUS
) 
VALUES 
(
      5
    , '��������N'
    , 'NULL'
    , 123
    , 'NULL'
    , 123
    , 30
    , '�����ұ�'
    , 'N'
);

-- ���� ���
INSERT 
  INTO MUSIC_COMMENT 
    (
        MUSIC_COMMENT_NO
      , MUSIC_NO, MEMBER_NO
      , COMMENT_CONTENT
      , COMMENT_LIKE
      , COMMENT_DISLIKE
      , COMMENT_DATE
    ) 
VALUES 
(
      1
    , 1 --jsp ���� ? �� �ΰ� ������ȣ��������
    , 101
    , '�̰Ը³� �ɶ�'
    , 4
    , 1
    , SYSDATE
);

INSERT 
  INTO MUSIC_COMMENT 
    (
        MUSIC_COMMENT_NO
      , MUSIC_NO, MEMBER_NO
      , COMMENT_CONTENT
      , COMMENT_LIKE
      , COMMENT_DISLIKE
      , COMMENT_DATE
    ) 
VALUES 
(
      2
    , 2 --jsp ���� ? �� �ΰ� ������ȣ��������
    , 102
    , '�ߺ��̳����'
    , 8
    , 3
    , SYSDATE
);

INSERT 
  INTO MUSIC_COMMENT 
    (
        MUSIC_COMMENT_NO
      , MUSIC_NO, MEMBER_NO
      , COMMENT_CONTENT
      , COMMENT_LIKE
      , COMMENT_DISLIKE
      , COMMENT_DATE
    ) 
VALUES 
(
      3
    , 3 --jsp ���� ? �� �ΰ� ������ȣ��������
    , 103
    , '�߾ȵ�����'
    , 13
    , 5
    , SYSDATE
);

INSERT 
  INTO MUSIC_COMMENT 
    (
        MUSIC_COMMENT_NO
      , MUSIC_NO, MEMBER_NO
      , COMMENT_CONTENT
      , COMMENT_LIKE
      , COMMENT_DISLIKE
      , COMMENT_DATE
    ) 
VALUES 
(
      4
    , 4 --jsp ���� ? �� �ΰ� ������ȣ��������
    , 104
    , '�����̾߿�'
    , 11
    , 3
    , SYSDATE
);

INSERT 
  INTO MUSIC_COMMENT 
    (
        MUSIC_COMMENT_NO
      , MUSIC_NO, MEMBER_NO
      , COMMENT_CONTENT
      , COMMENT_LIKE
      , COMMENT_DISLIKE
      , COMMENT_DATE
    ) 
VALUES 
(
      5
    , 5 --jsp ���� ? �� �ΰ� ������ȣ��������
    , 105
    , '��ġ����̴¹�'
    , 19
    , 7
    , SYSDATE
);

-- ���� ����
INSERT
  INTO MUSIC_FILE 
(
      MUSIC_NO
    , MUSIC_FILE_ORIGIN_NAME
    , MUSIC_FILE_EDIT_NAME
    , MUSIC_FILE_STORE_PATH
    , MUSIC_IMAGE_ORIGIN_NAME
    , MUSIC_IMAGE_EDIT_NAME
    , MUSIC_IMAGE_PATH
) 
VALUES 
(
      1 -- '�����ҷ����� ����.'
    , '�������뷡1'
    , '�����ĳ뷡1'
    , '����������1'
    , '���û��������̸�1'
    , '���û��������̸�1'
    , '�����̹������ϰ��1'
);

INSERT
  INTO MUSIC_FILE 
(
      MUSIC_NO
    , MUSIC_FILE_ORIGIN_NAME
    , MUSIC_FILE_EDIT_NAME
    , MUSIC_FILE_STORE_PATH
    , MUSIC_IMAGE_ORIGIN_NAME
    , MUSIC_IMAGE_EDIT_NAME
    , MUSIC_IMAGE_PATH
) 
VALUES 
(
      2 -- '�����ҷ����� ����.'
    , '�������뷡2'
    , '�����ĳ뷡2'
    , '����������2'
    , '���û��������̸�2'
    , '���û��������̸�2'
    , '�����̹������ϰ��2'
);

INSERT
  INTO MUSIC_FILE 
(
      MUSIC_NO
    , MUSIC_FILE_ORIGIN_NAME
    , MUSIC_FILE_EDIT_NAME
    , MUSIC_FILE_STORE_PATH
    , MUSIC_IMAGE_ORIGIN_NAME
    , MUSIC_IMAGE_EDIT_NAME
    , MUSIC_IMAGE_PATH
) 
VALUES 
(
      3 -- '�����ҷ����� ����.'
    , '�������뷡3'
    , '�����ĳ뷡3'
    , '����������3'
    , '���û��������̸�3'
    , '���û��������̸�3'
    , '�����̹������ϰ��3'
);

INSERT
  INTO MUSIC_FILE 
(
      MUSIC_NO
    , MUSIC_FILE_ORIGIN_NAME
    , MUSIC_FILE_EDIT_NAME
    , MUSIC_FILE_STORE_PATH
    , MUSIC_IMAGE_ORIGIN_NAME
    , MUSIC_IMAGE_EDIT_NAME
    , MUSIC_IMAGE_PATH
) 
VALUES 
(
      4 -- '�����ҷ����� ����.'
    , '�������뷡4'
    , '�����ĳ뷡4'
    , '����������4'
    , '���û��������̸�4'
    , '���û��������̸�4'
    , '�����̹������ϰ��4'
);

INSERT
  INTO MUSIC_FILE 
(
      MUSIC_NO
    , MUSIC_FILE_ORIGIN_NAME
    , MUSIC_FILE_EDIT_NAME
    , MUSIC_FILE_STORE_PATH
    , MUSIC_IMAGE_ORIGIN_NAME
    , MUSIC_IMAGE_EDIT_NAME
    , MUSIC_IMAGE_PATH
) 
VALUES 
(
      5 -- '�����ҷ����� ����.'
    , '�������뷡5'
    , '�����ĳ뷡5'
    , '����������5'
    , '���û��������̸�5'
    , '���û��������̸�5'
    , '�����̹������ϰ��5'
);
