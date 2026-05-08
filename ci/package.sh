#!/bin/bash
set -e

echo "Сборка deb-пакета..."

# Определяем архитектуру
ARCH=$(dpkg --print-architecture)
echo "Архитектура: $ARCH"

# Создаём структуру
mkdir -p processor_1.0/usr/local/bin
mkdir -p processor_1.0/DEBIAN

# Копируем бинарник
cp processor processor_1.0/usr/local/bin/

# Создаём control файл с правильной архитектурой
cat > processor_1.0/DEBIAN/control << EOC
Package: processor
Version: 1.0
Section: utils
Priority: optional
Architecture: $ARCH
Depends: libc6
Maintainer: Student <student@example.com>
Description: String processor - replaces spaces with most frequent character
EOC

# Собираем пакет
dpkg-deb --build processor_1.0

echo "Пакет создан: processor_1.0.deb ($ARCH)"
