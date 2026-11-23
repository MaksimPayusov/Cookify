# Cookify

React + TypeScript + Vite для интерфейса. Supabase Auth для входа и подтверждения почты. PostgreSQL хранит общий каталог, ингредиенты, шаги и избранное по аккаунтам. Обложки новых рецептов и аватары загружаются в Supabase Storage.

## Опубликованная версия команды

Сайт: https://cookify-project.netlify.app

Общий проект Supabase: `Cookify` в организации `Senior Pomidor Team`, идентификатор `sndefntxsbwilhkasrfv`. Таблицы, правила доступа, хранилище и 36 исходных рецептов уже установлены. Повторно запускать миграции на этом проекте не нужно.

Для подключения копии из архива создайте `.env.local` в папке с `package.json`:

```dotenv
VITE_SUPABASE_URL=https://sndefntxsbwilhkasrfv.supabase.co
VITE_SUPABASE_PUBLISHABLE_KEY=sb_publishable_MjdCflE6khj5aL1SuSWGYg_VE15TdaG
```

Это публичные параметры фронтенда, права доступа ограничивает RLS в БД. Затем выполните `npm ci` и `npm run dev`. Копии команды будут работать с общим каталогом и аккаунтами.

На 20 ноября 2026 Gmail SMTP подключён от имени `cookify.project@gmail.com`. Проверены доставка письма на тестовый адрес командной почты, подтверждение email и вход по паролю. Письмо содержит 8-значный код, форма регистрации и локальная конфигурация Supabase используют ту же длину. Пароль приложения Google хранится только в настройках SMTP Supabase; добавлять его в исходники, архив или переменные Vite не нужно.

## Подготовить общий Supabase для команды

1. Создайте проект в [Supabase](https://supabase.com/dashboard). Одного проекта достаточно для общего каталога и аккаунтов всей команды.
2. В **SQL Editor** нового проекта запустите по очереди файлы из папки [supabase/migrations](supabase/migrations). Сначала `20261115000100_schema.sql`, затем `20261115000200_seed.sql`. Первый создаёт таблицы, правила доступа и хранилище, второй добавляет 36 исходных рецептов. Миграции можно также применить Supabase CLI командой `supabase db push` после `supabase link`.
3. В настройках подключения проекта скопируйте **Project URL** и **Publishable key**. Они используются во фронтенде и подходят для передачи команде. Пароль БД и ключи `sb_secret_…` / `service_role` держите на стороне администратора.
4. В **Authentication → Sign In / Providers → Email** включите регистрацию по паролю и подтверждение email и задайте длину OTP **8 цифр**, чтобы она совпадала с формой регистрации. После подключения SMTP в **Authentication → Emails → Templates → Confirm sign up** вставьте содержимое [confirmation.html](supabase/templates/confirmation.html). Шаблон передаёт пользователю код из `{{ .Token }}`, который вводится в форме регистрации. На текущем Free без собственного SMTP панель не позволяет редактировать шаблон.
5. Для регистрации участников с обычными адресами подключите свой SMTP в Supabase. Встроенный почтовый сервис Supabase отправляет письма только на адреса участников панели проекта. Для быстрой проверки входа можно заранее создать и подтвердить демонстрационный аккаунт в **Authentication → Users**.
6. В **Authentication → URL Configuration** задайте адрес опубликованного сайта в **Site URL**. Пока разрабатываете локально, используйте `http://localhost:5173`. Если нужны оба адреса, добавьте локальный URL в **Redirect URLs**.

Документация Supabase: [настройка проекта и публичного ключа](https://supabase.com/docs/guides/getting-started/quickstarts/reactjs), [шаблоны писем](https://supabase.com/docs/guides/auth/auth-email-templates), [SMTP](https://supabase.com/docs/guides/auth/auth-smtp).

## Запустить локально

Установите Node.js 22 LTS или новее. Распакуйте архив, откройте папку с `package.json` и выполните:

```bash
cp .env.example .env.local
npm ci
```

Откройте `.env.local` и подставьте значения из Supabase:

```dotenv
VITE_SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co
VITE_SUPABASE_PUBLISHABLE_KEY=sb_publishable_REPLACE_ME
```

```bash
npm run dev
```

Откройте [http://localhost:5173](http://localhost:5173). Для локальной базы с тестовой почтой можно запустить Docker и выполнить `supabase start` из этой же папки. CLI применит обе миграции. Подставьте локальные URL и Publishable key из вывода CLI в `.env.local`. Веб-интерфейс Inbox (Mailpit) покажет письма с кодами. Остановка через `supabase stop`.

## Выложить на Netlify

**Из архива через Netlify Drop.** Заполните `.env.local` данными облачного Supabase и выполните `npm ci` и `npm run build`. Загрузите получившуюся папку `dist` в [Netlify Drop](https://app.netlify.com/drop). При необходимости нажмите **Publish**, чтобы открыть доступ по публичной ссылке. После публикации внесите адрес сайта в **Authentication → URL Configuration** в Supabase.

**Автодеплой из Git.** Поместите файлы проекта в корень репозитория и подключите его в Netlify. В **Project configuration → Environment variables** добавьте `VITE_SUPABASE_URL` и `VITE_SUPABASE_PUBLISHABLE_KEY` и запустите деплой. На Free подойдёт область по умолчанию, а на Pro переменные можно ограничить областью **Builds**. `netlify.toml` задаёт Node.js 22, `npm run build` и папку публикации `dist`. Если проект находится в подпапке, укажите её как **Base directory**.

Vite считывает переменные при сборке. После изменения URL или ключа пересоберите сайт. Правило из `public/_redirects` автоматически попадёт в `dist`, поэтому прямые ссылки на рецепты, вход и профиль работают после обновления страницы.

[Netlify Drop](https://docs.netlify.com/start/quickstarts/netlify-drop-quickstart/) · [Vite на Netlify](https://docs.netlify.com/build/frameworks/framework-setup-guides/vite/) · [Переменные окружения](https://docs.netlify.com/build/environment-variables/overview/#scopes)

## Проверить после запуска

1. Откройте каталог без входа. Должно быть 36 исходных рецептов.
2. Зарегистрируйтесь, введите код из письма, выйдите и снова войдите по email и паролю.
3. Опубликуйте рецепт с обложкой, тремя ингредиентами, тремя шагами и тегами. Откройте ссылку на рецепт в приватном окне браузера.
4. Добавьте рецепт в избранное, зайдите в свой аккаунт во втором браузере и проверьте вкладку «Избранное». Другой аккаунт увидит свой список.

Подробные шаги в исходном каталоге есть у сырного крем-супа. Для остальных исходных рецептов интерфейс показывает шаблонные шаги. У опубликованных командой рецептов отображаются шаги автора. Существующие черновики, исключения, история готовки и оценки хранятся в браузере. Для пользователей старого прототипа потребуется регистрация в Supabase.

Команды разработки: `npm run lint`, `npm run build`. Команда `npm run seed:generate` обновляет SQL с исходным каталогом из `src/data/recipes.ts` для установки на новую базу.
