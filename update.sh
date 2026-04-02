#!/bin/sh

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  XRay Config Updater"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Проверка наличия файлов
echo -n "Проверка файлов конфигурации... "
if [ ! -d "configs" ] || [ -z "$(ls -A configs/*.json 2>/dev/null)" ]; then
    echo "Ошибка"
    echo "Ошибка: Файлы .json не найдены в папке configs/"
    exit 1
fi
echo "OK"

# Копирование файлов
echo -n "Копирование файлов в /opt/etc/xray/configs/... "
if cp -f configs/*.json /opt/etc/xray/configs/; then
    echo "OK"
    echo "Скопированы файлы:"
    for file in configs/*.json; do
        echo "  ${file##*/}"
    done
else
    echo "Ошибка"
    echo "Ошибка копирования файлов!"
    exit 1
fi

echo ""

# Перезапуск xray
echo -n "Перезапуск XRay... "
if xkeen -restart; then
    echo "OK"
else
    echo "Ошибка"
    echo "Ошибка при перезапуске XRay!"
    exit 1
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Готово! XRay успешно перезапущен"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
