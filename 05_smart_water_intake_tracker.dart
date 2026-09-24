import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

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
  // Daily hydration goal in millilitres.
  final int goal = 2000;

  // Reads the water amount entered by the user.
  final TextEditingController amountController = TextEditingController();

  int total = 0;
  int entries = 0;

  // Use today's date so old days do not get counted as today's intake.
  String get todayKey => DateTime.now().toIso8601String().split('T').first;

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

  // Load today's saved total and entry count from local storage.
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      total = prefs.getInt('water_total_$todayKey') ?? 0;
      entries = prefs.getInt('water_entries_$todayKey') ?? 0;
    });
  }

  // Save today's total and entry count locally.
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('water_total_$todayKey', total);
    await prefs.setInt('water_entries_$todayKey', entries);
  }

  void addWater() {
    final int? amount = int.tryParse(amountController.text.trim());

    // Do not allow empty, zero or negative values.
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a water value greater than 0'),
        ),
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
    // Ask for confirmation before resetting today's data.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Water Intake'),
        content: const Text(
          "Are you sure you want to reset today's intake?",
        ),
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
    // Remaining water cannot become negative after reaching the goal.
    final int remaining = (goal - total).clamp(0, goal);

    // Completion is limited to a maximum of 100%.
    final int percentage = ((total / goal) * 100).clamp(0, 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Water Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Daily Goal: 2000 mL',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
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

            // ADD and RESET buttons are placed in one row.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: addWater,
                  child: const Text('ADD'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: resetWater,
                  child: const Text('RESET'),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text('Consumed: $total mL'),
            Text('Remaining: $remaining mL'),
            Text('Entries: $entries'),
            Text('Completion: $percentage%'),

            const SizedBox(height: 15),

            LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 10,
            ),
          ],
        ),
      ),
    );
  }
}
