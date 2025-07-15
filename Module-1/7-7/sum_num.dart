// Write a program make a summation of given number(E.g. 1523 ans :-11)
import 'dart:io';

void main() {
  print("Enter any number: ");
  int num = int.parse(stdin.readLineSync().toString());
  int sum = 0;
  while(num>0) {
    int rem = num % 10;
    sum += rem;
    num = num ~/ 10;
  }
  print("The sum is $sum");
}