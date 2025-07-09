// Write a program to print the number in reverse order.
import 'dart:io';

void main() {
  print("Enter any number: ");
  int num = int.parse(stdin.readLineSync().toString());
  int rev = 0;

  while(num>0) {
    int a = num % 10;
    rev = rev * 10 + a;
    num ~/= 10;
  }
  print("Reversed order is $rev");
}