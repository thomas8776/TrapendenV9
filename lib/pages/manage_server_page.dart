import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageServerPage extends StatefulWidget {
  const ManageServerPage({super.key});

  @override
  State<ManageServerPage> createState() => _ManageServerPageState();
}

class _ManageServerPageState extends State<ManageServerPage> {
  static const String storageKey = "saved_servers";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController apiController = TextEditingController();

  List<Map<String, String>> servers = [];

  @override
  void initState() {
    super.initState();
    loadServers();
  }

  Future<void> loadServers() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(storageKey) ?? [];

    setState(() {
      servers = data
          .map((e) => Map<String, String>.from(jsonDecode(e)))
          .toList();
    });
  }

  Future<void> saveServers() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      storageKey,
      servers.map((e) => jsonEncode(e)).toList(),
    );
  }

  Future<void> addServer() async {
    if (nameController.text.trim().isEmpty ||
        urlController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      servers.add({
        "name": nameController.text.trim(),
        "url": urlController.text.trim(),
        "api": apiController.text.trim(),
      });
    });

    await saveServers();

    nameController.clear();
    urlController.clear();
    apiController.clear();
  }

  Future<void> deleteServer(int index) async {
    setState(() {
      servers.removeAt(index);
    });

    await saveServers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Manage Server"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Nama Server",
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: urlController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Panel URL",
                hintText: "https://panel.example.com",
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: apiController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "API Key (Opsional)",
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addServer,
                child: const Text("SIMPAN SERVER"),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: servers.isEmpty
                  ? const Center(
                      child: Text(
                        "Belum ada server",
                        style: TextStyle(color: Colors.white54),
                      ),
                    )
                  : ListView.builder(
                      itemCount: servers.length,
                      itemBuilder: (context, index) {
                        final server = servers[index];

                        return Card(
                          color: const Color(0xff141d32),
                          child: ListTile(
                            leading: const Icon(
                              Icons.cloud,
                              color: Colors.cyanAccent,
                            ),
                            title: Text(
                              server["name"] ?? "",
                              style:
                                  const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              server["url"] ?? "",
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => deleteServer(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
