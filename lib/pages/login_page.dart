import 'package:flutter/material.dart';
import '../services/account_service.dart';
import 'intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1122),
      body: Stack(
        children: [

          // Background Grid
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.45),
                            blurRadius: 35,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 95,
                          height: 95,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Color(0xff42d4ff),
                            Color(0xff6d7dff),
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        "TrapendenV9",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: const Text(
                        "Masuk untuk melanjutkan",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: const Color(0xff1a2237),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.white10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.15),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: const [
                              Icon(
                                Icons.account_circle,
                                color: Color(0xff49b8ff),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "KREDENSIAL AKUN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          TextField(
  controller: usernameController,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.person_outline,
      color: Colors.white54,
    ),
    hintText: "Username",
    hintStyle: const TextStyle(
      color: Colors.white54,
    ),
    filled: true,
    fillColor: const Color(0xff10192d),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
  ),
),

const SizedBox(height: 18),

TextField(
  controller: passwordController,
  obscureText: true,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    prefixIcon: const Icon(
      Icons.lock_outline,
      color: Colors.white54,
    ),
    suffixIcon: const Icon(
      Icons.visibility_off_outlined,
      color: Colors.white54,
    ),
    hintText: "Password",
    hintStyle: const TextStyle(
      color: Colors.white54,
    ),
    filled: true,
    fillColor: const Color(0xff10192d),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
  ),
),

                          const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff38c8ff),
                                    Color(0xff6569ff),
                                  ],
                                ),
                              ),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                ),
                                icon: const Icon(Icons.login),
                                label: const Text(
                                  "MASUK",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () async {
  if (usernameController.text.trim().isEmpty ||
      passwordController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Masukkan username dan password"),
      ),
    );
    return;
  }

  final account = AccountService.accounts.firstWhere(
    (e) =>
        e.username == usernameController.text.trim() &&
        e.password == passwordController.text.trim(),
    orElse: () => Account(
      username: "",
      password: "",
      role: "",
    ),
  );

  if (account.username.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Username atau Password salah"),
      ),
    );
    return;
  }

  final prefs = await SharedPreferences.getInstance();
await prefs.setString("role", account.role);

Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => const IntroPage(),
  ),
);
},
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),

                          const Center(
                            child: Text(
                              "Belum punya akses?",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Center(
                            child: Text(
                              "BELI SEKARANG",
                              style: TextStyle(
                                color: Color(0xff49b8ff),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(
                      "© 2026 TrapendenV9",
                      style: TextStyle(
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 1;

    const gap = 30.0;

    for (double x = 0; x <= size.width; x += gap) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y <= size.height; y += gap) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
