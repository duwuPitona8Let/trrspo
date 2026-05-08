FROM ubuntu:22.04

# Копируем deb-пакет
COPY processor_1.0.deb /tmp/processor_1.0.deb

# Устанавливаем пакет
RUN apt update && \
    apt install -y /tmp/processor_1.0.deb && \
    rm /tmp/processor_1.0.deb && \
    rm -rf /var/lib/apt/lists/*

# Точка входа
ENTRYPOINT ["processor"]
CMD ["--help"]
