-- -------------------------------------------------
-- 				데이터베이스 초기화 및 생성, 사용
-- -------------------------------------------------
drop database if exists blog_db;

create database blog_db;

use blog_db;

-- -------------------------------------------------
-- 								테이블 생성
-- -------------------------------------------------
create table blog_write(
	write_id int primary key auto_increment,
    write_title varchar(50) not null,
    write_content varchar(500) not null,
    write_date timestamp default now()
);

insert into blog_write values(null, "신나는 금요일!", "오늘은 불나게 코딩을 했다!", default);
insert into blog_write values(null, "신나는 토요일!", "오늘은 술을 마셨다!", default);

select write_id, write_title, write_content, date_format(write_date, "%Y-%m-%d")as write_date from blog_write;

