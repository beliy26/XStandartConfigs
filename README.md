# XStandartConfigs

Набор стандартных конфигураций для XRay.

## Как использовать

### Установка и обновление

Скачайте последнюю версию, распакуйте и запустите обновление (одной командой):

```bash
wget https://github.com/beliy26/XStandartConfigs/archive/refs/tags/Latest.zip -O /tmp/xstandart.zip && unzip -o /tmp/xstandart.zip -d /tmp/ && mv /tmp/XStandartConfigs-Latest/* /path/to/XStandartConfigs/ && chmod +x /path/to/XStandartConfigs/update.sh && rm -rf /tmp/xstandart.zip /tmp/XStandartConfigs-Latest && /path/to/XStandartConfigs/update.sh
```

Или по шагам:

```bash
# 1. Скачивание и распаковка
wget https://github.com/beliy26/XStandartConfigs/archive/refs/tags/Latest.zip -O /tmp/xstandart.zip
unzip -o /tmp/xstandart.zip -d /tmp/

# 2. Перемещение файлов
mv /tmp/XStandartConfigs-Latest/* /path/to/XStandartConfigs/

# 3. Добавление прав на выполнение
chmod +x /path/to/XStandartConfigs/update.sh

# 4. Запуск обновления
./update.sh
```

---

**Примечание:** Скрипт `update.sh` требует наличия папки `configs/` с JSON-файлами и прав на запись в `/opt/etc/xray/configs/`.
