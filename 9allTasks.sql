--1)������� ������ �������� �� ��������� ������ �� ������������� ������
select 
spisok_postavki.cena,
spisok_postavki.kol_vo,
spisok_postavki.srok_godnosti,
postavki.nomer_doc,
postavki.data,
tovar.tovar
from spisok_postavki,postavki,tovar,spisok_tovarov
where spisok_postavki.id_postavki=postavki.id_postavki
and spisok_tovarov.id_tovar=tovar.id_tovar
and postavki.data='2022-05-28'
and tovar.tovar='�����'
--2)������� ���� ������ �������� � ���������� � �������� �� ���������� ����������, ����������� ����� ����� �� ����� ��� ���� ����������
select
spisok_postavki.cena,
spisok_postavki.kol_vo,
spisok_postavki.srok_godnosti,
postavki.nomer_doc,
postavki.data,
postavki.comments,
postavshik.full_name
from spisok_postavki,postavki,postavshik
where spisok_postavki.id_postavki=postavki.id_postavki
and postavki.id_postavshik=postavshik.id_tip_postavshika
and postavshik.full_name='������ ����' --or postavshik.id_postavshik=1
--3)������ ��������,���������� � ������,�� �������� �� ��������� �����
select
spisok_postavki.cena,
spisok_postavki.kol_vo,
spisok_postavki.srok_godnosti,
tovar.tovar,
tovar.comments
from spisok_postavki,tovar,spisok_tovarov
where spisok_tovarov.id_spisok_postavki=spisok_postavki.id_spisok_postavki
and spisok_tovarov.id_tovar=tovar.id_tovar
and tovar.tovar='��������'
--4)meaning of the task the same as in 1)
--5)���������� � ������ ���������� ������� �� ��������� ������ � �� ������������ ������ 
select
spisok_tovarov.cena,
spisok_tovarov.kol_vo,
zakaz.data,
zakaz.comments,
klient.full_name,
tovar.tovar
from spisok_tovarov,zakaz,klient,tovar
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.id_klient=klient.id_klient
and tovar.tovar='�����'
and klient.id_klient=1 --or klient.full_name
and zakaz.data='2023-01-22'
--6)��������� ���� ������������� ������ �� ���� ��� ��������
update spisok_tovarov
set cena='10'
from tovar
where spisok_tovarov.id_tovar=tovar.id_tovar
and tovar.id_tovar=3 --or tovar.tovar='name_tovar'
--7)������ ������ �� ������� �������� ������
select
postavki.nomer_doc,
postavki.comments,
postavki.data as data_postavki,
oplata.summa,
oplata.data
from postavki,oplata
where oplata.id_postavki=postavki.id_postavki
and postavki.data between '2022-05-01' and '2022-07-30'
--8)���-� � �������� � ������ ������� �� ��������� ������ �� ���� ������� (��� ����� �������)
select
postavki.nomer_doc,
postavki.comments,
postavki.data as data_postavki,
oplata.summa,
oplata.data as data_oplati,
zakaz.data,
klient.full_name
from postavki,oplata,zakaz,spisok_tovarov,spisok_postavki,klient
where oplata.id_postavki=postavki.id_postavki
and spisok_postavki.id_postavki=postavki.id_postavki
and spisok_tovarov.id_spisok_postavki=spisok_postavki.id_spisok_postavki
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.id_klient=klient.id_klient
and oplata.data = '2023-01-22'
and klient.id_klient = 3 --or klient.full_name='full_name'

