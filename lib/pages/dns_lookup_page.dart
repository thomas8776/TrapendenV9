import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DnsLookupPage extends StatefulWidget {
  const DnsLookupPage({super.key});

  @override
  State<DnsLookupPage> createState() => _DnsLookupPageState();
}

class _DnsLookupPageState extends State<DnsLookupPage> {
  final TextEditingController domain = TextEditingController();

  String result = "";
  bool loading = false;

  Future<void> lookup() async {
    if (domain.text.trim().isEmpty) return;

    setState(() {
      loading = true;
      result = "";
    });

    try {
      final response = await http.get(
        Uri.parse(
          "https://dns.google/resolve?name=${domain.text.trim()}",
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["Answer"] != null) {
          final records = <String>[];

          for (final item in data["Answer"]) {
            records.add(item["data"].toString());
          }

          result = records.join("\n");
        } else {
          result = "Tidak ada DNS Record.";
        }
      } else {
        result = "Lookup gagal (${response.statusCode})";
      }
    } catch (e) {
      result = "Error: $e";
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
        title: const Text("DNS Lookup"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: domain,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Domain",
                hintText: "example.com",
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: lookup,
                child: const Text("LOOKUP"),
              ),
            ),

            const SizedBox(height: 20),

            if (loading)
              const CircularProgressIndicator(),

            if (!loading && result.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Card(
                    color: const Color(0xff131d35),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SelectableText(
                        result,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
