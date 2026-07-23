import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'device_list_page.dart';

class RatControlPage extends StatefulWidget {
  const RatControlPage({super.key});

  @override
  State<RatControlPage> createState() => _RatControlPageState();
}

class _RatControlPageState extends State<RatControlPage> {
  String ownerId = "";

  @override
  void initState() {
    super.initState();
    _loadOwnerId();
  }

  Future<void> _loadOwnerId() async {
    final prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString("owner_id");

    if (id == null) {
      id =
          "TP-${DateTime.now().millisecondsSinceEpoch.toRadixString(36).toUpperCase()}";
      await prefs.setString("owner_id", id);
    }

    setState(() {
      ownerId = id!;
    });
  }

  void copyId() {
    Clipboard.setData(ClipboardData(text: ownerId));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Owner ID berhasil disalin"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("RAT Control"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color(0xff131d35),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.cyanAccent.withOpacity(.3),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.security,
                  color: Colors.cyanAccent,
                  size: 90,
                ),

                const SizedBox(height: 20),

                const Text(
                  "OWNER ID",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15),

                SelectableText(
                  ownerId,
                  style: const TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: copyId,
                    icon: const Icon(Icons.copy),
                    label: const Text("SALIN OWNER ID"),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Masukkan Owner ID ini ke aplikasi Astral Guard untuk menghubungkan perangkat.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ],

                const SizedBox(height: 15),

SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton.icon(
    icon: const Icon(Icons.devices),
    label: const Text("LIHAT PERANGKAT"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const DeviceListPage(),
        ),
      );
    },
  ),
),
            ),
          ),
        ),
      ),
    );
  }
}
