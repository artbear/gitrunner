﻿// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

#Использовать asserts

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;
	
	ВсеШаги = Новый Массив;
	
	ВсеШаги.Добавить("ЯДобавляюПодмодульСВеткой");
	ВсеШаги.Добавить("ЯОбновляюПодмодули");
	ВсеШаги.Добавить("ЯПолучаюСостояниеПодмодулей");
	ВсеШаги.Добавить("СписокПодмодулейСодержитПодмодульCУказателем");
	
	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	
КонецПроцедуры

//Я обновляю подмодули
Процедура ЯОбновляюПодмодули() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ГитРепозиторий.ОбновитьПодмодули();
КонецПроцедуры

//Я добавляю подмодуль "https://github.com/nixel2007/gitrunner" с веткой "develop"
Процедура ЯДобавляюПодмодульСВеткой(Знач АдресВнешнегоРепозитория, Знач ИмяВетки) Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ГитРепозиторий.ДобавитьПодмодуль(АдресВнешнегоРепозитория, , ИмяВетки)
КонецПроцедуры

//Список подмодулей содержит подмодуль "gitrunner" c указателем "develop"
Процедура СписокПодмодулейСодержитПодмодульCУказателем(Знач ИмяПодмодуля, Знач Указатель) Экспорт
	СостояниеПодмодулей = БДД.ПолучитьИзКонтекста("СостояниеПодмодулей");
	
	Нашли = Ложь;
	СтрокаПодмодуль = Неопределено;
	Для Каждого Подмодуль Из СостояниеПодмодулей Цикл
		
		Если Подмодуль.Имя <> ИмяПодмодуля Тогда
			Продолжить;
		КонецЕсли;
		
		Нашли = Истина;
		Ожидаем.Что(Подмодуль.Указатель, "Подмодуль содержит неверный указатель").Равно(Указатель);
		
	КонецЦикла;	
	
	Ожидаем.Что(Нашли, "Данные о подмодулях не содержат подмодуля " + ИмяПодмодуля).ЭтоИстина();	
КонецПроцедуры

//Я получаю состояние подмодулей
Процедура ЯПолучаюСостояниеПодмодулей() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	СостояниеПодмодулей = ГитРепозиторий.ПолучитьСостояниеПодмодулей();
	
	БДД.СохранитьВКонтекст("СостояниеПодмодулей", СостояниеПодмодулей);
КонецПроцедуры




