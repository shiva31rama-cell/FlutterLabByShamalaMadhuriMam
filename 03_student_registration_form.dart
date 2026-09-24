import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String department = 'CSE';
  String gender = 'Male';
  bool accepted = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void submitForm() {
    // First validate all text fields.
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Terms and Conditions is required.
    if (!accepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept Terms & Conditions'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration Submitted Successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Registration')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Student name is required';
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                }

                final pattern =
                    RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

                if (!pattern.hasMatch(value.trim())) {
                  return 'Enter a valid email';
                }

                return null;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number is required';
                }

                if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  return 'Phone number must contain exactly 10 digits';
                }

                return null;
              },
            ),

            DropdownButtonFormField<String>(
              value: department,
              decoration: const InputDecoration(
                labelText: 'Department',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'CSE', child: Text('CSE')),
                DropdownMenuItem(value: 'ECE', child: Text('ECE')),
                DropdownMenuItem(value: 'EEE', child: Text('EEE')),
                DropdownMenuItem(value: 'IT', child: Text('IT')),
              ],
              onChanged: (value) {
                setState(() => department = value!);
              },
            ),

            const SizedBox(height: 12),

            const Text('Gender'),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() => gender = value!);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() => gender = value!);
                    },
                  ),
                ),
              ],
            ),

            CheckboxListTile(
              title: const Text('I accept Terms & Conditions'),
              value: accepted,
              onChanged: (value) {
                setState(() => accepted = value ?? false);
              },
            ),

            ElevatedButton(
              onPressed: submitForm,
              child: const Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
