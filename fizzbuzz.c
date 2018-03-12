#include <stdio.h>

int main() {
    int i = 1;

    while (i < 100) {
        if (i % 3) {
            printf("Fizz\n");
        } else if (i % 5) {
            printf("Buzz\n");
        } else if (i % 3 && i % 5) {
            printf("FizzBuzz\n");
        } else {
            printf("%d\n", i);
        }
        i++;
    }

    return 0;
}
