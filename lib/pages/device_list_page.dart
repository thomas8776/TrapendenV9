import 'package:flutter/material.dart';
import 'remote_control_page.dart';

class DeviceListPage extends StatelessWidget {
  const DeviceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Connected Devices"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          deviceCard(
            context,
            "Redmi Note 14",
            "Android 15",
            "84%",
            true,
          ),
          deviceCard(
            context,
            "Samsung A15",
            "Android 14",
            "51%",
            false,
          ),
        ],
      ),
    );
  }

  Widget deviceCard(
    BuildContext context,
    String name,
    String version,
    String battery,
    bool online,
  ) {
    return Card(
      color: const Color(0xff131d35),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RemoteControlPage(
                deviceName: name,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: online ? Colors.green : Colors.red,
          child: const Icon(
            Icons.phone_android,
            color: Colors.white,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "$version • Battery $battery",
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
        ),
      ),
    );
  }
}
