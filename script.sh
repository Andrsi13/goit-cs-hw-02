#!/bin/bash

# Визначаємо масив з URL вебсайтів
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Визначаємо назву файлу логів
log_file="website_status.log"

# Очищаємо вміст файлу логів перед новим запуском
> $log_file

# Перевіряємо кожен сайт зі списку
for website in "${websites[@]}"; do
    # Виконуємо curl 
    status_code=$(curl -s -o /dev/null -w "%{http_code}" $website)
    
    if [ $status_code -eq 200 ]; then
        echo "$website is UP" | tee -a $log_file
    else
        echo "$website is DOWN" | tee -a $log_file
    fi
done

# Виводимо повідомлення про завершення роботи скрипта
echo "Результати записано у файл логів: $log_file"
