#!/bin/bash
set -e

echo "Сборка программы..."
make clean
make
echo "Сборка завершена"
