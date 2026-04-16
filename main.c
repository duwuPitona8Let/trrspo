#include <stdio.h>
#include <string.h>

#define MAX_LEN 1024

void process_string(char *str) {
    int freq[256] = {0};
    int len = strlen(str);
    
    for (int i = 0; i < len; i++) {
        if (str[i] != ' ') {
            freq[(unsigned char)str[i]]++;
        }
    }
    
    char best_char = ' ';
    int best_count = 0;
    for (int c = 0; c < 256; c++) {
        if (c != ' ' && freq[c] > best_count) {
            best_count = freq[c];
            best_char = (char)c;
        }
    }
    
    if (best_count == 0) return;
    
    for (int i = 0; i < len; i++) {
        if (str[i] == ' ') str[i] = best_char;
    }
}

int main(int argc, char *argv[]) {
    char input[MAX_LEN];
    
    if (argc > 1) {
        strncpy(input, argv[1], MAX_LEN - 1);
        input[MAX_LEN - 1] = '\0';
    } else {
        printf("Введите строку: ");
        if (!fgets(input, MAX_LEN, stdin)) return 1;
        input[strcspn(input, "\n")] = '\0';
    }
    
    char output[MAX_LEN];
    strcpy(output, input);
    process_string(output);
    
    printf("Исходная строка: %s\n", input);
    printf("Результат:        %s\n", output);
    
    return 0;
}
