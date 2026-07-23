import 'package:flutter/material.dart';

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
        onChanged: (v) {
          setState(() {
            enabled = v;
          });
        },
      ),
    ],
  ),
),
          const SizedBox(height: 20),
          TextField(
            controller: messageController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: "Pesan",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: "Nomor Pemilik",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: pinController,
            obscureText: true,
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
    onPressed: () {
      setState(() {
        enabled = !enabled;
      });
    },
  ),
),
        ],
      ),
    );
  }
}
