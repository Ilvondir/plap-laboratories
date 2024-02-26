#include<stdio.h>
#include<math.h>

int main()
{
  float a = 0, b, c, delta, x1, x2;

  printf("Podaj wspó³czynniki trójmianu\n");
  
  while (a == 0) {
  	printf("a = ");
  	scanf("%f", &a);
  }
  printf("b = ");
  scanf("%f", &b);
  printf("c = ");
  scanf("%f", &c);

  delta = b * b - 4.0 * a * c;
  if (delta >= 0.0)
  {
    x1 = (-b - sqrt(delta))/(2.0 * a);
    x2 = (-b + sqrt(delta))/(2.0 * a);
    printf("Pierwiastkami s± liczby %.2f, %.2f\n", x1, x2);
  }
  else {
  	printf("Brak pierwiastow rzeczywistych.\n");
  }

  return 0;
}
