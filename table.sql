create database quest_in_jeju;
use quest_in_jeju;


#�� Table
drop table cutomer;
create table customer(
	customer_phone varchar2(11) not null,
	customer_addr_front varchar2(40) not null,
	customer_addr_detail varchar2(45) not null,
);
alter table customer add constraint customer_phone_pk primary key (customer_phone);


#����û Table
drop table customer_apply;
create table customer_apply(
	serialNo varchar2(8) not null,
	customer_phone varchar2(11) not null,
	customer_addr_front varchar2(40) not null,
	customer_addr_detail varchar2(45) not null,
	bag_num number not null,
	trash_type number not null,
	wanted_time varchar2(50) not null,
	last_time number not null,
	price number not null,
	card_num varchar2(20) not null,
	helperID varchar2(25),
	customer_apply_day date not null 
); 
alter table customer_apply add constraint customer_apply_pk primary key (serialNo);
alter table customer_apply add constraint customer_apply_customer_phone_fk foreign key references customer (customer_phone);
alter table customer_apply add constraint customer_apply_helperID_fk foreign key references helper (helperID);

drop sequence customer_apply_seq;
create sequence customer_apply_seq start with 1 increment by 1;


#���� Table
drop table helper;
create table helper(
	helperID varchar2(25),
	helper_photo_ofn varchar2(100) not null,
	helper_photo_fsn varchar2(100) not null,
	helper_phone varchar2(11) not null,
	helper_name varchar2(25) not null,
	sex varchar2(3) not null,
	bank_name varchar2(18) not null,
	account varchar2(20) not null,
	account_holder varchar2(25) not null,
	wish_addr_front1 varchar2(40) not null,
	wish_addr_detail1 varchar2(45) not null,
	wish_addr_front2 varchar2(40),
	wish_addr_detail2 varchar2(45),
	wish_addr_front3 varchar2(40),
	wish_addr_detail3 varchar2(45),
	want_to_say varchar2(300)
);
alter table helper add constraint helper_id_pk primary key (helperID);


#���� ���� Table
drop table matching;
create table matching(
	serialNo varchar2(8) not null,
	helperID varchar2(25),
	suggestion number(1) not null check (test in (0,1)),
	acceptance number(1) not null check (test in (0,1))
);
alter table matching add constraint matching_pk primary key (serialNo, helperID );
alter table matching add constraint matching_serialNo_fk foreign key references customer_apply (serialNo);
alter table matching add constraint matching_helperID_fk foreign key references helper (helperID);


#�ı� Table
drop table review;
create table review(
	serialNo int not null,	
	helperID varchar2(25) not null,
	review_title varchar2(60) not null, 
	rating number(5,1) not null, 
	clean_place_addr_front varchar2(95),
	review_content varchar2(900), 
	review_day date not null 
);
#review_pwd varchar2(12) not null,
alter table review add constraint review_pk primary key (serialNo);
alter table review add constraint review_matching_fk foreign key (serialNo, helperID ) references matching ((serialNo, helperID ));

insert into review values (serialNo.nextval,'minsu1234','test title','helperPW',3.4,'jeju','nice to meet you',to_date(sysdate,'yyyy-mm-dd'));

#���� Table
drop table certify;
create table certify(
	serialNo varchar2(8) not null, 
	helperID varchar2(25) not null, 
	details varchar2(300) not null,
	housePlace varchar2(80) not null,
	certify_photo_ofn varchar2(100) not null,
	certify_photo_fsn varchar2(100) not null,
	certify_day date not null 
);
alter table review add constraint certify_pk primary key (serialNo);
alter table review add constraint review_matching_fk foreign key (serialNo, helperID ) references matching ((serialNo, helperID ));




#���� Table
drop table map;
create table map(
	mapNo number not null,
	map_addr_front varchar2(80) not null,
	map_addr_detail varchar2(80)
);
alter table renting add constraint map_no_pk  primary key ( mapNo);

drop sequence map_no_seq;
create sequence map_no_seq start with 1 increment by 1 maxvalue 10000 minvalue 1 nocycle;


insert into map values (map_no_seq .NEXTVAL,'�̵��̵� 1955-4','�Ѹ������� ���� Ž����Ʈ �α�(�̵��̵� 1955-4�α�)');
insert into map values (map_no_seq .NEXTVAL,'�ż���9�� 2-2','�Ѹ����������� �¸���ɾ� �α�(����������)');
insert into map values (map_no_seq .NEXTVAL,'�ż����� 66 ','�ż����� 66 (���Ϸ� ����(�ż����� ��������)');
insert into map values (map_no_seq .NEXTVAL,'����2�� 27','����2�� 27(�̵�2��950-1���2��A������)');
insert into map values (map_no_seq .NEXTVAL,'������3�� 18-15','������3�� 18-15(������� ������ ���� ����)');
insert into map values (map_no_seq .NEXTVAL,'�̵��̵� 1064','���⸶Ʈ ���� ���λ�');
insert into map values (map_no_seq .NEXTVAL,'�̵��̵� 1993-1','�̵��̵� 1993-1(�����ʵ��б� ���� ������)');
insert into map values (map_no_seq .NEXTVAL,'������2�� 7','������2�� 7(�̵�2�� 1992-7�ҹ漭 ��Ÿ� LPG������ ������)');
insert into map values (map_no_seq .NEXTVAL,'�̵�2�� 1986-5','�̵�2�� 1986-5(21���� ���� ���� ���������� 84�� ��)');
insert into map values (map_no_seq .NEXTVAL,'������ 2�� 49-27','������ 2�� 49-27(Ž�����б� ���� �� Ȳ�ݰ��� ���������� ��)');
insert into map values (map_no_seq .NEXTVAL,'������4�� 33','������4�� 33(�߾ӿ��� ���� ������)');
insert into map values (map_no_seq .NEXTVAL,'�ż��� 16 ','�ż��� 16 (�Ѹ������� ���� �ε���)');
insert into map values (map_no_seq .NEXTVAL,'�ż���2�� 9 ','�ż���2�� 9 (���������� Ÿ�� ������ ����������)');
insert into map values (map_no_seq .NEXTVAL,'�ż���6�� 2-11','�ż���6�� 2-11(�̵����� ���� ������)');
insert into map values (map_no_seq .NEXTVAL,'������6��55-1 ','������6��55-1 (������ ���� ������)');
insert into map values (map_no_seq .NEXTVAL,'������ 6�� 31','������ 6�� 31 �̵������ �α� ���� ��');
