#!/bin/bash
set -e

# Сборка deb-пакета
echo "Сборка deb-пакета..."

# Создание структуры директорий для пакета
mkdir -p processor_1.0/usr/local/bin
mkdir -p processor_1.0/DEBIAN

# Копирование бинарного файла в пакет
cp processor processor_1.0/usr/local/bin/

# Создание файла control с метаданными пакета
cat > processor_1.0/DEBIAN/control << 'EOC'
Package: processor
Version: 1.0
Section: utils
Priority: optional
Architecture: arm64
Depends: libc6
Maintainer: Student <student@example.com>
Description: String processor - replaces spaces with most frequent character
EOC

# Сборка deb-пакета
dpkg-deb --build processor_1.0

echo "Пакет создан: processor_1.0.deb"
