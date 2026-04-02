# XStandartConfigs

Набор стандартных конфигураций для XRay.

## Как использовать

### Установка и обновление

**Замените `/opt/xstandart` на ваш актуальный путь!**

#### Вариант 1: Одной командой

```bash
curl -L https://github.com/beliy26/XStandartConfigs/archive/refs/tags/Latest.zip -o /tmp/xstandart.zip && unzip -o /tmp/xstandart.zip -d /tmp/ && cp -rf /tmp/XStandartConfigs-Latest/* /opt/xstandart/ && chmod +x /opt/xstandart/update.sh && rm -rf /tmp/xstandart.zip /tmp/XStandartConfigs-Latest && /opt/xstandart/update.sh
```

#### Вариант 2: По шагам

```bash

curl -L https://github.com/beliy26/XStandartConfigs/archive/refs/tags/Latest.zip -o /tmp/xstandart.zip
unzip -o /tmp/xstandart.zip -d /tmp/
cd /tmp/XStandartConfigs-Latest
chmod +x update.sh
./update.sh
```

---

**Примечание:** Скрипт `update.sh` требует наличия папки `configs/` с JSON-файлами и прав на запись в `/opt/etc/xray/configs/`.
