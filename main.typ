#import "./lib.typ": *

#show: setup_presentation.with(
  height: 12cm,
  authors_short: ("Закарлюка", "Плотников", "Муравьев", "Блинов"),
  authors_long: ("Закарлюка", "Плотников", "Муравьев", "Блинов"),
  title_long: "Разбор задач чемпионата Student Fest 2026",
  title_short: "Разбор SF 2026",
  institute_long: "Санкт-Петербургский государственный университет",
  institute_short: "СПбГУ",
  date: "Сентябрь 2026",
  header: false,
  table_of_content: false,
)

= A. Проблемы со связью
#include "Tasks/A.typ"

= B. Гномья бюрократия
#include "Tasks/B.typ"

= C. Секретная пара
#include "Tasks/C.typ"

= D. Организация чемпионата
#include "Tasks/D.typ"

= E. Потеряшка
#include "Tasks/E.typ"

= F. Поиск составителей
#include "Tasks/F.typ"

= G. Разбиение на отрезки
#include "Tasks/G.typ"

= H. Шахматные проказы
#include "Tasks/H.typ"

= I. Экзамен
#include "Tasks/I.typ"

= J. Тактический симулятор
#include "Tasks/J.typ"
