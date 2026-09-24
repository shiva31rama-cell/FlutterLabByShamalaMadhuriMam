import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WaterTrackerScreen(),
    );
  }
}

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  final int goal = 2000;
  final amountController = TextEditingController();
  int total = 0;
  int entries = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  // Read saved total and entry count from local storage.
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      total = prefs.getInt('total') ?? 0;
      entries = prefs.getInt('entries') ?? 0;
    });
  }

  // Save total and entry count locally.
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('total', total);
    await prefs.setInt('entries', entries);
  }

  void addWater() {
    final amount = int.tryParse(amountController.text);

    // Reject empty, zero and negative values.
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a value greater than 0')),
      );
      return;
    }

    setState(() {
      total += amount;
      entries++;
      amountController.clear();
    });
    saveData();
  }

  void resetWater() {
    // Show a confirmation dialog before resetting.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Water Intake'),
        content: const Text('Are you sure you want to reset today\'s intake?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                total = 0;
                entries = 0;
              });
              saveData();
              Navigator.pop(context);
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final remaining = (goal - total).clamp(0, goal);
    final percentage = ((total / goal) * 100).clamp(0, 100).round();

    return Scaffold(
      appBar: AppBar(title: const Text('Smart Water Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Daily Goal: 2000 mL',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter water in mL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: addWater, child: const Text('ADD')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: resetWater, child: const Text('RESET')),
              ],
            ),
            const SizedBox(height: 25),
            Text('Consumed: $total mL'),
            Text('Remaining: $remaining mL'),
            Text('Entries: $entries'),
            Text('Completion: $percentage%'),
            const SizedBox(height: 15),
            LinearProgressIndicator(value: percentage / 100, minHeight: 10),
          ],
        ),
      ),
    );
  }
}