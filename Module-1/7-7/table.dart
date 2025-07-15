// Write a program you have to print the table of given number.
import 'dart:io';

void main() {
  print("Enter any number: ");
  int num = int.parse(stdin.readLineSync().toString());
  for(int i = 1; i <= 10; i++) {
    int ans = num * i;
    print("$num * $i = $ans");
  }
}