import 'dart:io';

class Bank {
  static double totalBalance = 0;
}
class BankAccount {
  final String accountHolder;
  var accountNumber;
  var balance;

  BankAccount(String this.accountHolder, int this.accountNumber, double this.balance);

  deposit(double amount) {
    if(amount > 0) {
      balance += amount;
      Bank.totalBalance += amount;
      print("Deposited ₹$amount. New balance: ₹$balance");
    } else {
      print("Invalid deposit amount.");
    }
  }

  withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdrawal amount.");
    } else if (amount > balance) {
      print("Insufficient balance. Withdrawal denied.");
    } else {
      balance -= amount;
      Bank.totalBalance -= amount;
      print("Withdrew ₹$amount. New balance: ₹$balance");
    }
  }

  checkBalance() {
    print("Current balance: ₹$balance");
  }
}

class SavingsAccount extends BankAccount {
  var int_rate;
  SavingsAccount(super.accountHolder, super.accountNumber, super.balance, double this.int_rate);

  interest() {
    double int = balance * int_rate / 100;
    deposit(int);
    print("Interest of $int applied at rate $int_rate");
  }
}

class CheckingAccount extends BankAccount {
  var overDraftLimit;
  CheckingAccount(super.accountHolder, super.accountNumber, super.balance, this.overDraftLimit);

  @override
  withdraw(double amount) {
    if (amount > 0 && amount <= balance + overDraftLimit) {
      balance -= amount;
      Bank.totalBalance -= amount;
      print("Withdrew ₹$amount with overdraft. New balance: ₹$balance");
    } else {
      print("Overdraft limit exceeded or invalid amount.");
    }
  }
}

void main() {
  BankAccount bank;
  print("Enter account holder name: ");
  String name = stdin.readLineSync().toString();

  print("Enter account number: ");
  int accNum = int.parse(stdin.readLineSync().toString());
  
  print("Enter your initial deposit: ");
  double initBal = double.parse(stdin.readLineSync().toString());
  
  print("Enter bank account type (1. Savings, 2. Checking): ");
  int type = int.parse(stdin.readLineSync().toString());

  if(type == 1) {
    print("Enter interest rate (%): ");
    double rate = double.parse(stdin.readLineSync().toString());
    bank = SavingsAccount(name, accNum, initBal, rate);
  } else if(type == 2) {
    print("Enter overdraft limit: ");
    double limit = double.parse(stdin.readLineSync().toString());
    bank = CheckingAccount(name, accNum, initBal, limit);
  } else {
    print("Invalid account typr!");
    return;
  }
  int choice;
  do {
    print("--------------Menu--------------");
    print("1. Deposit");
    print("2. Withdraw");
    print("3. Check Balance");
    if(bank is SavingsAccount) print("4. Apply Interest");
    print("5. Total Bank Balance");
    print("6. Exit");
    print("Enter your choice: ");
    choice = int.parse(stdin.readLineSync().toString());

    switch(choice) {
      case 1:
        print("Enter amount to deposit: ");
        double amount = double.parse(stdin.readLineSync().toString());
        bank.deposit(amount);
        break;
      
      case 2:
        print("Enter amount to withdraw: ");
        double amount = double.parse(stdin.readLineSync().toString());
        bank.withdraw(amount);
        break;

      case 3:
        bank.checkBalance();
        break;

      case 4:
        if(bank is SavingsAccount) {
          bank.interest();
        } else {
          print("Invalid choice for this account type.");
        }
        break;

      case 5:
        print("Total bank balance: ${Bank.totalBalance}");
        break;

      case 6:
        print("Exited.");
        return;

      default:
        print("Invalid choice!");
    }
  } while(choice != 0);
}