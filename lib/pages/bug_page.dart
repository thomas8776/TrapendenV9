import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'landing_page.dart';
import 'info_page.dart';
import 'tools_page.dart';

class BugPage extends StatefulWidget {
  const BugPage({super.key});

  @override
  State<BugPage> createState() => _BugPageState();
}

class _BugPageState extends State<BugPage> {

  late VideoPlayerController _video;

  int selectedBug = 0;
  int selectedSender = 0;

  final phone = TextEditingController();

  final bugs = [
    {
      "name": "CRASH iOS",
      "code": "crash_ios",
      "icon": Icons.shield,
    },
    {
      "name": "DELAY HARD",
      "code": "delay_hard",
      "icon": Icons.flash_on,
    },
    {
      "name": "FREEZE UI",
      "code": "freeze_ui",
      "icon": Icons.phone_android,
    },
    {
      "name": "NULL INVISIBLE",
      "code": "null_invisible",
      "icon": Icons.visibility_off,
    },
    {
      "name": "FORCE CLOSE",
      "code": "force_close",
      "icon": Icons.warning,
    },
  ];

  @override
  void initState() {
    super.initState();

    _video = VideoPlayerController.asset(
      "assets/videos/banner.mp4",
    )
      ..initialize().then((_) {
        setState(() {});
        _video.setLooping(true);
        _video.play();
      });
  }

  @override
  void dispose() {
    _video.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          if (_video.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _video.value.size.width,
                  height: _video.value.size.height,
                  child: VideoPlayer(_video),
                ),
              ),
            ),

          Container(
            color: Colors.black.withValues(alpha: .45),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(
                          "assets/images/logo.png",
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Text(
                              "REYYYYYY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "MEMBER",
                              style: TextStyle(
                                color:
                                    Colors.cyanAccent,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius:
                              BorderRadius.circular(30),
                        ),
                        child: const Row(
                          children: [

                            Icon(
                              Icons.access_time,
                              color: Colors.white70,
                              size: 18,
                            ),

                            SizedBox(width: 6),

                            Text(
                              "2029-03-09",
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
                  const Text(
                    "Bug Sender",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Pilih bug dan kirim ke target",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 25),

                  TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "628xxxxxxxxxx",
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                      ),
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.cyanAccent,
                      ),
                      filled: true,
                      fillColor: Colors.black54,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "Pilih Bug",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    height: 165,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bugs.length,
                      itemBuilder: (context, index) {

                        final item = bugs[index];

                        final active =
                            selectedBug == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBug = index;
                            });
                          },

                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 250,
                            ),

                            width: 150,

                            margin:
                                const EdgeInsets.only(
                              right: 16,
                            ),

                            decoration: BoxDecoration(
                              color: active
                                  ? Colors.cyan
                                  : Colors.black54,

                              borderRadius:
                                  BorderRadius.circular(
                                      22),

                              border: Border.all(
                                color: active
                                    ? Colors.white
                                    : Colors.white24,
                              ),
                            ),

                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,

                              children: [

                                Icon(
                                  item["icon"]
                                      as IconData,
                                  size: 42,
                                  color: active
                                      ? Colors.black
                                      : Colors.white,
                                ),

                                const SizedBox(
                                    height: 15),

                                Text(
                                  item["name"]
                                      as String,
                                  textAlign:
                                      TextAlign.center,
                                  style: TextStyle(
                                    color: active
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

const SizedBox(height: 28),

SizedBox(
  width: double.infinity,
  height: 58,
  child: ElevatedButton.icon(
    onPressed: () {
      if (phone.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Masukkan nomor target terlebih dahulu"),
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Bug ${bugs[selectedBug]["name"]} siap dikirim",
          ),
        ),
      );
    },
    icon: const Icon(Icons.send),
    label: const Text(
      "KIRIM BUG",
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

const SizedBox(height: 25),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    "Mode Pengiriman",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSender = 0;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: selectedSender == 0
                                  ? Colors.cyanAccent
                                  : Colors.black54,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(
                              "PRIBADI",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedSender == 0
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSender = 1;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: selectedSender == 1
                                  ? Colors.cyanAccent
                                  : Colors.black54,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(
                              "GLOBAL",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedSender == 1
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Fitur SEND BUG masih dalam pengembangan.",
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyanAccent,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      icon: const Icon(Icons.send),
                      label: const Text(
                        "SEND BUG",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color(0xff111111),
  selectedItemColor: Colors.cyanAccent,
  unselectedItemColor: Colors.white54,
  currentIndex: 1,

  onTap: (index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LandingPage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const InfoPage()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ToolsPage()),
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
