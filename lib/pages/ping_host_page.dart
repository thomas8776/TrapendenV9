import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PingHostPage extends StatefulWidget {
  const PingHostPage({super.key});

  @override
  State<PingHostPage> createState() => _PingHostPageState();
}

class _PingHostPageState extends State<PingHostPage> {
  final controller = TextEditingController();

  String result = "";
  bool loading = false;

  Future<void> ping() async {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      loading = true;
      result = "";
    });

    try {
      var host = controller.text.trim();

      if (!host.startsWith("http://") &&
          !host.startsWith("https://")) {
        host = "https://$host";
      }

      final response = await http
          .get(Uri.parse(host))
          .timeout(const Duration(seconds: 5));

      result = "Status Code : ${response.statusCode}\nHost merespons.";
    } catch (e) {
      result = "Host tidak merespons atau tidak dapat dijangkau.";
    }

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
        title: const Text("Ping Host"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Host",
                hintText: "example.com",
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ping,
                child: const Text("PING"),
              ),
            ),
            const SizedBox(height: 20),
            if (loading)
              const CircularProgressIndicator(),
            if (result.isNotEmpty)
              Text(
                result,
                style: const TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
