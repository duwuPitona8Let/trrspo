#!/bin/bash
set -e

echo "Запуск тестов..."

echo " Тест 1 "
./processor "your mama dont likes me she likes every one"

echo ""
echo "Тест 2"
./processor "hello world test"

echo ""
echo "Тест 3"
./processor "a b c a b a"

echo "Все тесты пройдены"
