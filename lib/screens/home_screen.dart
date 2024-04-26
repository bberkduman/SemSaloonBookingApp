// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saloon_booking_app/constants.dart';
import 'package:saloon_booking_app/models/stylist.dart';
import 'package:saloon_booking_app/theme.dart';
import 'package:saloon_booking_app/widgets/hair_stylist.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stylists = <Stylist>[
      Stylist('Cameron Jones', 'Super Cut Salon', '4.89', 'man-0.png'),
      Stylist('Max Robertson', 'Rosano Ferrite Salon', '4.89', 'man-1.png'),
      Stylist('Bath Watson', 'Navil Hair & Beauty', '4.7', 'man-2.png'),
      Stylist('Max Robertson', 'Rosano Ferrite Salon', '4.89', 'man-1.png'),
      Stylist('Cameron Jones', 'Super Cut Salon', '4.89', 'man-0.png'),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Saloon Hair",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10),
            InkWell(
              onTap: () => context.go('/user'),
              child: Icon(Icons.person)
              ),
            SizedBox(width: 10),
            InkWell(
              onTap: () => context.go('/settings'),
              child: Icon(
                Icons.settings)),
            SizedBox(width: 10,),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: primaryColor,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(15, 5, 0, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding * 1.25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hair Stylist',
                            style: headingTextStyle,
                          ),
                          const SizedBox(
                            height: 42,
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: stylists.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: defaultPadding),
                                child: HairStylist(
                                  stylist: stylists[index],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
