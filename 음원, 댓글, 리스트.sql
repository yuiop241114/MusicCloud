DELETE
  FROM MUSIC_COMMENT;



-- MUSICLIST 샘플5개 == 한글 제목이 긴 노래들이 안담김 VARCHAR2 더 늘려야할듯
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
    , '아무가사'
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
    , '내는솔로'
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
    , '빠와'
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
    , '그대라는사치'
    , '한동근'
    , 40
    , '발라드'
    , 35
    , 5
    , '사치부리지마'
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
    , '공개여부N'
    , 'NULL'
    , 123
    , 'NULL'
    , 123
    , 30
    , '가능할까'
    , 'N'
);

-- 음원 댓글
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
    , 1 --jsp 에서 ? 로 두고 음원번호가져오기
    , 101
    , '이게맞나 될라나'
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
    , 2 --jsp 에서 ? 로 두고 음원번호가져오기
    , 102
    , '잘보이나요오'
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
    , 3 --jsp 에서 ? 로 두고 음원번호가져오기
    , 103
    , '잘안들려요오'
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
    , 4 --jsp 에서 ? 로 두고 음원번호가져오기
    , 104
    , '샘플이야요'
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
    , 5 --jsp 에서 ? 로 두고 음원번호가져오기
    , 105
    , '김치찌개끓이는법'
    , 19
    , 7
    , SYSDATE
);

-- 음원 파일
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
      1 -- '음원불러오는 숫자.'
    , '수정전노래1'
    , '수정후노래1'
    , '파일저장경로1'
    , '예시사진원본이름1'
    , '예시사진수정이름1'
    , '음원이미지파일경로1'
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
      2 -- '음원불러오는 숫자.'
    , '수정전노래2'
    , '수정후노래2'
    , '파일저장경로2'
    , '예시사진원본이름2'
    , '예시사진수정이름2'
    , '음원이미지파일경로2'
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
      3 -- '음원불러오는 숫자.'
    , '수정전노래3'
    , '수정후노래3'
    , '파일저장경로3'
    , '예시사진원본이름3'
    , '예시사진수정이름3'
    , '음원이미지파일경로3'
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
      4 -- '음원불러오는 숫자.'
    , '수정전노래4'
    , '수정후노래4'
    , '파일저장경로4'
    , '예시사진원본이름4'
    , '예시사진수정이름4'
    , '음원이미지파일경로4'
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
      5 -- '음원불러오는 숫자.'
    , '수정전노래5'
    , '수정후노래5'
    , '파일저장경로5'
    , '예시사진원본이름5'
    , '예시사진수정이름5'
    , '음원이미지파일경로5'
);
