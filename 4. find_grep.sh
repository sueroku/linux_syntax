# find(파일찾기) 는 파일명으로 검색 |(왼쪽의 출력을 오른쪽의 입력으로) grep(문자열검색) 문자열 찾기
# find를 통해 특정 파일을 찾고, 그 파일안에서만 grep 문자열 검색
# 파일 또는 디렉토리 검색 : find
# 문자열 검색 : grep -rni "hello"
ps -ef | grep "nginx"

find . -name "*.sh"  # 현재 위치에서 .sh로 끝나는 파일

# 파일 검색 후 해당 내용에서 원하는 문자열 찾기
# xargs : 넘겨온 파일 목록의 파일 내용을 한줄 한줄 읽겠다라는 의미
find . -name "*.sh" | xargs grep -n "hello"

# exec 옵션을 통한 find 와 grep
find . -name "*.sh" -exec grep -n "hello" {} \; # 파일명이 잘린다