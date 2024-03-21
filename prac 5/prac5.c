#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

bool parser_E(char *input, int *index);
bool parser_EE(char *input, int *index);

bool parser_EE(char *input, int *index) {
    if (input[*index] == '+' || input[*index] == '-') {
        (*index)++;
        return parser_E(input, index);
    } else {
        return false;
    }
}

bool parser_E(char *input, int *index) {
    if (input[*index] == 'a' || input[*index] == 'b') {
        (*index)++;
        return true;
    } else if (input[*index] == '+' || input[*index] == '-') {
        (*index)++;
        return parser_EE(input, index) && parser_E(input, index);
    } else {
        return false;
    }
}

int main() {
    char input[100]; // Adjust the size according to your needs
    int index = 0;
    
    printf("Enter the input string:\n");
    scanf("%s", input);
    
    bool success = parser_E(input, &index);
    if (success && index == strlen(input)) {
        printf("The input string can be accepted using the grammar.\n");   
    } else {
        printf("The input string cannot be accepted using the grammar.\n");
    }
        
    return 0;
}
