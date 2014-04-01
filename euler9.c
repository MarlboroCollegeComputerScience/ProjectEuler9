/* euler9.c in C  
 *
 *   compile and run it (on my mac laptop)
 *   $ gcc euler9.c -o euler9
 *   ./euler9
 *   a,b,c = 200, 375, 425 ; a*b*c = 31875000     
 * 
 * Jim Mahoney | cs.marlboro.edu | April 2014 | MIT License
 */

#include <stdio.h>

int main(){
  int a, b, c, abc;
  for (a=1; a<1000; a++){
    for (b=1; b<1000; b++){
      c = 1000 - a - b;
      if ( (c>0) && (a<b) && (b<c) && (a*a + b*b == c*c) ){
	abc = a*b*c;
	printf(" a,b,c = %i, %i, %i ; a*b*c = %i \n", a, b, c, abc);
      }
    }
  }

  return 0;
}
