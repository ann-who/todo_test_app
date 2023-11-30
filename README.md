# todo_test_app

* Код разбит на слои (Clean Architecture)
* State-management реализован с использованием flutter_bloc
* Cloud Firestore вместо бэкенда

* Авторизация с помощью firebase_auth (email+password), при вводе неккоретных кредов выводится ошибка

  ![auth1](https://github.com/ann-who/todo_test_app/assets/67263836/b2d5ef21-5512-4036-8005-9e680becc8fd)
  ![auth2](https://github.com/ann-who/todo_test_app/assets/67263836/6671bec2-c3f8-4286-92e8-8f038a07d2dc)

* Смена статуса задачи возможна по свайпу вправо, либо через popup меню, либо на детальном экране задачи

  ![changeStatus](https://github.com/ann-who/todo_test_app/assets/67263836/484ea2c9-a948-4f91-9d98-bca891051293)
  ![changeStatus2](https://github.com/ann-who/todo_test_app/assets/67263836/e6b79ab8-9b8e-418b-a334-5d7b5eebea70)
  ![changeStatus3](https://github.com/ann-who/todo_test_app/assets/67263836/6e2f6475-eb6d-4d87-a0fa-3638a2949600)

* Удаление задачи по свайпу влево или через детальный экран задачи. Удалить задачу не в статусе "Новая" нельзя.

  ![delete](https://github.com/ann-who/todo_test_app/assets/67263836/92a4e17e-c6e6-4632-a2a0-c06cf1fa03b2)
  ![delete2](https://github.com/ann-who/todo_test_app/assets/67263836/94ff0bcd-f3cb-4cc6-a1e5-323a6b9a7760)

* Создать задачу можно только с заголовком (кратким описанием)

  ![create](https://github.com/ann-who/todo_test_app/assets/67263836/0843a35e-428e-4047-a395-e72bc5780839)
  ![create2](https://github.com/ann-who/todo_test_app/assets/67263836/a1fe4874-114c-49f5-b6ba-69dd27a3fce2)
  ![create3](https://github.com/ann-who/todo_test_app/assets/67263836/a8e84675-09b9-4b43-8935-7a72f5550ad8)

* Есть возможность выйти из аккаунта, а также настроить тему (по умолчанию системная) и язык

  ![profile](https://github.com/ann-who/todo_test_app/assets/67263836/ca5471d0-e0cc-4808-b0f9-7639aa36d1e8)
  ![settings](https://github.com/ann-who/todo_test_app/assets/67263836/80eea5f2-e6b3-45a4-b3c3-cfaf157d8532)
  ![settings2](https://github.com/ann-who/todo_test_app/assets/67263836/3d0c1592-8709-4c1b-b509-3422c8686098)

* Есть возможность добавить виджет на домашний экран андроида (для ios нет реализации, т.к. не могу проверить, нет мака). Количество задач обновляется, язык при изменении в настройках приложения также меняется и в виджете

  ![widget](https://github.com/ann-who/todo_test_app/assets/67263836/8696f019-5ab1-49e3-a5b7-9e78aebe6539)
  