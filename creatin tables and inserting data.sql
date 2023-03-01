create table tip_klienta(
id_tip_klienta int identity primary key,
tip_klienta nvarchar(500))

create table rayon(
id_rayon int identity primary key,
rayon nvarchar(500))

create table tip_kontaktov(
id_tip_kontaktov int identity primary key,
tip_kontaktov nvarchar(500))

create table tip_zakaza(
id_tip_zakaza int identity primary key,
tip_zakaza nvarchar(500)
)

create table tip_prodaj(
id_tip_prodaj int identity primary key,
tip_prodaj nvarchar(500)
)

create table sostavnie(
id_sostavnie int identity primary key,
sostavnie nvarchar(500)
)

create table doljnost(
id_doljnost int identity primary key,
doljnost nvarchar(500)
)

create table tip_tovara(
id_tip_tovara int identity primary key,
tip_tovara nvarchar(500)
)

create table tip_postavshika(
id_tip_postavshika int identity primary key,
tip_postavshika nvarchar(500)
)

create table tip_postavki(
id_tip_postavki int identity primary key,
tip_postavki nvarchar(500)
)

create table klient(
id_klient int identity primary key,
full_name nvarchar(500),
passport nvarchar(500),
login nvarchar(500),
password nvarchar(500),
mesto_raboty nvarchar(500),
skidka nvarchar(500)
)

create table kontakty(
id_kontakty int identity primary key,
kontakty nvarchar(500),
id_klient int foreign key references klient(id_klient),
id_tip_kontaktov int foreign key references tip_kontaktov(id_tip_kontaktov)
)

create table sotrudnik(
id_sotrudnik int identity primary key,
full_name nvarchar(500),
id_doljnost int foreign key references doljnost(id_doljnost)
)

create table tovar(
id_tovar int identity primary key,
tovar nvarchar(500),
comments nvarchar(500),
id_tip_tovara int foreign key references tip_tovara(id_tip_tovara)
)

create table postavshik(
id_postavshik int identity primary key,
full_name nvarchar(500),
nazvanie nvarchar(500),
id_tip_postavshika int foreign key references tip_postavshika(id_tip_postavshika)
)



create table vid_oplaty(
id_vid_oplaty int identity primary key,
vid_oplaty nvarchar(500)
)

create table postavki(
id_postavki int identity primary key,
nomer_doc nvarchar(500),
data smalldatetime,
comments nvarchar(500),
id_postavshik int foreign key references postavshik(id_postavshik),
id_tip_postavki int foreign key references tip_postavki(id_tip_postavki)
)

create table price_list(
id_price_list int identity primary key,
cena nvarchar(500),
data smalldatetime,
comments nvarchar(500),
id_tovar int foreign key references tovar(id_tovar)
)

create table spisok_postavki(
id_spisok_postavki int identity primary key,
cena nvarchar(500),
kol_vo nvarchar(500),
srok_godnosti smalldatetime,
id_postavki int foreign key references postavki(id_postavki)
)

create table zakaz(
id_zakaz int identity primary key,
data smalldatetime,
nomer_doc nvarchar(500),
comments nvarchar(500),
id_klient int foreign key references klient(id_klient),
id_tip_zakaza int foreign key references tip_zakaza(id_tip_zakaza),
id_sostavnie int foreign key references sostavnie(id_sostavnie),
id_tip_prodaj int foreign key references tip_prodaj(id_tip_prodaj),
id_sotrudnik int foreign key references sotrudnik(id_sotrudnik)
)

create table oplata(
id_oplata int identity primary key,
data smalldatetime,
summa nvarchar(500),
comments nvarchar(500),
id_zakaz int foreign key references zakaz(id_zakaz),
id_vid_oplaty int foreign key references vid_oplaty(id_vid_oplaty),
id_postavki int foreign key references postavki(id_postavki)
)

create table spisok_tovarov(
id_spisok_tovarov int identity primary key,
cena nvarchar(500),
kol_vo nvarchar(500),
id_zakaz int foreign key references zakaz(id_zakaz),
id_tovar int foreign key references tovar(id_tovar),
id_spisok_postavki int foreign key references spisok_postavki(id_spisok_postavki)
)





















inserting all data



insert into doljnost values('бухгалтер')
insert into doljnost values('менеджер')
insert into doljnost values('маркетолог')

insert into klient values ('Baktybekova Nazima','0123456789','nzima','0102','someAddress1','no skidka')
insert into klient values ('Asanov Bayastan','9874563210','byas','2036','someAddress2','no skidka')
insert into klient values ('Muslimov Erik','0789641235','erik','7896','someAddress3','no skidka')
insert into klient values ('Baktybekova Shirin','0782396541','didi','0404','someAddress4','no skidka')
insert into klient values ('Baktybekov Nurik','9382716540','kozunek','1212','someAddress5','no skidka')

insert into rayon values('Кеминский район');
insert into rayon values('Ноокатский район');
insert into rayon values('Манасский район');
insert into rayon values('Тюпский район');
insert into rayon values('Ноокенский район');
insert into rayon values('Кадамжайский район');
insert into rayon values('Кочкорский район');

