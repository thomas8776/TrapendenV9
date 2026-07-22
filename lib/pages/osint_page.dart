import 'package:flutter/material.dart';
import 'ip_info_page.dart';
import 'dns_lookup_page.dart';
import 'domain_lookup_page.dart';

class OsintPage extends StatelessWidget {
  const OsintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final osint = [
      {
        "title": "IP Info",
        "sub": "Informasi IP",
        "icon": Icons.public,
      },
      {
        "title": "DNS Lookup",
        "sub": "Lookup DNS",
        "icon": Icons.language,
      },
      {
        "title": "Domain Lookup",
        "sub": "WHOIS Domain",
        "icon": Icons.travel_explore,
      },
      {
        "title": "Email Checker",
        "sub": "Cek Email",
        "icon": Icons.email,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("OSINT"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: osint.length,
        itemBuilder: (context, index) {
          final item = osint[index];

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
                style: const TextStyle(
                  color: Colors.white54,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white54,
                size: 16,
              ),
              onTap: () {
                if (item["title"] == "IP Info") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IpInfoPage(),
                    ),
                  );
                  return;
                }

                if (item["title"] == "DNS Lookup") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DnsLookupPage(),
                    ),
                  );
                  return;
                }

                if (item["title"] == "Domain Lookup") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DomainLookupPage(),
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
