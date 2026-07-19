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
      'assets/videos/landing.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _card(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(.2),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090909),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [

            Row(
              children: [

                Image.asset(
                  "assets/images/logo.png",
                  width: 45,
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      Text(
                        "TrapendenV9",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Developer",
                        style: TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "DEVELOPER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              clipBehavior: Clip.antiAlias,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.08),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Selamat datang di TrapendenV9 Developer.",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.8,
              children: [
                _card(
                  "Online Users",
                  "1,284",
                  Icons.people,
                  Colors.cyan,
                ),
                _card(
                  "Active",
                  "ONLINE",
                  Icons.wifi,
                  Colors.green,
                ),
                _card(
                  "Version",
                  "V10",
                  Icons.android,
                  Colors.orange,
                ),
                _card(
                  "Status",
                  "Premium",
                  Icons.verified,
                  Colors.purple,
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              "Quick Actions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.bug_report),
                    label: const Text("Bug"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.info),
                    label: const Text("Info"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

const Text(
  "Latest Updates",
  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

SizedBox(
  height: 160,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Container(
        width: 260,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.new_releases,
              color: Colors.cyanAccent,
              size: 32,
            ),
            SizedBox(height: 12),
            Text(
              "Trapenden V10 Released",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "UI lebih modern dan performa lebih cepat.",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),

      Container(
        width: 260,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.greenAccent),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.security,
              color: Colors.greenAccent,
              size: 32,
            ),
            SizedBox(height: 12),
            Text(
              "Security Improved",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Sistem keamanan telah diperbarui.",
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

const SizedBox(height: 25),

Container(
  width: double.infinity,
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(.08),
    borderRadius: BorderRadius.circular(20),
  ),
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Announcement",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Text(
        "Selamat datang di Trapenden V10. Nikmati fitur terbaru dan update yang akan datang.",
        style: TextStyle(
          color: Colors.white70,
          height: 1.5,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 25),

const Text(
  "Server Status",
  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Container(
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(.08),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.white10),
  ),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Row(
            children: [
              Icon(
                Icons.cloud_done,
                color: Colors.greenAccent,
              ),
              SizedBox(width: 8),
              Text(
                "API Server",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Text(
            "ONLINE",
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const LinearProgressIndicator(
          value: 0.98,
          minHeight: 8,
          backgroundColor: Colors.white12,
          valueColor: AlwaysStoppedAnimation(
            Colors.greenAccent,
          ),
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        "Server Uptime 98%",
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 25),

const Text(
  "Premium Features",
  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

GridView.count(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: 2,
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
  childAspectRatio: 1.6,
  children: const [
    Card(
      color: Color(0xff171717),
      child: Center(
        child: ListTile(
          leading: Icon(Icons.flash_on, color: Colors.amber),
          title: Text(
            "Fast Mode",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    Card(
      color: Color(0xff171717),
      child: Center(
        child: ListTile(
          leading: Icon(Icons.security, color: Colors.cyanAccent),
          title: Text(
            "Security",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    Card(
      color: Color(0xff171717),
      child: Center(
        child: ListTile(
          leading: Icon(Icons.cloud, color: Colors.blueAccent),
          title: Text(
            "Cloud",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    Card(
      color: Color(0xff171717),
      child: Center(
        child: ListTile(
          leading: Icon(
            Icons.workspace_premium,
            color: Colors.orange,
          ),
          title: Text(
            "Premium",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  ],
),

const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff111111),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white54,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BugPage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const InfoPage(),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
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
