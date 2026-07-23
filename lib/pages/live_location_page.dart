import 'package:flutter/material.dart';

class LiveLocationPage extends StatelessWidget {
  const LiveLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        title: const Text("Live Location"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                  Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 80,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Device Location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Latitude : -6.200000",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Longitude : 106.816666",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Last Update : Just Now",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text("REFRESH LOCATION"),
                onPressed: () {},
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.map),
                label: const Text("OPEN GOOGLE MAPS"),
                onPressed: () {},
              ),
            ),

          ],
        ),
      ),
    );
  }
}
