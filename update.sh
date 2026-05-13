#!/bin/sh

(

REPO_URL="https://github.com/beliy26/XStandartConfigs/archive/refs/heads/master.zip"
TMP_DIR="/tmp/xstandart_update"
TMP_ZIP="${TMP_DIR}/master.zip"
EXTRACT_DIR="${TMP_DIR}/XStandartConfigs-master"
TARGET_DIR="/opt/etc/xray/configs"

trap 'rm -rf "${TMP_DIR}"' EXIT

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  XRay Config Updater"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Создание временной директории
mkdir -p "${TMP_DIR}"

# Скачивание архива
echo -n "Скачивание конфигов... "
if curl -fsSL "${REPO_URL}" -o "${TMP_ZIP}"; then
    echo "OK"
else
    echo "Ошибка"
    echo "Не удалось скачать архив с GitHub!"
    exit 1
fi

# Распаковка
echo -n "Распаковка архива... "
if unzip -o "${TMP_ZIP}" -d "${TMP_DIR}" > /dev/null 2>&1; then
    echo "OK"
else
    echo "Ошибка"
    echo "Не удалось распаковать архив!"
    exit 1
fi

# Проверка наличия файлов конфигурации
echo -n "Проверка файлов конфигурации... "
if [ -z "$(ls -A "${EXTRACT_DIR}/configs/"*.json 2>/dev/null)" ]; then
    echo "Ошибка"
    echo "Файлы .json не найдены в архиве!"
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

# Бекап существующих конфигов
BACKUP_DIR="/opt/backups/xray/$(date +%Y%m%d_%H%M%S)"
if [ -n "$(ls -A "${TARGET_DIR}/"*.json 2>/dev/null)" ]; then
    echo -n "Бекап текущих конфигов в ${BACKUP_DIR}/... "
    if mkdir -p "${BACKUP_DIR}" && cp -f "${TARGET_DIR}/"*.json "${BACKUP_DIR}/"; then
        echo "OK"
    else
        echo "Ошибка"
        echo "Не удалось создать бекап!"
        exit 1
    fi
fi

# Копирование файлов
echo -n "Копирование файлов в ${TARGET_DIR}/... "
if cp -f "${EXTRACT_DIR}/configs/"*.json "${TARGET_DIR}/"; then
    echo "OK"
    echo "Скопированы файлы:"
    for file in "${EXTRACT_DIR}/configs/"*.json; do
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

)
