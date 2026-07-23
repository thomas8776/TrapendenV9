import 'package:flutter/material.dart';

class LockDevicePage extends StatefulWidget {
  const LockDevicePage({super.key});

  @override
  State<LockDevicePage> createState() => _LockDevicePageState();
}

class _LockDevicePageState extends State<LockDevicePage> {
  final contactController =
      TextEditingController(text: "08xxxxxxxxxx");

  final messageController = TextEditingController(
    text: "Perangkat ini hilang.\nMohon hubungi nomor di bawah.",
  );

  bool playAlarm = true;
  bool shareLocation = true;
  bool showContact = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        title: const Text("Lost Mode Settings"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.security,
            size: 80,
            color: Colors.cyanAccent,
          ),

          const SizedBox(height: 20),

          TextField(
            controller: contactController,
            decoration: const InputDecoration(
              labelText: "Nomor yang bisa dihubungi",
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: messageController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Pesan yang ditampilkan",
            ),
          ),

          const SizedBox(height: 20),

          SwitchListTile(
            value: playAlarm,
            onChanged: (v) => setState(() => playAlarm = v),
            title: const Text(
              "Bunyikan alarm",
              style: TextStyle(color: Colors.white),
            ),
          ),

          SwitchListTile(
            value: shareLocation,
            onChanged: (v) => setState(() => shareLocation = v),
            title: const Text(
              "Bagikan lokasi",
              style: TextStyle(color: Colors.white),
            ),
          ),

          SwitchListTile(
            value: showContact,
            onChanged: (v) => setState(() => showContact = v),
            title: const Text(
              "Tampilkan nomor kontak",
              style: TextStyle(color: Colors.white),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("SIMPAN PENGATURAN"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Pengaturan berhasil disimpan"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
