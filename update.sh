#!/bin/sh

# Цвета
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "${BLUE}  🚀 XRay Config Updater${NC}"
echo "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Проверка наличия файлов
echo -n "${YELLOW}📂 Проверка файлов конфигурации...${NC} "
if [ ! -d "configs" ] || [ -z "$(ls -A configs/*.json 2>/dev/null)" ]; then
    echo "${RED}❌${NC}"
    echo "${RED}Ошибка: Файлы .json не найдены в папке configs/${NC}"
    exit 1
fi
echo "${GREEN}✅${NC}"

# Копирование файлов
echo -n "${YELLOW}📋 Копирование файлов в /opt/etc/xray/configs/...${NC} "
if cp -f configs/*.json /opt/etc/xray/configs/; then
    echo "${GREEN}✅${NC}"
    echo "${GREEN}   Скопированы файлы:${NC}"
    for file in configs/*.json; do
        echo "     📄 ${file##*/}"
    done
else
    echo "${RED}❌${NC}"
    echo "${RED}Ошибка копирования файлов!${NC}"
    exit 1
fi

echo ""

# Перезапуск xray
echo -n "${YELLOW}🔄 Перезапуск XRay...${NC} "
if xkeen -restart; then
    echo "${GREEN}✅${NC}"
else
    echo "${RED}❌${NC}"
    echo "${RED}Ошибка при перезапуске XRay!${NC}"
    exit 1
fi

echo ""
echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "${GREEN}  ✨ Готово! XRay успешно перезапущен${NC}"
echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
