﻿// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

#Использовать asserts
#Использовать "../.."

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯПолучаюСписокНастроек");
	ВсеШаги.Добавить("СписокНастроекСодержитНастройкуСоЗначением");
	ВсеШаги.Добавить("ЯЧитаюНастройку");
	ВсеШаги.Добавить("ЯУстанавливаюНастройкуВЗначение");
	ВсеШаги.Добавить("ЯУстанавливаюНастройкуВЗначениеЛокально");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	
КонецПроцедуры

//Я читаю настройку "core.autocrlf"
Процедура ЯЧитаюНастройку(Знач ИмяНастройки) Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	Настройка = ГитРепозиторий.ПолучитьНастройку(ИмяНастройки);
КонецПроцедуры

//Я устанавливаю настройку "test.test" в значение "true"
Процедура ЯУстанавливаюНастройкуВЗначение(Знач ИмяНастройки, Знач ЗначениеНастройки) Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ГитРепозиторий.УстановитьНастройку(ИмяНастройки, ЗначениеНастройки);
КонецПроцедуры

//Я устанавливаю настройку "test.test" в значение "true" локально
Процедура ЯУстанавливаюНастройкуВЗначениеЛокально(Знач ИмяНастройки, Знач ЗначениеНастройки) Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ГитРепозиторий.УстановитьНастройку(ИмяНастройки, ЗначениеНастройки, РежимУстановкиНастроек.Локально);
КонецПроцедуры

//Я получаю список настроек
Процедура ЯПолучаюСписокНастроек() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	СписокНастроек = ГитРепозиторий.ПолучитьСписокНастроек();
	БДД.СохранитьВКонтекст("СписокНастроек", СписокНастроек);
КонецПроцедуры

//Список настроек содержит настройку "123" со значением "фыв"
Процедура СписокНастроекСодержитНастройкуСоЗначением(Знач ИмяНастройки, Знач ЗначениеНастройки) Экспорт
	СписокНастроек = БДД.ПолучитьИзКонтекста("СписокНастроек");
	ПолученноеИмяНастройки = СписокНастроек.Получить(ИмяНастройки);

	Ожидаем.Что(ЗначениеНастройки, "Ожидаемое значение настройки не соответствует установленному.").Равно(ПолученноеИмяНастройки);
КонецПроцедуры

