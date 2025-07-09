// write a program you have to find the factorial of given number.
// 5!=5*4*3*2*1
import 'dart:io';

void main() {
  print("Enter any number: ");
  int num = int.parse(stdin.readLineSync().toString());
  int fact = 1;
  for(int i = 1; i <= num; i++) {
    fact *= i;
  }
  print("Factorial of $num is $fact");
}