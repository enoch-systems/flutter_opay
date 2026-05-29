import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final user = auth.user;

    return Scaffold(
      appBar: AppBar(title: const Text("Wallet")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, $user",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Balance",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "₦${auth.wallet.balance}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthProvider>().deposit(1000);
                  },
                  child: const Text("Deposit"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthProvider>().withdraw(500);
                  },
                  child: const Text("Withdraw"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Transactions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: auth.wallet.transactions.length,
                itemBuilder: (context, index) {
                  final t = auth.wallet.transactions[index];

                  return ListTile(
                    leading: Icon(
                      t >= 0 ? Icons.arrow_downward : Icons.arrow_upward,
                      color: t >= 0 ? Colors.green : Colors.red,
                    ),
                    title: Text(
                      t >= 0 ? "Deposit" : "Withdraw",
                    ),
                    trailing: Text(
                      "₦${t.abs()}",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}