--second part
--1)������ ������ � ������ �������� � ����,��� ��� �������� �� ������������ ������
select 
zakaz.data as data_zakaza,
zakaz.comments,
klient.full_name,
tovar.tovar
from zakaz,klient,tovar,spisok_tovarov
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.id_klient=klient.id_klient
and zakaz.data between '2023-01-01' and '2023-12-30'
--and tovar.tovar='tovarName' or tovar.id_tovar=1 � ���� �� �����-�� ���������,�� ���� ��������,������ ������ ������� ������ ���� �� �������
--2)������ ������� ������������� ������� (�� ������������ ������)
select 
klient.full_name,
zakaz.data,
tovar.tovar
from zakaz,klient,tovar,spisok_tovarov
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.id_klient=klient.id_klient
and klient.id_klient=4 --or klient.full_name='clientsName'
--and zakaz.data='some_date' � ���� ������ ����� ��� ���� � ���� � ��� �� ����,������� ���� � ����� ������ ���� ������ �� ���������
--3)������ ������� � ����������� �� ������������ ������
select 
spisok_tovarov.cena,
spisok_tovarov.kol_vo,
tovar.tovar,
zakaz.data 
from spisok_tovarov,tovar,zakaz
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.data between '2023-01-01' and '2023-03-30'
--4)����� ���������� ������� �� ������������� ����� � ���������� ������
select 
tovar.tovar,
klient.full_name,
zakaz.data
from tovar,klient,zakaz,spisok_tovarov
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.id_klient=klient.id_klient
and tovar.tovar='������' --or tovar.id_tovar=tovarID
and klient.full_name='Baktybekova Shirin' --or by klient's id
and zakaz.data='2023-03-06'
--5)���� � ���� ����� �� ������, ��� �� �����-1 �����-6
--6)����� �������� ������� � �� ����,����� ���� ���������� ��������� ���
select 
tovar.tovar,
price_list.cena,
price_list.data
from price_list,tovar
where price_list.id_tovar=tovar.id_tovar
--7)����� ������ ������,���� ������ ������ - �� �������� ������
select
oplata.summa,
oplata.data,
zakaz.data as data_zakaza
from oplata,zakaz
where oplata.id_zakaz=zakaz.id_zakaz
and zakaz.data between '2023-01-01' and '2023-02-25'
--8)�� �� ����� ��� � � ���������� ������, ������ ��� ��� � ������� ��� ������ ������
select 
oplata.data,
zakaz.data as data_zakaza,
vid_oplaty.vid_oplaty
from oplata,zakaz,vid_oplaty
where oplata.id_zakaz=zakaz.id_zakaz
and oplata.id_vid_oplaty=vid_oplaty.id_vid_oplaty
and zakaz.data between '2023-01-01' and '2023-02-25'
--9)���������� � ������,� ������ � ���������� ����������
select zakaz.data,
zakaz.comments,
sotrudnik.full_name,
doljnost.doljnost
from zakaz,sotrudnik,doljnost
where zakaz.id_sotrudnik=sotrudnik.id_sotrudnik
and sotrudnik.id_doljnost=doljnost.id_doljnost
and sotrudnik.id_sotrudnik=3 --or sotrudnik.full_name='fullName'
--10)������� ������� ������ �������� ������ ���������,� ��������� ����� � ���������
select
count(zakaz.id_zakaz) as count_of_zakaz,sotrudnik.full_name,doljnost.doljnost
from sotrudnik,doljnost,zakaz
where zakaz.id_sotrudnik=sotrudnik.id_sotrudnik
and sotrudnik.id_doljnost=doljnost.id_doljnost
group by sotrudnik.full_name,doljnost.doljnost
--11)������ ������ � ��������� ������ �� ��������� �������
select 
zakaz.data,
zakaz.comments,
rayon.rayon
from zakaz,klient,rayon
where zakaz.id_klient=klient.id_klient
and klient.id_rayon=rayon.id_rayon
and zakaz.data between '2023-03-01' and '2023-05-30'
--12)������� ������� ���� �������� � ������� ������ �� ������������ ������
select
count(zakaz.id_zakaz) as countOfZakaz,rayon.rayon
from zakaz,rayon,klient
where zakaz.id_klient=klient.id_klient
and klient.id_rayon=rayon.id_rayon
and zakaz.data between '2023-01-01' and '2023-03-30'
group by rayon.rayon
--13)�� ������ ������� ��� ������� � ��� �������
select klient.full_name,
kontakty.kontakty
from klient,kontakty
where kontakty.id_klient=klient.id_klient
--14)����� ������� �� ������������ ������ � ��������� ����� ������
select 
zakaz.data,
tip_prodaj.tip_prodaj
from zakaz,tip_prodaj
where zakaz.id_tip_prodaj=tip_prodaj.id_tip_prodaj
and tip_prodaj.tip_prodaj='��������' --or tip.prodaj.id-tip_prodaj=1
and zakaz.data between '2023-01-01' and '2023-02-28'
--15)����� ������� �� ������������ ������ � ��������� ����� ������ (�� �� ����� ��� � 14, ������ ��������� �� ��� ������)
select
zakaz.data,
tip_zakaza.tip_zakaza
from zakaz,tip_zakaza
where zakaz.id_tip_zakaza=tip_zakaza.id_tip_zakaza
and tip_zakaza.tip_zakaza='������� �����' --or tip_zakaza.id-tip_zakaza=1
and zakaz.data between '2023-01-01' and '2023-02-28'