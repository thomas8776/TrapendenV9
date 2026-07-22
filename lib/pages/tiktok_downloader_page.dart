import 'package:flutter/material.dart';
import '../services/download_service.dart';

class TiktokDownloaderPage extends StatefulWidget {
  const TiktokDownloaderPage({super.key});

  @override
  State<TiktokDownloaderPage> createState() =>
      _TiktokDownloaderPageState();
}

class _TiktokDownloaderPageState
    extends State<TiktokDownloaderPage> {
  final TextEditingController controller =
      TextEditingController();

  bool loading = false;
  String? videoUrl;

  Future<void> check() async {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      loading = true;
      videoUrl = null;
    });

    final url = await DownloadService.getVideoUrl(
      controller.text.trim(),
    );

    setState(() {
      videoUrl = url;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("TikTok Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "TikTok URL",
                hintText: "https://www.tiktok.com/...",
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: check,
                child: const Text("CHECK"),
              ),
            ),

            const SizedBox(height: 20),

            if (loading)
              const CircularProgressIndicator(),

            if (!loading && videoUrl != null)
              Column(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Video ditemukan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Tahap download akan dibuat berikutnya",
                            ),
                          ),
                        );
                      },
                      child: const Text("DOWNLOAD VIDEO"),
                    ),
                  ),
                ],
              ),

            if (!loading && videoUrl == null)
              const Text(
                "",
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
