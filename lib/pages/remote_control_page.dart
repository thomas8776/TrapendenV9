import 'package:flutter/material.dart';
import 'lock_device_page.dart';

class RemoteControlPage extends StatelessWidget {
  final String deviceName;

  const RemoteControlPage({
    super.key,
    required this.deviceName,
  });

  @override
  Widget build(BuildContext context) {
    final menus = [
      {"icon": Icons.sms, "title": "SMS"},
      {"icon": Icons.contacts, "title": "Contacts"},
      {"icon": Icons.photo, "title": "Gallery"},
      {"icon": Icons.folder, "title": "Files"},
      {"icon": Icons.location_on, "title": "Location"},
      {"icon": Icons.camera_alt, "title": "Camera"},
      {"icon": Icons.mic, "title": "Microphone"},
      {"icon": Icons.notifications, "title": "Notifications"},
      {"icon": Icons.call, "title": "Call Logs"},
      {"icon": Icons.apps, "title": "Installed Apps"},
      {"icon": Icons.storage, "title": "Storage"},
      {"icon": Icons.settings_remote, "title": "Remote Shell"},
      {"icon": Icons.lock, "title": "Lock Device"},   
    ];

    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(deviceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff131d35),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.cyanAccent,
                    child: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                      size: 45,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "ONLINE",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Android 15",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Battery 84%",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: menus.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (_, i) {
                  final item = menus[i];

                  return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {

  if (item["title"] == "Lock Device") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LockDevicePage(),
      ),
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "${item["title"]} coming soon",
      ),
    ),
  );
},
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff131d35),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(
                            item["icon"] as IconData,
                            color: Colors.cyanAccent,
                            size: 34,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item["title"] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
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
