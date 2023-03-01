--1)Выводит список поставки за указанный период по определенному товару
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
and tovar.tovar='обувь'
--2)Выводит весь список поставок и информацию о поставке по указанному поставщику, производить поиск модно по имени или айди поставщика
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
and postavshik.full_name='Петров Петр' --or postavshik.id_postavshik=1
--3)Список поставки,информация о товаре,по которому мы произвели поиск
select
spisok_postavki.cena,
spisok_postavki.kol_vo,
spisok_postavki.srok_godnosti,
tovar.tovar,
tovar.comments
from spisok_postavki,tovar,spisok_tovarov
where spisok_tovarov.id_spisok_postavki=spisok_postavki.id_spisok_postavki
and spisok_tovarov.id_tovar=tovar.id_tovar
and tovar.tovar='перчатки'
--4)meaning of the task the same as in 1)
--5)Информация о заказе указанного клиента за указанный период и по опредленному товару 
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
and tovar.tovar='кофты'
and klient.id_klient=1 --or klient.full_name
and zakaz.data='2023-01-22'
--6)Изменение цены определенного товара по айди или названию
update spisok_tovarov
set cena='10'
from tovar
where spisok_tovarov.id_tovar=tovar.id_tovar
and tovar.id_tovar=3 --or tovar.tovar='name_tovar'
--7)Список оплаты по периоду поставки товара
select
postavki.nomer_doc,
postavki.comments,
postavki.data as data_postavki,
oplata.summa,
oplata.data
from postavki,oplata
where oplata.id_postavki=postavki.id_postavki
and postavki.data between '2022-05-01' and '2022-07-30'
--8)Инф-я о поставке и оплате клиента за указанный период по айди клиента (или имени клиента)
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
--1)список прожад с именем клиентов и того,что они заказали за определенный период
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
--and tovar.tovar='tovarName' or tovar.id_tovar=1 у меня не особо-то получится,тк мало клиентов,каждый клиент покупал только один из товаров
--2)Список заказов определенного клиента (за определенный период)
select 
klient.full_name,
zakaz.data,
tovar.tovar
from zakaz,klient,tovar,spisok_tovarov
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.id_klient=klient.id_klient
and klient.id_klient=4 --or klient.full_name='clientsName'
--and zakaz.data='some_date' у меня клиент купил две вещи в один и тот же день,поэтому если я укажу другой день ничего не выведется
--3)Список заказов с информацией за определенный период
select 
spisok_tovarov.cena,
spisok_tovarov.kol_vo,
tovar.tovar,
zakaz.data 
from spisok_tovarov,tovar,zakaz
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.data between '2023-01-01' and '2023-03-30'
--4)Заказ указанного клиента по определенному числу и указанному товару
select 
tovar.tovar,
klient.full_name,
zakaz.data
from tovar,klient,zakaz,spisok_tovarov
where spisok_tovarov.id_tovar=tovar.id_tovar
and spisok_tovarov.id_zakaz=zakaz.id_zakaz
and zakaz.id_klient=klient.id_klient
and tovar.tovar='джинсы' --or tovar.id_tovar=tovarID
and klient.full_name='Baktybekova Shirin' --or by klient's id
and zakaz.data='2023-03-06'
--5)Точь в точь такой же вопрос, как на часть-1 пункт-6
--6)Вывод название товаров и их цены,также дата последнего изменения цен
select 
tovar.tovar,
price_list.cena,
price_list.data
from price_list,tovar
where price_list.id_tovar=tovar.id_tovar
--7)Сумма оплаты заказа,дата самого заказа - за заданный период
select
oplata.summa,
oplata.data,
zakaz.data as data_zakaza
from oplata,zakaz
where oplata.id_zakaz=zakaz.id_zakaz
and zakaz.data between '2023-01-01' and '2023-02-25'
--8)То же самое что и в предыдущем пункте, только тут еще и выводит тип оплаты заказа
select 
oplata.data,
zakaz.data as data_zakaza,
vid_oplaty.vid_oplaty
from oplata,zakaz,vid_oplaty
where oplata.id_zakaz=zakaz.id_zakaz
and oplata.id_vid_oplaty=vid_oplaty.id_vid_oplaty
and zakaz.data between '2023-01-01' and '2023-02-25'
--9)Информация о заказе,с именем и должностью сотрудника
select zakaz.data,
zakaz.comments,
sotrudnik.full_name,
doljnost.doljnost
from zakaz,sotrudnik,doljnost
where zakaz.id_sotrudnik=sotrudnik.id_sotrudnik
and sotrudnik.id_doljnost=doljnost.id_doljnost
and sotrudnik.id_sotrudnik=3 --or sotrudnik.full_name='fullName'
--10)Выводит сколько продаж совершил каждый сотрудник,с указанием имени и должности
select
count(zakaz.id_zakaz) as count_of_zakaz,sotrudnik.full_name,doljnost.doljnost
from sotrudnik,doljnost,zakaz
where zakaz.id_sotrudnik=sotrudnik.id_sotrudnik
and sotrudnik.id_doljnost=doljnost.id_doljnost
group by sotrudnik.full_name,doljnost.doljnost
--11)Список продаж с указанием района по заданному периоду
select 
zakaz.data,
zakaz.comments,
rayon.rayon
from zakaz,klient,rayon
where zakaz.id_klient=klient.id_klient
and klient.id_rayon=rayon.id_rayon
and zakaz.data between '2023-03-01' and '2023-05-30'
--12)Сколько заказов было получено с каждого района за определенный период
select
count(zakaz.id_zakaz) as countOfZakaz,rayon.rayon
from zakaz,rayon,klient
where zakaz.id_klient=klient.id_klient
and klient.id_rayon=rayon.id_rayon
and zakaz.data between '2023-01-01' and '2023-03-30'
group by rayon.rayon
--13)Ну просто выводит имя клиента и его контакт
select klient.full_name,
kontakty.kontakty
from klient,kontakty
where kontakty.id_klient=klient.id_klient
--14)Вывод заказов за определенный период с указанным типом продаж
select 
zakaz.data,
tip_prodaj.tip_prodaj
from zakaz,tip_prodaj
where zakaz.id_tip_prodaj=tip_prodaj.id_tip_prodaj
and tip_prodaj.tip_prodaj='активные' --or tip.prodaj.id-tip_prodaj=1
and zakaz.data between '2023-01-01' and '2023-02-28'
--15)Вывод заказов за определенный период с указанным типом заказа (то же самое что и 14, просто указываем мы тип заказа)
select
zakaz.data,
tip_zakaza.tip_zakaza
from zakaz,tip_zakaza
where zakaz.id_tip_zakaza=tip_zakaza.id_tip_zakaza
and tip_zakaza.tip_zakaza='обычный заказ' --or tip_zakaza.id-tip_zakaza=1
and zakaz.data between '2023-01-01' and '2023-02-28'