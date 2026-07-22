import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyIpPage extends StatefulWidget {
  const MyIpPage({super.key});

  @override
  State<MyIpPage> createState() => _MyIpPageState();
}

class _MyIpPageState extends State<MyIpPage> {
  Map<String, dynamic>? data;
  bool loading = false;

  Future<void> getIp() async {
    setState(() {
      loading = true;
    });

    try {
      final res = await http.get(
        Uri.parse("https://ipapi.co/json/"),
      );

      if (res.statusCode == 200) {
        setState(() {
          data = jsonDecode(res.body);
        });
      }
    } catch (_) {}

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getIp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("My IP"),
      ),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : data == null
                ? const Text(
                    "Gagal mengambil data",
                    style: TextStyle(color: Colors.white),
                  )
                : Card(
                    color: const Color(0xff131d35),
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("IP : ${data!["ip"]}",
                              style: const TextStyle(color: Colors.white)),
                          Text("Negara : ${data!["country_name"]}",
                              style: const TextStyle(color: Colors.white)),
                          Text("Kota : ${data!["city"]}",
                              style: const TextStyle(color: Colors.white)),
                          Text("ISP : ${data!["org"]}",
                              style: const TextStyle(color: Colors.white)),
                          Text("Timezone : ${data!["timezone"]}",
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
