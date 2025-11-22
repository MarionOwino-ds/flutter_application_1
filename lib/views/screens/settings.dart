import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    var store = GetStorage();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: notifications,
            activeThumbColor: primaryColor,
            onChanged: (val) {
              setState(() => notifications = val);
            },
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: darkMode,
            activeThumbColor: primaryColor,
            onChanged: (val) {
              setState(() => darkMode = val);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Change Password"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text("Logout"),
            onTap: () {
              store.erase();
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
