import 'package:flutter/material.dart';
import 'my_ip_page.dart';
import 'ping_host_page.dart';
import 'http_headers_page.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "title": "My IP",
        "sub": "Show Public IP",
        "icon": Icons.public,
      },
      {
        "title": "Ping Host",
        "sub": "Check Host Response",
        "icon": Icons.network_ping,
      },
      {
        "title": "DNS Resolver",
        "sub": "Resolve Domain",
        "icon": Icons.language,
      },
      {
        "title": "HTTP Headers",
        "sub": "Website Headers",
        "icon": Icons.http,
      },
      {
        "title": "Port Checker",
        "sub": "Check Open Port",
        "icon": Icons.router,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Network"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            color: const Color(0xff131d35),
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              leading: Icon(
                item["icon"] as IconData,
                color: Colors.cyanAccent,
              ),
              title: Text(
                item["title"] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item["sub"] as String,
                style: const TextStyle(color: Colors.white54),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white54,
              ),
              onTap: () {
  if (item["title"] == "My IP") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const MyIpPage(),
      ),
    );
    return;
  }

  if (item["title"] == "Ping Host") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PingHostPage(),
      ),
    );
    return;
  }

  if (item["title"] == "HTTP Headers") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const HttpHeadersPage(),
    ),
  );
  return;
}

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "${item["title"]} Coming Soon",
      ),
    ),
  );
},
            ),
          );
        },
      ),
    );
  }
}
