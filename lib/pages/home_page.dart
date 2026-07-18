import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xff00ffd5);

    return Scaffold(
      backgroundColor: const Color(0xff090b10),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset(
                "assets/images/banner.jpg",
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),

              Container(
                color: Colors.black,
                height: 35,
                child: Marquee(
                  text:
                      "🔥 TrapendenV9 • GACOR • TERUPDATE • STABIL • PREMIUM • ",
                  style: const TextStyle(
                    color: accent,
                    fontWeight: FontWeight.bold,
                  ),
                  blankSpace: 60,
                  velocity: 40,
                ),
              ),

              const SizedBox(height: 20),

              Image.asset(
                "assets/images/logo.png",
                width: 90,
              ),

              const SizedBox(height: 10),

              const Text(
                "TrapendenV9",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff151922),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: accent),
                    boxShadow: const [
                      BoxShadow(
                        color: accent,
                        blurRadius: 18,
                        spreadRadius: -12,
                      )
                    ],
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.security,
                          color: accent, size: 55),
                      SizedBox(height: 10),
                      Text(
                        "TrapendenV9 Security",
                        style: TextStyle(
                          color: accent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Selamat datang di TrapendenV9.\nNikmati fitur terbaru dengan tampilan premium.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "LOGIN TO TrapendenV9",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: accent),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "CONTACT SUPPORT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Hubungi Kami",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.telegram,
                        color: accent),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram,
                        color: accent),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.tiktok,
                        color: accent),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}               
