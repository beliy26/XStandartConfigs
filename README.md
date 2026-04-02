# XStandartConfigs

Набор стандартных конфигураций для XRay.

## Как использовать

### Установка и обновление

#### Вариант 1: Одной командой

```bash
curl -L https://github.com/beliy26/XStandartConfigs/archive/refs/tags/latest.zip -o /tmp/xstandart.zip && unzip -o /tmp/xstandart.zip -d /tmp/ && cd /tmp/XStandartConfigs-latest && chmod +x update.sh && ./update.sh
```

#### Вариант 2: По шагам

```bash
# 1. Скачивание
curl -L https://github.com/beliy26/XStandartConfigs/archive/refs/tags/latest.zip -o /tmp/xstandart.zip

# 2. Распаковка
unzip -o /tmp/xstandart.zip -d /tmp/

# 3. Переход в директорию
cd /tmp/XStandartConfigs-latest

# 4. Добавление прав на выполнение
chmod +x update.sh

# 5. Запуск обновления
./update.sh
```

---

**Примечание:** Скрипт `update.sh` требует наличия прав на запись в `/opt/etc/xray/configs/`.
