import 'package:flutter/material.dart';
import 'tiktok_downloader_page.dart';

class DownloaderPage extends StatelessWidget {
  const DownloaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "title": "TikTok Downloader",
        "sub": "Download TikTok Video",
        "icon": Icons.music_note,
      },
      {
        "title": "Instagram Downloader",
        "sub": "Coming Soon",
        "icon": Icons.camera_alt,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Downloader"),
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
                if (item["title"] == "TikTok Downloader") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TiktokDownloaderPage(),
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Instagram Downloader Coming Soon",
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
