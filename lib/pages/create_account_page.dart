import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();

  String selectedRole = "Member";

  final roles = [
    "Member",
    "VIP",
    "Reseller",
    "Developer",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: username,
            decoration: const InputDecoration(
              labelText: "Username",
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: password,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: confirm,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Confirm Password",
            ),
          ),

          const SizedBox(height: 15),

          DropdownButtonFormField<String>(
            value: selectedRole,
            items: roles.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (v) {
              setState(() {
                selectedRole = v!;
              });
            },
          ),

          const SizedBox(height: 30),

          SizedBox(
  width: double.infinity,
  height: 58,
  child: ElevatedButton.icon(
    onPressed: () async {
      if (username.text.trim().isEmpty ||
          password.text.trim().isEmpty ||
          confirm.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Lengkapi semua data terlebih dahulu"),
          ),
        );
        return;
      }

      if (password.text != confirm.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password tidak sama"),
          ),
        );
        return;
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(
          child: CircularProgressIndicator(
            color: Colors.cyanAccent,
          ),
        ),
      );

      await Future.delayed(const Duration(seconds: 2));

      if (context.mounted) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "✅ Account ${username.text} berhasil dibuat ($selectedRole)",
            ),
          ),
        );
      }
    },
    icon: const Icon(Icons.person_add),
    label: const Text(
      "CREATE ACCOUNT",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.cyanAccent,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}
