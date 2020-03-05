#include <stdio.h>
#include <ctype.h>

int main(void){
    char input[] = "\"This is a test. 1 2 3 4 5 !!\"" ;

    int i;
    int counter = 0;
    for( i = 0; i < sizeof(input); i++){
        if ( ispunct(input[i]) )
            counter++;
    }
    printf("%d",counter);
    return 0;
}
