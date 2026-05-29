class WalletService {
  double balance = 0;
  List<double> transactions = [];

  void deposit(double amount) {
    balance += amount;
    transactions.add(amount);
  }

  void withdraw(double amount) {
    balance -= amount;
    transactions.add(-amount);
  }
}