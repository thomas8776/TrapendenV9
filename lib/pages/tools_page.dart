import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'bug_page.dart';
import 'info_page.dart';
import 'manage_server_page.dart';
import 'osint_page.dart';
import 'network_page.dart';
import 'downloader_page.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {
        "title": "Manage Server",
        "sub": "Server Control",
        "icon": Icons.cloud,
      },
      {
        "title": "DDoS",
        "sub": "Take Down",
        "icon": Icons.flash_on,
      },
      {
        "title": "Network",
        "sub": "WiFi Arsenal",
        "icon": Icons.wifi,
      },
      {
        "title": "OSINT",
        "sub": "Deep Search",
        "icon": Icons.search,
      },
      {
        "title": "Downloader",
        "sub": "Media Saver",
        "icon": Icons.download,
      },
      {
        "title": "Utilities",
        "sub": "Extra Tools",
        "icon": Icons.handyman,
      },
      {
        "title": "Watch Video",
        "sub": "Stream & Watch",
        "icon": Icons.play_circle_fill,
      },
      {
        "title": "RAT Control",
        "sub": "Remote Access",
        "icon": Icons.computer,
      },
      {
        "title": "Adult Hub",
        "sub": "18+ Only",
        "icon": Icons.lock,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff090d18),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.shield,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),

                  const SizedBox(width: 18),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          "ASTRAL ENGINE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Gateway Tools",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff18243f),
                      borderRadius:
                          BorderRadius.circular(25),
                    ),
                    child: const Row(
                      children: [

                        CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.blue,
                        ),

                        SizedBox(width: 8),

                        Text(
                          "USER",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Tools Astral",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "9 item",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  itemCount: tools.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: .8,
                  ),
                  itemBuilder: (context, index) {
                    final item = tools[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
  if (item["title"] == "Manage Server") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ManageServerPage(),
      ),
    );
    return;
  }

  if (item["title"] == "OSINT") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const OsintPage(),
      ),
    );
    return;
  }

  if (item["title"] == "Network") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NetworkPage(),
      ),
    );
    return;
  }

  if (item["title"] == "Downloader") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const DownloaderPage(),
    ),
  );
  return;
}

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "${item["title"]} coming soon",
      ),
    ),
  );
},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff131d35),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white10,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [

                            CircleAvatar(
                              radius: 34,
                              backgroundColor:
                                  Colors.blue.withValues(alpha: .18),
                              child: Icon(
                                item["icon"] as IconData,
                                color: Colors.blueAccent,
                                size: 34,
                              ),
                            ),

                            const SizedBox(height: 18),

                            Text(
                              item["title"] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              item["sub"] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
  currentIndex: 3,
  backgroundColor: const Color(0xff111111),
  selectedItemColor: Colors.cyanAccent,
  unselectedItemColor: Colors.white54,

  onTap: (index) {
  if (index == 0) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LandingPage()),
    );
  } else if (index == 1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BugPage()),
    );
  } else if (index == 2) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const InfoPage()),
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
