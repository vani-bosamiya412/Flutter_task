// Write a program you have to print the Fibonacci series up to user given number
import 'dart:io';

void main() {
  print("Enter any number: ");
  int num = int.parse(stdin.readLineSync().toString());
  int a = 0, b = 1;
  while(a<=num) {
    print(a);
    int temp = a + b;
    a = b;
    b = temp;
  }
}