// Type your code here, or load an example.
#include <stdint.h>
/*int example() {
    register int i asm("ebx");
    i++;
    return i;
}
*/
int test(int i){
    int returnValue = 0;
    if(i >= 65 || i <= 90){
        returnValue = 1;
    }
    else if(i >= 97 || i <= 121){
      returnValue = 2;  
    }
    else{
        returnValue = 0;
    }
    return returnValue;
}

int main(){
    int cnt = 0;
    while(cnt < 130){
        cnt++;
        int returnV = test(cnt);
        if(returnV = 0){
            printf("ho");
        }
        else{
            printf("jo");
        }
        
    }
    return 0;
}