/* euler9.c in C  
 *
 *   compile and run it (on my mac laptop)
 *   $ gcc euler9.c -o euler9
 *   $ time ./euler9
 *   a,b,c = 200, 375, 425 ; a*b*c = 31875000     
 *   user 0m0.006s
 * 
 * Jim Mahoney | cs.marlboro.edu | April 2014 | MIT License
 */

#include <stdio.h>

int pythagorean(int a, int b, int c){
  return a*a + b*b == c*c;
}

void search(int perimeter){
  int a, b, c, abc;
  for (a=1; a<perimeter; a++){
    for (b=1+a; b<perimeter; b++){
      c = perimeter - a - b;
      if ( c>0 && pythagorean(a,b,c) ){
	abc = a*b*c;
	printf("a,b,c = %i, %i, %i ; a*b*c = %i \n", a, b, c, abc);
      }
    }
  }
}

int main(){
  search(1000);
  return 0;
}
