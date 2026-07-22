import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Account {
  final String username;
  final String password;
  final String role;

  Account({
    required this.username,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "role": role,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      username: json["username"],
      password: json["password"],
      role: json["role"],
    );
  }
}

class AccountService {
  static const String storageKey = "accounts";

  static final List<Account> accounts = [
    Account(
      username: "trapenden",
      password: "developer",
      role: "Developer",
    ),
    Account(
      username: "reseller",
      password: "resellertrapenden",
      role: "Reseller",
    ),
    Account(
      username: "vip",
      password: "viptrapenden",
      role: "VIP",
    ),
    Account(
      username: "member",
      password: "membertrapenden",
      role: "Member",
    ),
  ];

  static Future<void> saveAccounts() async {
    final prefs = await SharedPreferences.getInstance();

    final data = accounts
        .map((e) => jsonEncode(e.toJson()))
        .toList();

    await prefs.setStringList(storageKey, data);
  }

  static Future<void> loadAccounts() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(storageKey);

    if (data == null) return;

    accounts
      ..clear()
      ..addAll(
        data.map(
          (e) => Account.fromJson(
            jsonDecode(e) as Map<String, dynamic>,
          ),
        ),
      );
  }
}
