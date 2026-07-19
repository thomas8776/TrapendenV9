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
  late VideoPlayerController _videoController;
  late PageController _bannerController;

  int _bannerIndex = 0;
  int _currentNav = 0;

  @override
  void initState() {
    super.initState();

    _bannerController = PageController();

    _videoController = VideoPlayerController.asset(
      "assets/videos/landing.mp4",
    )
      ..initialize().then((_) {
        _videoController
          ..setLooping(true)
          ..setVolume(0)
          ..play();

        if (mounted) setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _bannerController.dispose();
    super.dispose();
  }

  // ================= HEADER =================

  Widget buildHeader() {
  return Row(
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff18243f),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
      ),

      const SizedBox(width: 15),

      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(.35),
              blurRadius: 18,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            "assets/images/logo.png",
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
      ),

      const SizedBox(width: 15),

      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trapenden V10",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Cyber Developer",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13,
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
          color: Colors.green.shade600,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.circle,
              color: Colors.white,
              size: 10,
            ),
            SizedBox(width: 6),
            Text(
              "ONLINE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

  // ================= VIDEO =================

  Widget buildVideo() {
  return Column(
    children: [
      const SizedBox(height: 25),

      ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 210,
          width: double.infinity,
          color: Colors.black,
          child: _videoController.value.isInitialized
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoController.value.size.width,
                    height: _videoController.value.size.height,
                    child: VideoPlayer(_videoController),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    ],
  );
}

  // ================= BANNER =================

  Widget buildBanner() {
  final banners = [
    {
      "title": "🔥 Trapenden V10",
      "subtitle": "Premium Dashboard",
      "c1": const Color(0xff00BCD4),
      "c2": const Color(0xff1565C0),
    },
    {
      "title": "⚡ Fast & Smooth",
      "subtitle": "Optimized Performance",
      "c1": const Color(0xff7B1FA2),
      "c2": const Color(0xff512DA8),
    },
    {
      "title": "🛡 Secure System",
      "subtitle": "Cyber Security Ready",
      "c1": const Color(0xff00C853),
      "c2": const Color(0xff009688),
    },
  ];

  return Column(
    children: [
      const SizedBox(height: 25),

      SizedBox(
        height: 170,
        child: PageView.builder(
          controller: _bannerController,
          itemCount: banners.length,
          onPageChanged: (i) {
            setState(() => _bannerIndex = i);
          },
          itemBuilder: (_, index) {
            final item = banners[index];

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  colors: [
                    item["c1"] as Color,
                    item["c2"] as Color,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item["title"] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item["subtitle"] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      const SizedBox(height: 12),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          banners.length,
          (i) => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _bannerIndex == i ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: _bannerIndex == i
                  ? Colors.white
                  : Colors.white38,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    ],
  );
}

  // ================= WELCOME =================

  Widget buildWelcome() {
  return Container(
    margin: const EdgeInsets.only(top: 25),
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: const Color(0xff141d2f),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: Colors.cyanAccent.withOpacity(.20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "WELCOME BACK 👋",
          style: TextStyle(
            color: Colors.white54,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Trapenden Developer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [

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
                  "SYSTEM",
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
                  "LICENSE",
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(height: 5),
                Text(
                  "2029",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

          ],
        ),
      ],
    ),
  );
}

  // ================= DASHBOARD =================

  Widget buildDashboard() {
  Widget card({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xff141d2f),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.cyanAccent.withOpacity(.18),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  return Column(
    children: [

      const SizedBox(height: 20),

      Row(
        children: [
          card(
            icon: Icons.people,
            title: "Users",
            value: "1,284",
            color: Colors.cyan,
          ),
          const SizedBox(width: 15),
          card(
            icon: Icons.cloud_done,
            title: "Server",
            value: "ONLINE",
            color: Colors.green,
          ),
        ],
      ),

      const SizedBox(height: 15),

      Row(
        children: [
          card(
            icon: Icons.security,
            title: "Security",
            value: "SAFE",
            color: Colors.orange,
          ),
          const SizedBox(width: 15),
          card(
            icon: Icons.android,
            title: "Version",
            value: "V10",
            color: Colors.purpleAccent,
          ),
        ],
      ),

    ],
  );
}

  // ================= QUICK ACTION =================

  Widget buildQuickActions() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const SizedBox(height: 25),

      const Text(
        "Quick Menu",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 15),

      Row(
        children: [

          quickButton(
            icon: Icons.bug_report,
            title: "Bug",
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

          quickButton(
            icon: Icons.info,
            title: "Info",
            color: Colors.cyan,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const InfoPage(),
                ),
              );
            },
          ),

        ],
      ),

      const SizedBox(height: 10),

      Row(
        children: [

          quickButton(
            icon: Icons.build,
            title: "Tools",
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

          quickButton(
            icon: Icons.settings,
            title: "Settings",
            color: Colors.green,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Settings coming soon"),
                ),
              );
            },
          ),

        ],
      ),

    ],
  );
}  

  Widget quickButton({
  required IconData icon,
  required String title,
  required Color color,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 95,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xff141d2f),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.cyanAccent.withOpacity(.15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 30,
            ),
            const SizedBox(height: 8),
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
    ),
  );
}

  // ================= DEVELOPER =================

  Widget buildDeveloper() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 25),
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: const Color(0xff141d2f),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: Colors.cyanAccent.withOpacity(.20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Developer Profile",
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 12),

        Row(
          children: [

            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.cyanAccent,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 18),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Trapenden Developer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "Premium Edition",
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
                "ACTIVE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),

        const SizedBox(height: 18),

        const LinearProgressIndicator(
          value: 1,
          minHeight: 6,
          backgroundColor: Color(0xff24324a),
          valueColor: AlwaysStoppedAnimation(Colors.cyanAccent),
        ),

      ],
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
        buildHeader(),
        buildVideo(),
        buildBanner(),
        buildWelcome(),
        buildDashboard(),
        buildQuickActions(),
        buildDeveloper(),
        const SizedBox(height: 30),
      ],
    ),
  ),

  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentNav,
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color(0xff141d2f),
    selectedItemColor: Colors.cyanAccent,
    unselectedItemColor: Colors.white54,
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
    onTap: (index) {
      setState(() => _currentNav = index);

      switch (index) {
        case 0:
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const BugPage()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const InfoPage()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ToolsPage()),
          );
          break;
      }
    },
  ),
);
}

}
