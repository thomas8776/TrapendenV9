import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'bug_page.dart';
import 'info_page.dart';
import 'tools_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late VideoPlayerController _controller;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      "assets/videos/landing.mp4",
    )
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }

        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget dashboardCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff141d2f),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: color.withOpacity(.35),
        ),
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget actionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff141d2f),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: color.withOpacity(.30),
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor:
                  color.withOpacity(.15),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [

// ================= HEADER =================

Row(
  children: [
    const Icon(
      Icons.menu_rounded,
      color: Colors.white,
      size: 28,
    ),

    const SizedBox(width: 15),

    Image.asset(
      "assets/images/logo.png",
      width: 55,
      height: 55,
    ),

    const SizedBox(width: 15),

    const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "TrapendenV10",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4),

          Text(
            "Cyber Developer",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),

        ],
      ),
    ),

    Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        "ONLINE",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

const SizedBox(height: 25),

// ================= VIDEO =================

ClipRRect(
  borderRadius: BorderRadius.circular(25),
  child: SizedBox(
    height: 210,
    child: _controller.value.isInitialized
        ? VideoPlayer(_controller)
        : const Center(
            child: CircularProgressIndicator(),
          ),
  ),
),

const SizedBox(height: 25),

// ================= WELCOME =================

Container(
  padding: const EdgeInsets.all(22),
  decoration: BoxDecoration(
    color: const Color(0xff141d2f),
    borderRadius: BorderRadius.circular(25),
    border: Border.all(
      color: Colors.cyanAccent.withOpacity(.30),
    ),
  ),
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(
        "WELCOME BACK 👋",
        style: TextStyle(
          color: Colors.white54,
          letterSpacing: 1,
        ),
      ),

      SizedBox(height: 10),

      Text(
        "Trapenden Developer",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),

      SizedBox(height: 18),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            children: [
              Text(
                "MEMBER",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 5),
              Text(
                "PREMIUM",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Column(
            children: [
              Text(
                "STATUS",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 5),
              Text(
                "ONLINE",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Column(
            children: [
              Text(
                "EXPIRE",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 5),
              Text(
                "2029",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

        ],
      ),
    ],
  ),
),

const SizedBox(height: 22),

dashboardCard(
  title: "Online Users",
  value: "1,284",
  icon: Icons.people,
  color: Colors.cyan,
),

const SizedBox(height: 12),

dashboardCard(
  title: "Server",
  value: "ONLINE",
  icon: Icons.cloud_done,
  color: Colors.green,
),

const SizedBox(height: 28),
const Text(
  "Quick Actions",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 18),

GridView.count(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: 2,
  crossAxisSpacing: 14,
  mainAxisSpacing: 14,
  childAspectRatio: 1.05,
  children: [

    actionCard(
      title: "Bug",
      icon: Icons.bug_report,
      color: Colors.redAccent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const BugPage(),
          ),
        );
      },
    ),

    actionCard(
      title: "Info",
      icon: Icons.info,
      color: Colors.cyanAccent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const InfoPage(),
          ),
        );
      },
    ),

    actionCard(
      title: "Tools",
      icon: Icons.build,
      color: Colors.orange,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ToolsPage(),
          ),
        );
      },
    ),

    actionCard(
      title: "Premium",
      icon: Icons.workspace_premium,
      color: Colors.purpleAccent,
      onTap: () {},
    ),

  ],
),

const SizedBox(height: 30),

const Text(
  "Latest Updates",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: const Color(0xff141d2f),
    borderRadius: BorderRadius.circular(22),
  ),
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Row(
        children: [

          Icon(
            Icons.campaign,
            color: Colors.cyanAccent,
          ),

          SizedBox(width: 10),

          Text(
            "Trapenden V10",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),

      SizedBox(height: 14),

      Text(
        "Dashboard baru telah menggunakan tampilan Cyber UI dengan performa yang lebih baik.",
        style: TextStyle(
          color: Colors.white70,
          height: 1.6,
        ),
      ),

    ],
  ),
),

const SizedBox(height: 30),
const Text(
  "Weather",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Container(
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    color: const Color(0xff141d2f),
    borderRadius: BorderRadius.circular(22),
  ),
  child: const Row(
    children: [

      Icon(
        Icons.wb_sunny,
        color: Colors.orange,
        size: 45,
      ),

      SizedBox(width: 18),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Bandung",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 4),

            Text(
              "27°C • Cerah",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),

          ],
        ),
      ),

    ],
  ),
),

const SizedBox(height: 30),

const Text(
  "Server Status",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

dashboardCard(
  title: "API Response",
  value: "98%",
  icon: Icons.speed,
  color: Colors.greenAccent,
),

const SizedBox(height: 12),

dashboardCard(
  title: "Ping",
  value: "21 ms",
  icon: Icons.network_check,
  color: Colors.cyanAccent,
),

const SizedBox(height: 30),

const Text(
  "Premium Features",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Wrap(
  spacing: 10,
  runSpacing: 10,
  children: const [

    Chip(
      label: Text("Cyber UI"),
    ),

    Chip(
      label: Text("Fast Login"),
    ),

    Chip(
      label: Text("VIP"),
    ),

    Chip(
      label: Text("Cloud"),
    ),

    Chip(
      label: Text("Developer"),
    ),

    Chip(
      label: Text("Premium"),
    ),

  ],
),

const SizedBox(height: 35),
const Center(
  child: Text(
    "© 2026 Trapenden V10",
    style: TextStyle(
      color: Colors.white38,
      fontSize: 13,
    ),
  ),
),

const SizedBox(height: 20),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xff111111),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white54,

        onTap: (index) {
          setState(() => _currentIndex = index);

          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const BugPage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const InfoPage(),
              ),
            );
          }

          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ToolsPage(),
              ),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: "Bug",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: "Tools",
          ),
        ],
      ),
    );
  }
}
