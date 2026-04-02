#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIGS_DIR="${SCRIPT_DIR}/configs"
TARGET_DIR="/opt/etc/xray/configs"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  XRay Config Updater"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Директория скрипта: ${SCRIPT_DIR}"
echo "Директория configs: ${CONFIGS_DIR}"
echo "Целевая директория: ${TARGET_DIR}"
echo ""

# Проверка наличия файлов
echo -n "Проверка файлов конфигурации... "
if [ ! -d "${CONFIGS_DIR}" ] || [ -z "$(ls -A ${CONFIGS_DIR}/*.json 2>/dev/null)" ]; then
    echo "Ошибка"
    echo "Ошибка: Файлы .json не найдены в папке ${CONFIGS_DIR}"
    exit 1
fi
echo "OK"

# Создание целевой директории если не существует
echo -n "Создание директории назначения... "
if [ ! -d "${TARGET_DIR}" ]; then
    mkdir -p "${TARGET_DIR}"
    echo "OK (создана)"
else
    echo "OK (существует)"
fi

# Копирование файлов
echo -n "Копирование файлов в ${TARGET_DIR}/... "
if cp -f ${CONFIGS_DIR}/*.json ${TARGET_DIR}/; then
    echo "OK"
    echo "Скопированы файлы:"
    for file in ${CONFIGS_DIR}/*.json; do
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
