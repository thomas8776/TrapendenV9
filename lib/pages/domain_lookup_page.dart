import 'package:flutter/material.dart';

class DomainLookupPage extends StatefulWidget {
  const DomainLookupPage({super.key});

  @override
  State<DomainLookupPage> createState() => _DomainLookupPageState();
}

class _DomainLookupPageState extends State<DomainLookupPage> {
  final TextEditingController domainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090d18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Domain Lookup"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: domainController,
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Lookup ${domainController.text}",
                      ),
                    ),
                  );
                },
                child: const Text("LOOKUP"),
              ),
            ),
          ],
        ),
     
