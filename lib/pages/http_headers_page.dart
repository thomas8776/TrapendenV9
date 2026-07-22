import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHeadersPage extends StatefulWidget {
  const HttpHeadersPage({super.key});

  @override
  State<HttpHeadersPage> createState() => _HttpHeadersPageState();
}

class _HttpHeadersPageState extends State<HttpHeadersPage> {
  final controller = TextEditingController();

  String result = "";
  bool loading = false;

  Future<void> getHeaders() async {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      loading = true;
      result = "";
    });

    try {
      var url = controller.text.trim();

      if (!url.startsWith("http://") &&
          !url.startsWith("https://")) {
        url = "https://$url";
      }

      final res = await http.head(Uri.parse(url));

      result = res.headers.entries
          .map((e) => "${e.key}: ${e.value}")
          .join("\n");
    } catch (e) {
      result = "Gagal mengambil header.";
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
        title: const Text("HTTP Headers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Website",
                hintText: "example.com",
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: getHeaders,
                child: const Text("GET HEADERS"),
              ),
            ),
            const SizedBox(height: 20),
            if (loading)
              const CircularProgressIndicator(),
            if (result.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: SelectableText(
                    result,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
