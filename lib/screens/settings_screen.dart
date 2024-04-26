// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon_booking_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:go_router/go_router.dart';

import '../localization/app_localization.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


   bool darkMode = false;

   changeThemeMode(bool isDark) async {
    SharedPreferences memory = await SharedPreferences.getInstance();
    setState(() {
      darkMode = isDark;
    });
   }

  loadSettings()async{
    SharedPreferences memory = await SharedPreferences.getInstance();

    var d = memory.getBool("darkMode");

    if (d == null){
      changeThemeMode(false);
    }
    else {
      darkMode = d;
    }

    setState(() {
      
    });
  }

  @override
  void initState() {
    loadSettings();
    super.initState();
  }


  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {},
            child: const Text('Türkçe'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: const Text('English'),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(165, 132, 48, 1),
        leading: InkWell(
          onTap: () => context.go('/'),
          child: Icon(Icons.home)),
        title: Text("Ayarlar"),
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(15, 5, 0, 1),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dark Mode:"),
                    Switch(value: darkMode, 
                    onChanged: (value) {
                      setState(() {
                        changeThemeMode(value);
                      });
                    }),
                  ],
                ),
                CupertinoButton(
                  color: primaryColor,
                  child: Text("Diller"), onPressed: () {
                _showActionSheet(context);
              },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}