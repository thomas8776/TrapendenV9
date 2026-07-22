import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IpInfoPage extends StatefulWidget {
  const IpInfoPage({super.key});

  @override
  State<IpInfoPage> createState() => _IpInfoPageState();
}

class _IpInfoPageState extends State<IpInfoPage> {
  final TextEditingController ipController = TextEditingController();

  Map<String, dynamic>? result;
  bool loading = false;

  Future<void> checkIp() async {
    if (ipController.text.trim().isEmpty) return;

    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(
        Uri.parse(
          "https://ipapi.co/${ipController.text.trim()}/json/",
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          result = jsonDecode(response.body);
        });
      }
    } catch (_) {}

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("IP Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ipController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "IP Address",
                hintText: "8.8.8.8",
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: checkIp,
                child: const Text("CHECK"),
              ),
            ),

            const SizedBox(height: 20),

            if (loading)
              const CircularProgressIndicator(),

            if (result != null)
              Card(
                color: const Color(0xff131d35),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("🌐 IP : ${result!["ip"] ?? "-"}"),
                      Text("🌍 Country : ${result!["country_name"] ?? "-"}"),
                      Text("🏙 City : ${result!["city"] ?? "-"}"),
                      Text("📡 ISP : ${result!["org"] ?? "-"}"),
                      Text("🕒 Timezone : ${result!["timezone"] ?? "-"}"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
