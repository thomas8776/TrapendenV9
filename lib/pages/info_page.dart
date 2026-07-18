import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // HEADER
              Row(
                children: [
                  const Icon(Icons.menu, color: Colors.white),
                  const SizedBox(width: 15),

                  const CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage("assets/images/logo.png"),
                  ),

                  const Spacer(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "reyyyyyy",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "MEMBER",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Exp: 2029-03-09",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              const Center(
                child: Text(
                  "Informasi",
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Patuhi aturan untuk kenyamanan bersama",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xff151d33),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [

                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "API SERVER",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Online",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.orange,
                          width: 3,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "476",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "PERATURAN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                "Tap untuk melihat detail",
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),

              const SizedBox(height: 20),
              ...List.generate(5, (index) {
                final rules = [
                  "Larangan Barter Akun",
                  "Larangan Membagikan Akun",
                  "Larangan Menjual Akun",
                  "Larangan Jual Durasi Ilegal",
                  "Larangan Banting Harga",
                ];

                final colors = [
                  Colors.orange,
                  Colors.blue,
                  Colors.red,
                  Colors.purple,
                  Colors.green,
                ];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ExpansionTile(
                    collapsedBackgroundColor: const Color(0xff151d33),
                    backgroundColor: const Color(0xff1b2340),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    leading: CircleAvatar(
                      backgroundColor:
                          colors[index].withValues(alpha: 0.20),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(color: colors[index]),
                      ),
                    ),
                    title: Text(
                      rules[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Peraturan ini wajib dipatuhi oleh seluruh pengguna. Pelanggaran dapat menyebabkan akun dibatasi atau dihapus permanen.",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff2a1014),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⚠ SANKSI TEAMS",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "• Akun akan DIHAPUS secara permanen",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "• Tanpa refund",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      "• Tanpa komplain",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      "• Permanent Ban",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff151d33),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  "Dengan menggunakan aplikasi ini, pengguna dianggap telah membaca dan menyetujui seluruh peraturan yang berlaku.",
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff111111),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white54,
        currentIndex: 2,
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
