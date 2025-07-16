import 'dart:io';

void main() {
  String uname = "tops";
  String pass = "1234";

  print("Enter your username: ");
  String username = stdin.readLineSync().toString();

  print("Enter your password: ");
  String password = stdin.readLineSync().toString();

  if(username != uname || password != pass) {
    print("Invalid username or password!");
    return;
  } else {
    print("Enter your table number: ");
    int tno = int.parse(stdin.readLineSync().toString());

    int total = 0;
    String bill = "---------------------BILL---------------------\n\nTable No: $tno\n\n";

    while(true) {
      print("---------------------MENU---------------------");
      print("1. Pizza - Rs. 150");
      print("2. Burger - Rs. 120");
      print("3. Pasta - Rs. 100");
      print("4. Sandwich - Rs. 90");
      print("5. Fries - Rs. 70");
      print("6. Cold Drink - Rs. 50");
      print("7. Generate bill");

      print("Enter your choice: ");
      int choice = int.parse(stdin.readLineSync().toString());

      switch(choice) {
        case 1:
          bill += "\nPizza - Rs. 150";
          total += 150;
          break;
        case 2:
          bill += "\nBurger - Rs. 120";
          total += 120;
          break;
        case 3:
          bill += "\nPasta - Rs. 100";
          total += 100;
          break;
        case 4:
          bill += "\nSandwich - Rs. 90";
          total += 90;
          break;
        case 5:
          bill += "\nFries - Rs. 70";
          total += 70;
          break;
        case 6:
          bill += "\nCold Drink - Rs. 50";
          total += 50;
          break;
        case 7:
          bill += "\n\n----------------------------------------------\n\nTotal Bill: Rs.$total\n";
          String path = "D:\\bill.txt";
          var f = File(path);
          f.writeAsString(bill);
          print(bill);
          print("Bill saved successfully to: $path");
          return;
        default:
          print("Invalid item");
      }
    }
  }
}