import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LostModePage extends StatefulWidget {
  const LostModePage({super.key});

  @override
  State<LostModePage> createState() => _LostModePageState();
}

class _LostModePageState extends State<LostModePage> {
  bool enabled = false;

  final messageController = TextEditingController(
    text: "Perangkat ini hilang.\nHubungi: 08xxxxxxxxxx",
  );

  final phoneController = TextEditingController();
  final pinController = TextEditingController();
  
  @override
void initState() {
  super.initState();
  _loadSettings();
}

  Future<void> _loadSettings() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
    enabled = prefs.getBool("lost_enabled") ?? false;

    messageController.text = prefs.getString("lost_message") ??
        "Perangkat ini hilang.\nHubungi: 08xxxxxxxxxx";

    phoneController.text =
        prefs.getString("lost_phone") ?? "";

    pinController.text =
        prefs.getString("lost_pin") ?? "";
  });
}

  Future<void> _saveSettings() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool("lost_enabled", enabled);
  await prefs.setString(
      "lost_message", messageController.text);
  await prefs.setString(
      "lost_phone", phoneController.text);
  await prefs.setString(
      "lost_pin", pinController.text);
}

  Future<void> _showPinDialog() async {
  final controller = TextEditingController();

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text("Masukkan PIN"),
        content: TextField(
          controller: controller,
          obscureText: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "PIN Lost Mode",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.text == pinController.text) {
                setState(() {
                  enabled = false;
                });

                await _saveSettings();

                if (mounted) Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("PIN salah"),
                  ),
                );
              }
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        title: const Text("Lost Mode"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: enabled
        ? Colors.red
        : const Color(0xff131d35),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Column(
    children: [
      Icon(
        enabled ? Icons.lock : Icons.lock_open,
        color: Colors.white,
        size: 70,
      ),
      const SizedBox(height: 15),
      Text(
        enabled
            ? "LOST MODE ACTIVE"
            : "LOST MODE OFF",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 20),
      Switch(
        value: enabled,
        activeColor: Colors.white,
        onChanged: (v) async {
  setState(() {
    enabled = v;
  });

  await _saveSettings();
},
      ),
    ],
  ),
),
          const SizedBox(height: 20),
          TextField(
            controller: messageController,
            maxLines: 3,
            onChanged: (_) => _saveSettings(),
            decoration: const InputDecoration(
              labelText: "Pesan",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: phoneController,
            onChanged: (_) => _saveSettings(),
            decoration: const InputDecoration(
              labelText: "Nomor Pemilik",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: pinController,
            obscureText: true,
            onChanged: (_) => _saveSettings(),
            decoration: const InputDecoration(
              labelText: "PIN Lost Mode",
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton.icon(
    icon: Icon(
      enabled ? Icons.lock_open : Icons.lock,
    ),
    label: Text(
      enabled
          ? "NONAKTIFKAN LOST MODE"
          : "AKTIFKAN LOST MODE",
    ),
    onPressed: () async {
  if (!enabled) {
    setState(() {
      enabled = true;
    });

    await _saveSettings();
  } else {
    await _showPinDialog();
  }
},
  ),
),
        ],
      ),
    );
  }
}
