# script 파일 생성
touch myscript.sh
# nano myscript.sh



###실습###
# 시작할때 script start 문구 출력
# 홈디렉토리에서 mydir4 생성
# mydir4에서 file1.txt, file2.txt 파일 생성
# file1.txt에서 “hello file1” 입력 / file2.txt ~~~~~~
# fiel1   file_backup.txt 백업만들기
# file2   file2_rename.txt 이름변경
# 끝날때 script end 문구 출력
echo “script start”
cd
mkdir mydir4
cd mydir4
touch file1.txt
touch file2.txt
echo “hello file1” > file1.txt
echo “hello file2” > file2.txt
cp file1.txt file1_backup.txt
mv file2.txt file2_rename.txt
# ls -al
echo “script end”



# if문
if [ 1 -gt 2 ]; then # 조건문 안에 띄어쓰기
    echo "hello world1"
else
    echo "hello world2"
fi

# if문과 변수활용, 파일(-f)/디렉토리(-d) 존재여부 확인
file_name="second_file.txt" # = 앞뒤로 띄어쓰기
if [ -f "$file_name" ]; then # "$변수"는 변수 불러온다.
    echo "$file_name exists"
else
    echo "$file_name does not exists"
fi



# for문 기본
for a in {1..100}  # 1부터 100까지 a에 담는다
do
    echo "hello world$a"
done



###if문 실습### : test4.sh
# -echo start 출력
# -만약에 test_dir이 현재폴더에 있으면 해당 폴더로 이동
# -없으면 해당 폴더 생성 후 이동
# -echo end 출력
echo “start”
if [ -d test_dir ]; then
    cd test_dir
    echo "exist"
else
 	mkdir test_dir
    cd test_dir
fi

# 강사님코드

if [ -f test4.txt ]; then
    echo "test4.txt exists"
else
    touch test4.txt
fi

for a in {1..100}
do
    echo "hello world$a" >> test4.txt
done

echo "end" 
# test4.txt 없으면 생성
# 해당 파일에 hello world1 ~100 까지 입력
# test_dir 안에 test4.txt 파일이 있어야하고 그 안에 문자열 입력
# 내코드
if [ -f "test4.txt" ]; then
    cat /dev/null > test4.txt # 파일은 남기고 내용 삭제
    for a in {1..100}
    do
        echo "hello world$a" >> test4.txt
    done
else
    touch test4.txt
    for a in {1..100}
    do
        echo "hello world$a" >> test4.txt
    done
fi



# for문 활용한 count 세기
count=0
for a in {1..100}
do
    ((count++))
done
echo "count is $count"

# for문 활용한 모든 file과 directory 목록 출력하기
for a in *
do
    echo "a is $a"
done



### for문을 활용한 directory와 그외의(else) 파일의 개수 세기 실습 ###
# 특정 디렉토리 안에 file은 몇갠지 directory는 몇개인지 출력하는 프로그램
# 내 코드
dir_count=0
file_count=0

for a in *
do 
    if [ -d "$a" ]; then
        ((dir_count++))
    else
        ((file_count++))
    fi
done
echo "dir_count is $dir_count"
echo "file_count is $file_count"

# 강사님 코드
dir_count=0
others=0

for a in *
do 
    if [ -d "$a" ]; then
        ((dir_count++))
    else
        ((others++))
    fi
done
echo "dir_count is $dir_count"
echo "others is $others"