insert into sostavnie values('sostavnoi1')
insert into sostavnie values('sostavnoi2')
insert into sostavnie values('sostavnoi3')
insert into sostavnie values('sostavnoi4')

insert into tip_klienta values('Физические лица')
insert into tip_klienta values('Юридические лица')

insert into tip_kontaktov values('e-mail')
insert into tip_kontaktov values('telegram')
insert into tip_kontaktov values('whatsapp')
insert into tip_kontaktov values('instagram')

insert into tip_postavki values('DAF')
insert into tip_postavki values('DDP')
insert into tip_postavki values('DDU')
insert into tip_postavki values('DES')
insert into tip_postavki values('DEQ')
insert into tip_postavki values('EXW')
insert into tip_postavki values('CIP')
insert into tip_postavki values('CIF')
insert into tip_postavki values('CPT')
insert into tip_postavki values('FAS')
insert into tip_postavki values('FOB')
insert into tip_postavki values('FSA')

insert into tip_postavshika values('производители')
insert into tip_postavshika values('дистрибьюторы')
insert into tip_postavshika values('импортеры')

insert into tip_prodaj values('активные')
insert into tip_prodaj values('пассивные')
insert into tip_prodaj values('традичионные')
insert into tip_prodaj values('безличные')

insert into tip_tovara values('оптом')
insert into tip_tovara values('в розницу')
insert into tip_tovara values('и в оптом, и в розницу')

insert into tip_zakaza values('обычный заказ')
insert into tip_zakaza values('заказ наколпения')
insert into tip_zakaza values('срочный заказ')
insert into tip_zakaza values('заказ через менеджера')

insert into vid_oplaty values('наличная')
insert into vid_oplaty values('безналичная')

insert into kontakty values('0772918579',1,2)
insert into kontakty values('0778968745',2,3)
insert into kontakty values('eee@gmail.com',3,1)
insert into kontakty values('0778033429',4,3)
insert into kontakty values('kozu_12',5,4)

insert into postavshik values('Петров Петр','neZnayu1',1)
insert into postavshik values('Сидоров Сидор','neZnayu2',2)
insert into postavshik values('Алексеева Лиза','neZnayu3',3)

insert into sotrudnik values('Кабилова Ойдина',1)
insert into sotrudnik values('Кабилов Музаффар',2)
insert into sotrudnik values('Кабилова Дилноза',3)

insert into tovar values('обувь','noComments',1)
insert into tovar values('джинсы','noComments',1)
insert into tovar values('белье','noComments',2)
insert into tovar values('кофты','noComments',2)
insert into tovar values('носки','noComments',3)
insert into tovar values('перчатки','noComments',3)

insert into postavki values('0123','2022-05-28','noComments',1,1)
insert into postavki values('4687','2022-06-01','noComments',2,2)
insert into postavki values('7901','2022-07-09','noComments',3,3)
insert into postavki values('0357','2022-05-05','noComments',1,4)
insert into postavki values('0887','2022-08-26','noComments',2,5)
insert into postavki values('7862','2022-09-15','noComments',3,6)

insert into price_list values('1000','2023-02-25','noComments',1)
insert into price_list values('2000','2023-02-25','noComments',2)
insert into price_list values('200','2023-02-25','noComments',3)
insert into price_list values('1500','2023-02-25','noComments',4)
insert into price_list values('150','2023-02-25','noComments',5)
insert into price_list values('80','2023-02-25','noComments',6)


insert into zakaz values('2023-01-22','12365','noComments',1,1,1,1,1)
insert into zakaz values('2023-02-22','78964','noComments',2,2,2,2,2)
insert into zakaz values('2023-01-05','36987','noComments',3,3,3,1,3)
insert into zakaz values('2023-03-06','79164','noComments',4,4,2,2,1)
insert into zakaz values('2023-04-11','10635','noComments',5,1,3,1,3)

insert into oplata values('2023-01-22','5000','noComments',1,1,1)
insert into oplata values('2023-02-22','10000','noComments',2,2,2)
insert into oplata values('2023-01-05','2000','noComments',3,1,3)
insert into oplata values('2023-03-06','12000','noComments',4,2,4)
insert into oplata values('2023-04-11','7000','noComments',5,1,5)

insert into spisok_postavki values('10000','10','2026-12-30',1)
insert into spisok_postavki values('20000','15','2026-12-30',2)
insert into spisok_postavki values('3000','5','2026-12-30',3)
insert into spisok_postavki values('7500','8','2026-12-30',4)
insert into spisok_postavki values('9000','9','2026-12-30',5)
insert into spisok_postavki values('2500','2','2026-12-30',6)




insert into spisok_tovarov values('5000','3',1,4,6)
insert into spisok_tovarov values('7500','8',2,5,4)
insert into spisok_tovarov values('75000','50',3,1,1)
insert into spisok_tovarov values('50000','25',4,2,2)
insert into spisok_tovarov values('8000','6',5,3,3)
insert into spisok_tovarov values('900','2',4,6,5)



забыла добавить два поля
alter table klient
add id_rayon int foreign key references rayon(id_rayon)
alter table klient
add id_kontakty int foreign key references kontakty(id_kontakty)