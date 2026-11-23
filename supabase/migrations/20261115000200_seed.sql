-- Сгенерировано командой npm run seed:generate.
begin;

create temporary table catalog_seed on commit drop as
select item as recipe
from jsonb_array_elements($cookify_seed$[
  {
    "id": "1",
    "title": "Сырный крем-суп",
    "description": "Бархатистая консистенция и яркий сливочный вкус с ноткой чеснока. Подавайте с хрустящими гренками и свежей зеленью.",
    "image": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 173,
    "protein": 5,
    "fat": 13,
    "carbs": 10,
    "rating": 4.98,
    "ratingCount": 121,
    "cookTime": 40,
    "displayTags": [
      "ПП",
      "УЖИН",
      "ОБЕД",
      "ПЕРВЫЕ БЛЮДА"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "healthy",
        "noGluten"
      ],
      "cuisine": [],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Картофель",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Куриное филе",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Сливки 15%",
        "amount": "200",
        "unit": "мл"
      },
      {
        "name": "Сливочный сыр",
        "amount": "150",
        "unit": "г"
      },
      {
        "name": "Чеснок",
        "amount": "2",
        "unit": "зуб."
      },
      {
        "name": "Соль",
        "amount": "1",
        "unit": "ч.л."
      }
    ],
    "steps": [
      {
        "text": "Нарежьте картошку, лук и морковь мелким кубиком. Пропустите чеснок через пресс. Натрите полутвёрдый сыр.",
        "timerSeconds": 0,
        "image": "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=560&h=420&fit=crop&auto=format&q=80",
        "tip": "Нарезайте все овощи примерно одинаковым размером — так они приготовятся равномерно.\nЧтобы лук не щипал глаза, положите нож в морозилку на 5 минут перед нарезкой."
      },
      {
        "text": "Влейте в кастрюлю воду и поставьте на огонь. Когда вода закипит, закиньте в неё картошку. Посолите по вкусу.",
        "timerSeconds": 0,
        "image": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=560&h=420&fit=crop&auto=format&q=80",
        "tip": "Как проверить готовность: проткните кубик ножом или вилкой — если входит мягко, как в масло, картошка готова. Обычно это 10-15 минут после закипания.\nСоль «по вкусу»: начинайте с 1 ч.л. на 1 литр воды, в конце попробуйте и добавьте ещё при необходимости."
      },
      {
        "text": "Обжарьте лук до полупрозрачности на 2 ст.л. масла. Затем добавьте морковь и чеснок, жарьте до золотистости. Выложите зажарку в бульон к картошке и варите ещё 10 минут.",
        "timerSeconds": 600,
        "image": "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=560&h=420&fit=crop&auto=format&q=80",
        "tip": "Держите средний огонь и помешивайте каждые 1-2 минуты. Если лук начал темнеть слишком быстро — убавьте огонь и добавьте 1 ст.л. воды.\nПризнак готовности: лук станет полупрозрачным и мягким, морковь — чуть золотистой."
      },
      {
        "text": "Нарежьте куриное филе небольшими кубиками. Выложите его в сковороду и жарьте примерно 7-10 минут до белого цвета, периодически помешивая.",
        "timerSeconds": 480,
        "image": "https://images.unsplash.com/photo-1604908554007-3a5e8b9d4d3a?w=560&h=420&fit=crop&auto=format&q=80",
        "warning": "Не пережаривайте филе — иначе оно станет сухим. Как только мясо побелело снаружи и нет розового сока, оно готово."
      },
      {
        "text": "Влейте сливки, добавьте натёртый сыр и обжаренное филе в кастрюлю. Прогрейте на медленном огне, постоянно помешивая, пока сыр не расплавится. Пробейте суп блендером до однородности.",
        "timerSeconds": 300,
        "image": "https://images.unsplash.com/photo-1547592180-85f173990554?w=560&h=420&fit=crop&auto=format&q=80",
        "tip": "Не доводите до кипения после добавления сливок и сыра — иначе суп может расслоиться."
      },
      {
        "text": "Разлейте суп по порционным тарелкам. Посыпьте сухариками, зеленью и приправьте смесью перцев и оливковым маслом.",
        "timerSeconds": 0,
        "image": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=560&h=420&fit=crop&auto=format&q=80",
        "tip": "Сухарики добавляйте прямо перед подачей, иначе они размокнут. Зелень можно заменить щепоткой сушёных прованских трав.\nСуп хранится в холодильнике до 3 дней. При разогреве добавьте ложку сливок и немного воды."
      }
    ]
  },
  {
    "id": "2",
    "title": "Борщ классический",
    "description": "Насыщенный свекольный суп с говядиной и капустой. Подавайте со сметаной и свежим чёрным хлебом.",
    "image": "https://images.unsplash.com/photo-1603105037880-880cd4f8395f?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 280,
    "protein": 15,
    "fat": 12,
    "carbs": 28,
    "rating": 4.88,
    "ratingCount": 312,
    "cookTime": 90,
    "displayTags": [
      "РУССКАЯ",
      "ОБЕД",
      "ПЕРВЫЕ БЛЮДА"
    ],
    "filters": {
      "mealType": [
        "lunch"
      ],
      "occasions": [],
      "health": [
        "highProtein"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Говядина",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Свёкла",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Картофель",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Капуста",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Морковь",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Лук",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Томатная паста",
        "amount": "2",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "3",
    "title": "Тыквенный крем-суп с имбирём",
    "description": "Бархатный суп из запечённой тыквы с имбирём и кокосовыми сливками. Согревает в холодный вечер.",
    "image": "https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 195,
    "protein": 4,
    "fat": 8,
    "carbs": 28,
    "rating": 4.82,
    "ratingCount": 89,
    "cookTime": 45,
    "displayTags": [
      "ВЕГАН",
      "УЖИН",
      "ПЕРВЫЕ БЛЮДА"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian",
        "healthy",
        "noLactose"
      ],
      "cuisine": [],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Тыква",
        "amount": "600",
        "unit": "г"
      },
      {
        "name": "Имбирь",
        "amount": "20",
        "unit": "г"
      },
      {
        "name": "Кокосовые сливки",
        "amount": "200",
        "unit": "мл"
      },
      {
        "name": "Лук",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Чеснок",
        "amount": "2",
        "unit": "зуб."
      }
    ],
    "steps": []
  },
  {
    "id": "4",
    "title": "Окрошка на квасе",
    "description": "Холодный летний суп на квасе с овощами, варёной колбасой и зеленью. Освежает в самую жаркую погоду.",
    "image": "https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 145,
    "protein": 8,
    "fat": 6,
    "carbs": 18,
    "rating": 4.6,
    "ratingCount": 76,
    "cookTime": 25,
    "displayTags": [
      "РУССКАЯ",
      "ОБЕД",
      "ЛЕТО"
    ],
    "filters": {
      "mealType": [
        "lunch"
      ],
      "occasions": [],
      "health": [
        "weightLoss"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "sour"
      ]
    },
    "ingredients": [
      {
        "name": "Квас",
        "amount": "1",
        "unit": "л"
      },
      {
        "name": "Огурцы",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Редис",
        "amount": "5",
        "unit": "шт"
      },
      {
        "name": "Варёная колбаса",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Яйца",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Зелень",
        "amount": "1",
        "unit": "пучок"
      }
    ],
    "steps": []
  },
  {
    "id": "5",
    "title": "Дал из красной чечевицы",
    "description": "Густой пряный суп из чечевицы с куркумой, кориандром и томатами. Полностью растительный белок и яркий вкус.",
    "image": "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 220,
    "protein": 14,
    "fat": 5,
    "carbs": 32,
    "rating": 4.75,
    "ratingCount": 142,
    "cookTime": 35,
    "displayTags": [
      "ИНДИЙСКАЯ",
      "ВЕГАН",
      "ОБЕД"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian",
        "healthy",
        "highProtein",
        "noGluten",
        "noLactose"
      ],
      "cuisine": [
        "indian"
      ],
      "taste": [
        "spicy"
      ]
    },
    "ingredients": [
      {
        "name": "Чечевица красная",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Помидоры",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Лук",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Куркума",
        "amount": "1",
        "unit": "ч.л."
      },
      {
        "name": "Кориандр",
        "amount": "1",
        "unit": "ч.л."
      },
      {
        "name": "Имбирь",
        "amount": "15",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "6",
    "title": "Овсянка с ягодами и мёдом",
    "description": "Полезный завтрак с овсяными хлопьями на молоке, свежими ягодами и ложкой мёда. Заряд энергии на весь день.",
    "image": "https://images.unsplash.com/photo-1517673400267-0251440c45dc?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 210,
    "protein": 8,
    "fat": 4,
    "carbs": 38,
    "rating": 4.55,
    "ratingCount": 198,
    "cookTime": 10,
    "displayTags": [
      "ЗАВТРАК",
      "ПП",
      "БЫСТРО"
    ],
    "filters": {
      "mealType": [
        "breakfast"
      ],
      "occasions": [],
      "health": [
        "healthy",
        "vegetarian"
      ],
      "cuisine": [],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Овсяные хлопья",
        "amount": "80",
        "unit": "г"
      },
      {
        "name": "Молоко",
        "amount": "250",
        "unit": "мл"
      },
      {
        "name": "Ягоды",
        "amount": "100",
        "unit": "г"
      },
      {
        "name": "Мёд",
        "amount": "1",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "7",
    "title": "Сырники с малиной",
    "description": "Нежные сырники из творога с ванилью и малиновым соусом. Классический завтрак выходного дня.",
    "image": "https://images.unsplash.com/photo-1567620832903-9fc6debc209f?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 245,
    "protein": 18,
    "fat": 9,
    "carbs": 24,
    "rating": 4.88,
    "ratingCount": 287,
    "cookTime": 30,
    "displayTags": [
      "РУССКАЯ",
      "ЗАВТРАК"
    ],
    "filters": {
      "mealType": [
        "breakfast"
      ],
      "occasions": [],
      "health": [
        "vegetarian",
        "highProtein"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Творог",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Яйцо",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Мука",
        "amount": "3",
        "unit": "ст.л."
      },
      {
        "name": "Малина",
        "amount": "150",
        "unit": "г"
      },
      {
        "name": "Сметана",
        "amount": "100",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "8",
    "title": "Тост с авокадо и яйцом",
    "description": "Цельнозерновой хлеб, пюре из авокадо с лимоном и яйцо-пашот. Пять минут — и завтрак готов.",
    "image": "https://images.unsplash.com/photo-1525351484163-7529414344d8?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 280,
    "protein": 12,
    "fat": 16,
    "carbs": 22,
    "rating": 4.6,
    "ratingCount": 156,
    "cookTime": 10,
    "displayTags": [
      "ЗАВТРАК",
      "ПП",
      "БЫСТРО"
    ],
    "filters": {
      "mealType": [
        "breakfast"
      ],
      "occasions": [],
      "health": [
        "healthy",
        "vegetarian"
      ],
      "cuisine": [],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Хлеб цельнозерновой",
        "amount": "2",
        "unit": "кус."
      },
      {
        "name": "Авокадо",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Яйцо",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Лимон",
        "amount": "0.5",
        "unit": "шт"
      }
    ],
    "steps": []
  },
  {
    "id": "9",
    "title": "Зелёный смузи",
    "description": "Освежающий смузи с шпинатом, яблоком, бананом и лимонным соком. Витамины и клетчатка в одном стакане.",
    "image": "https://images.unsplash.com/photo-1638176067000-9e2ec64c8cd2?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 130,
    "protein": 3,
    "fat": 1,
    "carbs": 28,
    "rating": 4.45,
    "ratingCount": 92,
    "cookTime": 5,
    "displayTags": [
      "ЗАВТРАК",
      "ВЕГАН",
      "ДЕТОКС"
    ],
    "filters": {
      "mealType": [
        "breakfast",
        "snack"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian",
        "healthy",
        "weightLoss",
        "noLactose",
        "noGluten"
      ],
      "cuisine": [],
      "taste": [
        "sour",
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Шпинат",
        "amount": "50",
        "unit": "г"
      },
      {
        "name": "Яблоко",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Банан",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Лимон",
        "amount": "0.5",
        "unit": "шт"
      },
      {
        "name": "Вода",
        "amount": "200",
        "unit": "мл"
      }
    ],
    "steps": []
  },
  {
    "id": "10",
    "title": "Панкейки с бананом",
    "description": "Воздушные панкейки с золотистой корочкой и карамелизованным бананом. Лучший повод проснуться пораньше.",
    "image": "https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 390,
    "protein": 8,
    "fat": 12,
    "carbs": 62,
    "rating": 4.7,
    "ratingCount": 234,
    "cookTime": 25,
    "displayTags": [
      "ЗАВТРАК",
      "ДЕСЕРТЫ"
    ],
    "filters": {
      "mealType": [
        "breakfast",
        "tea"
      ],
      "occasions": [],
      "health": [
        "vegetarian"
      ],
      "cuisine": [],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Молоко",
        "amount": "250",
        "unit": "мл"
      },
      {
        "name": "Яйца",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Бананы",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Сахар",
        "amount": "2",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "11",
    "title": "Паста Карбонара",
    "description": "Классическая итальянская паста с беконом, яйцом и пармезаном. Нежный сливочный соус без сливок — только яйца и сыр.",
    "image": "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 420,
    "protein": 18,
    "fat": 22,
    "carbs": 38,
    "rating": 4.85,
    "ratingCount": 412,
    "cookTime": 25,
    "displayTags": [
      "ИТАЛЬЯНСКАЯ",
      "УЖИН",
      "БЫСТРО"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "highProtein"
      ],
      "cuisine": [
        "italian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Спагетти",
        "amount": "400",
        "unit": "г"
      },
      {
        "name": "Бекон",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Яйца",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Пармезан",
        "amount": "100",
        "unit": "г"
      },
      {
        "name": "Чёрный перец",
        "amount": "1",
        "unit": "ч.л."
      }
    ],
    "steps": []
  },
  {
    "id": "12",
    "title": "Пицца Маргарита",
    "description": "Тонкое тесто, томатный соус, моцарелла и свежий базилик. Минимум ингредиентов, максимум удовольствия.",
    "image": "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 295,
    "protein": 12,
    "fat": 9,
    "carbs": 42,
    "rating": 4.92,
    "ratingCount": 528,
    "cookTime": 50,
    "displayTags": [
      "ИТАЛЬЯНСКАЯ",
      "УЖИН",
      "ОБЕД"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [
        "birthday"
      ],
      "health": [
        "vegetarian"
      ],
      "cuisine": [
        "italian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "400",
        "unit": "г"
      },
      {
        "name": "Дрожжи",
        "amount": "7",
        "unit": "г"
      },
      {
        "name": "Моцарелла",
        "amount": "250",
        "unit": "г"
      },
      {
        "name": "Томатный соус",
        "amount": "200",
        "unit": "мл"
      },
      {
        "name": "Базилик",
        "amount": "1",
        "unit": "пучок"
      }
    ],
    "steps": []
  },
  {
    "id": "13",
    "title": "Ризотто с грибами",
    "description": "Кремовое ризотто с белыми грибами и пармезаном. Готовится медленно — но результат того стоит.",
    "image": "https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 310,
    "protein": 9,
    "fat": 11,
    "carbs": 45,
    "rating": 4.78,
    "ratingCount": 167,
    "cookTime": 40,
    "displayTags": [
      "ИТАЛЬЯНСКАЯ",
      "УЖИН",
      "ВЕГЕТАР"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "vegetarian"
      ],
      "cuisine": [
        "italian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Рис арборио",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Грибы белые",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Бульон овощной",
        "amount": "1",
        "unit": "л"
      },
      {
        "name": "Пармезан",
        "amount": "80",
        "unit": "г"
      },
      {
        "name": "Лук",
        "amount": "1",
        "unit": "шт"
      }
    ],
    "steps": []
  },
  {
    "id": "14",
    "title": "Лазанья болоньезе",
    "description": "Слои пасты, мясной соус болоньезе и бешамель под золотистой корочкой пармезана. Идеально на большую компанию.",
    "image": "https://images.unsplash.com/photo-1619895092538-128f4d7ddec5?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 460,
    "protein": 22,
    "fat": 24,
    "carbs": 38,
    "rating": 4.9,
    "ratingCount": 378,
    "cookTime": 95,
    "displayTags": [
      "ИТАЛЬЯНСКАЯ",
      "УЖИН",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "dinner"
      ],
      "occasions": [
        "birthday",
        "otherHoliday"
      ],
      "health": [
        "highProtein"
      ],
      "cuisine": [
        "italian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Листы лазаньи",
        "amount": "12",
        "unit": "шт"
      },
      {
        "name": "Фарш говяжий",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Помидоры",
        "amount": "400",
        "unit": "г"
      },
      {
        "name": "Молоко",
        "amount": "500",
        "unit": "мл"
      },
      {
        "name": "Мука",
        "amount": "50",
        "unit": "г"
      },
      {
        "name": "Пармезан",
        "amount": "100",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "15",
    "title": "Тирамису",
    "description": "Классический итальянский десерт с маскарпоне, кофе и шоколадом. Воздушная и ни капли не приторная сладость.",
    "image": "https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 320,
    "protein": 6,
    "fat": 18,
    "carbs": 32,
    "rating": 4.94,
    "ratingCount": 615,
    "cookTime": 30,
    "displayTags": [
      "ИТАЛЬЯНСКАЯ",
      "ДЕСЕРТЫ",
      "ПОЛДНИК"
    ],
    "filters": {
      "mealType": [
        "tea"
      ],
      "occasions": [
        "birthday"
      ],
      "health": [
        "vegetarian"
      ],
      "cuisine": [
        "italian"
      ],
      "taste": [
        "sweet",
        "bitter"
      ]
    },
    "ingredients": [
      {
        "name": "Маскарпоне",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Печенье савоярди",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Кофе эспрессо",
        "amount": "300",
        "unit": "мл"
      },
      {
        "name": "Какао",
        "amount": "2",
        "unit": "ст.л."
      },
      {
        "name": "Яйца",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Сахар",
        "amount": "100",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "16",
    "title": "Хачапури по-аджарски",
    "description": "Сочная лодочка из хрустящего теста с расплавленным сулугуни, маслом и яйцом. Настоящий вкус Грузии.",
    "image": "https://images.unsplash.com/photo-1604908177453-7462950a6a3b?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 380,
    "protein": 14,
    "fat": 20,
    "carbs": 35,
    "rating": 4.91,
    "ratingCount": 452,
    "cookTime": 60,
    "displayTags": [
      "ГРУЗИНСКАЯ",
      "УЖИН",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [
        "birthday",
        "otherHoliday"
      ],
      "health": [
        "vegetarian",
        "highProtein"
      ],
      "cuisine": [
        "georgian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Сулугуни",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Яйца",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Масло сливочное",
        "amount": "50",
        "unit": "г"
      },
      {
        "name": "Молоко",
        "amount": "200",
        "unit": "мл"
      }
    ],
    "steps": []
  },
  {
    "id": "17",
    "title": "Шашлык из свинины",
    "description": "Сочный шашлык на углях с золотистой корочкой и луком. Маринуется в кефире со специями — мягчайший результат.",
    "image": "https://images.unsplash.com/photo-1555126634-323283e090fa?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 310,
    "protein": 28,
    "fat": 22,
    "carbs": 2,
    "rating": 4.86,
    "ratingCount": 289,
    "cookTime": 240,
    "displayTags": [
      "ГРУЗИНСКАЯ",
      "УЖИН",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "dinner"
      ],
      "occasions": [
        "birthday"
      ],
      "health": [
        "highProtein",
        "lowCarb",
        "noGluten"
      ],
      "cuisine": [
        "georgian"
      ],
      "taste": [
        "salty",
        "spicy"
      ]
    },
    "ingredients": [
      {
        "name": "Свинина (шея)",
        "amount": "1.5",
        "unit": "кг"
      },
      {
        "name": "Лук",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Кефир",
        "amount": "500",
        "unit": "мл"
      },
      {
        "name": "Специи",
        "amount": "2",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "18",
    "title": "Чахохбили из курицы",
    "description": "Тушёная курица с помидорами, сладким перцем и большим количеством зелени. Ароматное блюдо в один сотейник.",
    "image": "https://images.unsplash.com/photo-1604908554007-67b0d3b8d3e0?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 245,
    "protein": 24,
    "fat": 12,
    "carbs": 8,
    "rating": 4.74,
    "ratingCount": 134,
    "cookTime": 60,
    "displayTags": [
      "ГРУЗИНСКАЯ",
      "УЖИН",
      "ОБЕД"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "highProtein",
        "lowCarb",
        "noGluten",
        "noLactose"
      ],
      "cuisine": [
        "georgian"
      ],
      "taste": [
        "spicy",
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Курица",
        "amount": "1.2",
        "unit": "кг"
      },
      {
        "name": "Помидоры",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Перец болгарский",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Лук",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Зелень",
        "amount": "2",
        "unit": "пучка"
      }
    ],
    "steps": []
  },
  {
    "id": "19",
    "title": "Оливье",
    "description": "Главный салат на праздничном столе: варёные овощи, колбаса, яйца, маринованные огурцы и горошек под майонезом.",
    "image": "https://images.unsplash.com/photo-1640719028782-8230eaadbf73?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 285,
    "protein": 9,
    "fat": 18,
    "carbs": 22,
    "rating": 4.89,
    "ratingCount": 821,
    "cookTime": 60,
    "displayTags": [
      "РУССКАЯ",
      "НОВЫЙ ГОД",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [
        "newyear",
        "birthday",
        "christmas"
      ],
      "health": [],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Картофель",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Морковь",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Яйца",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Колбаса варёная",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Огурцы маринованные",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Горошек",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Майонез",
        "amount": "200",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "20",
    "title": "Селёдка под шубой",
    "description": "Слои сельди, картофеля, моркови, свёклы и яиц под майонезом. Без неё новогодний стол — не стол.",
    "image": "https://images.unsplash.com/photo-1576020799627-aeac74d58064?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 230,
    "protein": 11,
    "fat": 14,
    "carbs": 18,
    "rating": 4.84,
    "ratingCount": 506,
    "cookTime": 90,
    "displayTags": [
      "РУССКАЯ",
      "НОВЫЙ ГОД",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [
        "newyear",
        "christmas"
      ],
      "health": [
        "highProtein"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Сельдь",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Картофель",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Морковь",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Свёкла",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Яйца",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Майонез",
        "amount": "200",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "21",
    "title": "Блины с мёдом",
    "description": "Тонкие масленичные блины с золотистой кружевной корочкой. С мёдом, сметаной или вареньем — на ваш выбор.",
    "image": "https://images.unsplash.com/photo-1534432182912-63863115e106?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 220,
    "protein": 6,
    "fat": 8,
    "carbs": 30,
    "rating": 4.81,
    "ratingCount": 367,
    "cookTime": 40,
    "displayTags": [
      "РУССКАЯ",
      "МАСЛЕНИЦА",
      "ЗАВТРАК"
    ],
    "filters": {
      "mealType": [
        "breakfast",
        "tea"
      ],
      "occasions": [
        "maslenitsa"
      ],
      "health": [
        "vegetarian"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Молоко",
        "amount": "500",
        "unit": "мл"
      },
      {
        "name": "Яйца",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Сахар",
        "amount": "2",
        "unit": "ст.л."
      },
      {
        "name": "Мёд",
        "amount": "4",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "22",
    "title": "Блины с икрой",
    "description": "Праздничная подача масленичных блинов: с красной икрой и сметаной. Безусловный хит застолья.",
    "image": "https://images.unsplash.com/photo-1606923829579-0cb981a83e2e?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 295,
    "protein": 14,
    "fat": 13,
    "carbs": 28,
    "rating": 4.93,
    "ratingCount": 218,
    "cookTime": 45,
    "displayTags": [
      "РУССКАЯ",
      "МАСЛЕНИЦА",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [
        "maslenitsa",
        "newyear"
      ],
      "health": [
        "highProtein"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Молоко",
        "amount": "500",
        "unit": "мл"
      },
      {
        "name": "Яйца",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Икра красная",
        "amount": "100",
        "unit": "г"
      },
      {
        "name": "Сметана",
        "amount": "150",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "23",
    "title": "Кулич пасхальный",
    "description": "Высокий ароматный кулич с цукатами, изюмом и белой глазурью. Тесто опарное — пышное и долго не черствеет.",
    "image": "https://images.unsplash.com/photo-1554139583-ed7e0a1f5dde?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 340,
    "protein": 7,
    "fat": 12,
    "carbs": 52,
    "rating": 4.87,
    "ratingCount": 432,
    "cookTime": 240,
    "displayTags": [
      "РУССКАЯ",
      "ПАСХА",
      "ВЫПЕЧКА"
    ],
    "filters": {
      "mealType": [
        "tea"
      ],
      "occasions": [
        "easter"
      ],
      "health": [
        "vegetarian"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "1",
        "unit": "кг"
      },
      {
        "name": "Молоко",
        "amount": "500",
        "unit": "мл"
      },
      {
        "name": "Дрожжи",
        "amount": "50",
        "unit": "г"
      },
      {
        "name": "Яйца",
        "amount": "6",
        "unit": "шт"
      },
      {
        "name": "Сахар",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Изюм",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Цукаты",
        "amount": "100",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "24",
    "title": "Гречка с грибами",
    "description": "Рассыпчатая гречка с обжаренными шампиньонами и луком. Простой, сытный и постный обед.",
    "image": "https://images.unsplash.com/photo-1604908554049-bb4caa3e26b4?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 235,
    "protein": 9,
    "fat": 7,
    "carbs": 38,
    "rating": 4.62,
    "ratingCount": 174,
    "cookTime": 35,
    "displayTags": [
      "РУССКАЯ",
      "ВЕГАН",
      "ОБЕД"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian",
        "healthy",
        "noGluten",
        "noLactose"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Гречка",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Шампиньоны",
        "amount": "400",
        "unit": "г"
      },
      {
        "name": "Лук",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Масло растительное",
        "amount": "3",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "25",
    "title": "Карри с курицей",
    "description": "Курица в насыщенном соусе из помидоров, кокосового молока и индийских специй. Подавайте с рисом басмати.",
    "image": "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 365,
    "protein": 26,
    "fat": 16,
    "carbs": 28,
    "rating": 4.88,
    "ratingCount": 387,
    "cookTime": 55,
    "displayTags": [
      "ИНДИЙСКАЯ",
      "УЖИН",
      "ОСТРОЕ"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "highProtein",
        "noGluten",
        "noLactose"
      ],
      "cuisine": [
        "indian"
      ],
      "taste": [
        "spicy"
      ]
    },
    "ingredients": [
      {
        "name": "Куриное филе",
        "amount": "600",
        "unit": "г"
      },
      {
        "name": "Помидоры",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Кокосовое молоко",
        "amount": "400",
        "unit": "мл"
      },
      {
        "name": "Карри",
        "amount": "2",
        "unit": "ст.л."
      },
      {
        "name": "Лук",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Чеснок",
        "amount": "4",
        "unit": "зуб."
      }
    ],
    "steps": []
  },
  {
    "id": "26",
    "title": "Бирьяни с курицей",
    "description": "Ароматный плов из басмати с курицей, шафраном и индийскими специями. Слоёное блюдо родом из Хайдарабада.",
    "image": "https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 420,
    "protein": 24,
    "fat": 14,
    "carbs": 52,
    "rating": 4.79,
    "ratingCount": 256,
    "cookTime": 90,
    "displayTags": [
      "ИНДИЙСКАЯ",
      "УЖИН",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [
        "birthday"
      ],
      "health": [
        "highProtein"
      ],
      "cuisine": [
        "indian"
      ],
      "taste": [
        "spicy",
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Рис басмати",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Курица",
        "amount": "700",
        "unit": "г"
      },
      {
        "name": "Йогурт натуральный",
        "amount": "300",
        "unit": "мл"
      },
      {
        "name": "Шафран",
        "amount": "1",
        "unit": "щеп."
      },
      {
        "name": "Гарам масала",
        "amount": "1",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "27",
    "title": "Самса с овощами",
    "description": "Хрустящие треугольники из тонкого теста с пряной картофельной начинкой. Идеальный перекус с чаем масала.",
    "image": "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 270,
    "protein": 6,
    "fat": 12,
    "carbs": 35,
    "rating": 4.65,
    "ratingCount": 142,
    "cookTime": 70,
    "displayTags": [
      "ИНДИЙСКАЯ",
      "ВЕГАН",
      "ПЕРЕКУС"
    ],
    "filters": {
      "mealType": [
        "snack",
        "tea"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian"
      ],
      "cuisine": [
        "indian"
      ],
      "taste": [
        "spicy",
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Картофель",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Зелёный горошек",
        "amount": "150",
        "unit": "г"
      },
      {
        "name": "Карри",
        "amount": "1",
        "unit": "ст.л."
      },
      {
        "name": "Чили",
        "amount": "1",
        "unit": "шт"
      }
    ],
    "steps": []
  },
  {
    "id": "28",
    "title": "Греческий салат",
    "description": "Свежий и лёгкий салат с оливками, фетой и хрустящими овощами. Идеально для лёгкого обеда.",
    "image": "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 150,
    "protein": 6,
    "fat": 11,
    "carbs": 8,
    "rating": 4.72,
    "ratingCount": 245,
    "cookTime": 15,
    "displayTags": [
      "ЗОЖ",
      "ОБЕД",
      "НИЗКИЕ КАЛОРИИ"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "snack"
      ],
      "occasions": [],
      "health": [
        "vegetarian",
        "healthy",
        "lowCarb",
        "weightLoss",
        "noGluten"
      ],
      "cuisine": [],
      "taste": [
        "salty",
        "sour"
      ]
    },
    "ingredients": [
      {
        "name": "Помидоры",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Огурцы",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Фета",
        "amount": "150",
        "unit": "г"
      },
      {
        "name": "Оливки",
        "amount": "100",
        "unit": "г"
      },
      {
        "name": "Оливковое масло",
        "amount": "3",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "29",
    "title": "Боул с киноа и нутом",
    "description": "Тёплый боул с киноа, печёным нутом, овощами и тахинной заправкой. Сбалансированно, вкусно и веган-френдли.",
    "image": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 340,
    "protein": 15,
    "fat": 12,
    "carbs": 48,
    "rating": 4.65,
    "ratingCount": 189,
    "cookTime": 35,
    "displayTags": [
      "ВЕГАН",
      "ЗОЖ",
      "ОБЕД"
    ],
    "filters": {
      "mealType": [
        "lunch"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian",
        "healthy",
        "highProtein",
        "noGluten",
        "noLactose"
      ],
      "cuisine": [],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Киноа",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Нут",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Шпинат",
        "amount": "100",
        "unit": "г"
      },
      {
        "name": "Морковь",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Тахини",
        "amount": "2",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "30",
    "title": "Лосось на пару с рисом",
    "description": "Сочный лосось на пару с лимоном и тимьяном на подушке из жасминового риса. Ужин премиум-класса.",
    "image": "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 360,
    "protein": 32,
    "fat": 14,
    "carbs": 28,
    "rating": 4.92,
    "ratingCount": 298,
    "cookTime": 30,
    "displayTags": [
      "ЗОЖ",
      "ВЫСОКОБЕЛКОВОЕ",
      "УЖИН"
    ],
    "filters": {
      "mealType": [
        "dinner"
      ],
      "occasions": [],
      "health": [
        "healthy",
        "highProtein",
        "noLactose",
        "noGluten"
      ],
      "cuisine": [],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Лосось",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Рис жасмин",
        "amount": "250",
        "unit": "г"
      },
      {
        "name": "Лимон",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Тимьян",
        "amount": "4",
        "unit": "веточки"
      }
    ],
    "steps": []
  },
  {
    "id": "31",
    "title": "Куриная грудка с овощами на гриле",
    "description": "Маринованная куриная грудка на гриле с цуккини, перцем и помидорами черри. Высокий белок, низкие калории.",
    "image": "https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 280,
    "protein": 34,
    "fat": 8,
    "carbs": 12,
    "rating": 4.7,
    "ratingCount": 167,
    "cookTime": 35,
    "displayTags": [
      "ЗОЖ",
      "ВЫСОКОБЕЛКОВОЕ",
      "УЖИН"
    ],
    "filters": {
      "mealType": [
        "lunch",
        "dinner"
      ],
      "occasions": [],
      "health": [
        "healthy",
        "highProtein",
        "lowCarb",
        "weightLoss",
        "noGluten",
        "noLactose"
      ],
      "cuisine": [],
      "taste": [
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Куриная грудка",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Цуккини",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Перец болгарский",
        "amount": "2",
        "unit": "шт"
      },
      {
        "name": "Помидоры черри",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Оливковое масло",
        "amount": "2",
        "unit": "ст.л."
      }
    ],
    "steps": []
  },
  {
    "id": "32",
    "title": "Чизкейк нью-йорк",
    "description": "Кремовый чизкейк на основе из печенья с лёгкой кислинкой. Идеально к чашке кофе во второй половине дня.",
    "image": "https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 380,
    "protein": 8,
    "fat": 24,
    "carbs": 32,
    "rating": 4.86,
    "ratingCount": 412,
    "cookTime": 90,
    "displayTags": [
      "ДЕСЕРТЫ",
      "ПОЛДНИК",
      "ВЫПЕЧКА"
    ],
    "filters": {
      "mealType": [
        "tea"
      ],
      "occasions": [
        "birthday"
      ],
      "health": [
        "vegetarian"
      ],
      "cuisine": [],
      "taste": [
        "sweet",
        "sour"
      ]
    },
    "ingredients": [
      {
        "name": "Сливочный сыр",
        "amount": "600",
        "unit": "г"
      },
      {
        "name": "Сахар",
        "amount": "180",
        "unit": "г"
      },
      {
        "name": "Яйца",
        "amount": "3",
        "unit": "шт"
      },
      {
        "name": "Печенье",
        "amount": "200",
        "unit": "г"
      },
      {
        "name": "Сливочное масло",
        "amount": "80",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "33",
    "title": "Финский черничный пирог",
    "description": "Открытый пирог на песочном тесте с густой заливкой и шапкой из спелой черники. Чуть тёплый — идеален к чаю.",
    "image": "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 285,
    "protein": 5,
    "fat": 11,
    "carbs": 40,
    "rating": 4.72,
    "ratingCount": 145,
    "cookTime": 75,
    "displayTags": [
      "ВЫПЕЧКА",
      "ДЕСЕРТЫ",
      "ПОЛДНИК"
    ],
    "filters": {
      "mealType": [
        "tea"
      ],
      "occasions": [],
      "health": [
        "vegetarian"
      ],
      "cuisine": [],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Сливочное масло",
        "amount": "150",
        "unit": "г"
      },
      {
        "name": "Сахар",
        "amount": "180",
        "unit": "г"
      },
      {
        "name": "Черника",
        "amount": "400",
        "unit": "г"
      },
      {
        "name": "Сметана",
        "amount": "200",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "34",
    "title": "Торт «Наполеон»",
    "description": "Многослойный торт из тонких хрустящих коржей и нежного заварного крема. Праздничный десерт без компромиссов.",
    "image": "https://images.unsplash.com/photo-1535141192574-5d4897c12636?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 410,
    "protein": 6,
    "fat": 22,
    "carbs": 48,
    "rating": 4.95,
    "ratingCount": 723,
    "cookTime": 180,
    "displayTags": [
      "РУССКАЯ",
      "ДЕСЕРТЫ",
      "ПРАЗДНИК"
    ],
    "filters": {
      "mealType": [
        "tea"
      ],
      "occasions": [
        "birthday",
        "newyear",
        "christmas"
      ],
      "health": [
        "vegetarian"
      ],
      "cuisine": [
        "russian"
      ],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Мука",
        "amount": "500",
        "unit": "г"
      },
      {
        "name": "Сливочное масло",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Молоко",
        "amount": "1",
        "unit": "л"
      },
      {
        "name": "Яйца",
        "amount": "4",
        "unit": "шт"
      },
      {
        "name": "Сахар",
        "amount": "300",
        "unit": "г"
      }
    ],
    "steps": []
  },
  {
    "id": "35",
    "title": "Хумус с лавашом",
    "description": "Кремовый нутовый хумус с тахини, лимоном и оливковым маслом. Подаётся с тёплым лавашом или овощами.",
    "image": "https://images.unsplash.com/photo-1571197119282-7c4b4f4d9d4d?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 195,
    "protein": 9,
    "fat": 11,
    "carbs": 18,
    "rating": 4.68,
    "ratingCount": 134,
    "cookTime": 15,
    "displayTags": [
      "ВЕГАН",
      "ПЕРЕКУС",
      "БЫСТРО"
    ],
    "filters": {
      "mealType": [
        "snack"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian",
        "healthy",
        "highProtein",
        "noLactose"
      ],
      "cuisine": [],
      "taste": [
        "sour",
        "salty"
      ]
    },
    "ingredients": [
      {
        "name": "Нут варёный",
        "amount": "400",
        "unit": "г"
      },
      {
        "name": "Тахини",
        "amount": "3",
        "unit": "ст.л."
      },
      {
        "name": "Лимон",
        "amount": "1",
        "unit": "шт"
      },
      {
        "name": "Оливковое масло",
        "amount": "4",
        "unit": "ст.л."
      },
      {
        "name": "Чеснок",
        "amount": "2",
        "unit": "зуб."
      }
    ],
    "steps": []
  },
  {
    "id": "36",
    "title": "Энергетические шарики из фиников",
    "description": "Без сахара, без выпечки, без отходов. Финики, орехи и какао — три ингредиента и пять минут до полезного перекуса.",
    "image": "https://images.unsplash.com/photo-1606312619070-d48b4c652a52?w=720&h=400&fit=crop&auto=format&q=80",
    "calories": 175,
    "protein": 4,
    "fat": 8,
    "carbs": 24,
    "rating": 4.55,
    "ratingCount": 98,
    "cookTime": 10,
    "displayTags": [
      "ВЕГАН",
      "БЕЗ САХАРА",
      "ПЕРЕКУС"
    ],
    "filters": {
      "mealType": [
        "snack"
      ],
      "occasions": [],
      "health": [
        "vegan",
        "vegetarian",
        "healthy",
        "noSugar",
        "noLactose",
        "noGluten"
      ],
      "cuisine": [],
      "taste": [
        "sweet"
      ]
    },
    "ingredients": [
      {
        "name": "Финики",
        "amount": "300",
        "unit": "г"
      },
      {
        "name": "Орехи кешью",
        "amount": "150",
        "unit": "г"
      },
      {
        "name": "Какао",
        "amount": "2",
        "unit": "ст.л."
      },
      {
        "name": "Кокосовая стружка",
        "amount": "50",
        "unit": "г"
      }
    ],
    "steps": []
  }
]$cookify_seed$::jsonb) as seed(item);

insert into public.recipes (
    id, title, description, image_url, calories, protein, fat, carbs,
    cook_minutes, display_tags, filters, rating, rating_count, fingerprint, created_at
)
select recipe->>'id', recipe->>'title', recipe->>'description', recipe->>'image',
    (recipe->>'calories')::numeric, (recipe->>'protein')::numeric,
    (recipe->>'fat')::numeric, (recipe->>'carbs')::numeric, (recipe->>'cookTime')::integer,
    array(select jsonb_array_elements_text(recipe->'displayTags')), recipe->'filters',
    (recipe->>'rating')::numeric, (recipe->>'ratingCount')::integer,
    public.recipe_fingerprint(recipe->>'title', recipe->'ingredients', recipe->'filters'),
    '2026-05-19T00:00:00Z'::timestamptz - (recipe->>'id')::integer * interval '1 second'
from catalog_seed
on conflict (id) do nothing;

insert into public.recipe_ingredients (recipe_id, position, name, amount, unit)
select recipe->>'id', position, item->>'name', item->>'amount', item->>'unit'
from catalog_seed
cross join lateral jsonb_array_elements(recipe->'ingredients') with ordinality as ingredient(item, position)
on conflict (recipe_id, position) do nothing;

insert into public.recipe_steps (recipe_id, position, instruction, timer_seconds, tip, warning, image_url)
select recipe->>'id', position, item->>'text', (item->>'timerSeconds')::integer,
    item->>'tip', item->>'warning', item->>'image'
from catalog_seed
cross join lateral jsonb_array_elements(recipe->'steps') with ordinality as step(item, position)
on conflict (recipe_id, position) do nothing;

commit;
