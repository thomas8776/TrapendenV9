import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    loadOwnerId();
  }

  Future<void> loadOwnerId() async {
    final prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString("owner_id");

    if (id == null) {
      id = "TP-${DateTime.now().millisecondsSinceEpoch.toRadixString(36).toUpperCase()}";
      await prefs.setString("owner_id", id);
    }

    setState(() {
      ownerId = id!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("RAT Control"),
      ),
      body: Center(
        child: Card(
          color: const Color(0xff131d35),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "OWNER ID",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 15),
                SelectableText(
                  ownerId,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: ownerId));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Owner ID disalin"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text("SALIN ID"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
