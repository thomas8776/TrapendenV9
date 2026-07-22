import 'package:flutter/material.dart';
import '../services/account_service.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();

  String currentRole = "Developer";
  String selectedRole = "Member";

  List<String> get roles {
  if (currentRole == "Developer") {
    return [
      "Member",
      "VIP",
      "Reseller",
      "Developer",
    ];
  }

  if (currentRole == "Reseller") {
    return [
      "Member",
      "VIP",
    ];
  }

  return [];
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      
            appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "CREATE ACCOUNT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          Center(
            child: ClipOval(
              child: Image.asset(
                "assets/images/logo.png",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "CREATE ACCOUNT",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.cyanAccent.withOpacity(.35),
              ),
            ),
            child: Column(
              children: [

                TextField(
                  controller: username,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle:
                        const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.cyanAccent,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.cyanAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.cyanAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
  controller: password,
  obscureText: true,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    labelText: "Password",
    labelStyle: const TextStyle(color: Colors.white70),
    prefixIcon: const Icon(
      Icons.lock,
      color: Colors.cyanAccent,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.cyanAccent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.cyanAccent,
        width: 2,
      ),
    ),
  ),
),

const SizedBox(height: 18),

TextField(
  controller: confirm,
  obscureText: true,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    labelText: "Confirm Password",
    labelStyle: const TextStyle(color: Colors.white70),
    prefixIcon: const Icon(
      Icons.lock_outline,
      color: Colors.cyanAccent,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.cyanAccent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.cyanAccent,
        width: 2,
      ),
    ),
  ),
),

const SizedBox(height: 18),

DropdownButtonFormField<String>(
  value: selectedRole,
  dropdownColor: const Color(0xff111111),
  decoration: InputDecoration(
    labelText: "Role",
    labelStyle: const TextStyle(color: Colors.white70),
    prefixIcon: const Icon(
      Icons.admin_panel_settings,
      color: Colors.cyanAccent,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.cyanAccent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.cyanAccent,
        width: 2,
      ),
    ),
  ),
  items: roles.map((role) {
    return DropdownMenuItem(
      value: role,
      child: Text(role),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedRole = value!;
    });
  },
),

const SizedBox(height: 30),

SizedBox(
  width: double.infinity,
  height: 58,
  child: ElevatedButton.icon(
    onPressed: () async {

    if (currentRole == "Member" || currentRole == "VIP") {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Anda tidak memiliki akses untuk membuat akun.",
      ),
    ),
  );
  return;
}

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

AccountService.accounts.add(
  Account(
    username: username.text.trim(),
    password: password.text.trim(),
    role: selectedRole,
  ),
);

await AccountService.saveAccounts();

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

      if (!context.mounted) return;

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "✅ Account ${username.text} berhasil dibuat ($selectedRole)",
          ),
        ),
      );

      username.clear();
      password.clear();
      confirm.clear();

      setState(() {
        selectedRole = "Member";
      });
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
          ),
        ],
      ),
    );
  }
}
