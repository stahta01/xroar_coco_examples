#include <coco.h>
#include <stdarg.h>

int main()
{
 unsigned char ch = -1; // signed by default

 printf("ch := %d\r", (int)ch);                // -1 or 255
 printf("sizeof(int) := %d\r", sizeof(int));   // 2
 printf("sizeof(long) := %d\r", sizeof(long)); // 4
 waitkey(1);
 return 0;
}
