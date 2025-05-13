# Этап 1: Сборка Angular-приложения
FROM node:16 AS builder

# Устанавливаем рабочую директорию
WORKDIR /usr/src/app

# Копируем файлы package.json и package-lock.json и устанавливаем зависимости
COPY package*.json ./
RUN npm install \
    && npm install -g @angular/cli \
    && npm list @angular/cli \
    && ng version

# Копируем остальной код фронтенда и выполняем сборку
COPY . .
RUN npm run build -- --configuration production \
    && ls -la /usr/src/app \
    && ls -la /usr/src/app/dist \
    && ls -la /usr/src/app/dist/frontend || echo "Папка dist/frontend не найдена"

# Этап 2: Сервер Nginx для раздачи статических файлов
FROM nginx:alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Создаём пользователя для безопасности
RUN addgroup --system nginxuser \
    && adduser -S -s /bin/false -G nginxuser nginxuser -D -H \
    && mkdir -p /logs \
    && chown -R nginxuser:nginxuser /logs

# Копируем скомпилированные файлы из этапа сборки
COPY --chown=nginxuser:nginxuser --from=builder /usr/src/app/dist/frontend /usr/share/nginx/html

# Копируем шаблон конфигурации Nginx
COPY --chown=nginxuser:nginxuser nginx.tmpl /etc/nginx/templates/default.conf.template

# Открываем порт 80
EXPOSE 80

# Запускаем как пользователь nginxuser
USER nginxuser

# Запускаем Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]