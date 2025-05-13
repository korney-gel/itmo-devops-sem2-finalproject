# Этап 1: Сборка Go-приложения
FROM golang:1.22 AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем go.mod и go.sum и загружаем зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем исходный код
COPY . .

# Компилируем приложение
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Этап 2: Финальный образ
FROM alpine:latest

# Устанавливаем рабочую директорию
WORKDIR /app

# Создаём непривилегированного пользователя для безопасности
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Копируем скомпилированный бинарный файл из предыдущего этапа
COPY --from=builder --chown=appuser:appgroup /app/main .

# Открываем порт 8080
EXPOSE 8080

# Запускаем приложение от имени непривилегированного пользователя
USER appuser

# Команда для запуска приложения
CMD ["./main"]