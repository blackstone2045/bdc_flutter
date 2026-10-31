import 'package:flutter/material.dart';

import 'package:j_homes/widgets/custom_menuTile.dart';

class CustomDrawer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Menu items
            Custom_MenuTile(
              title: 'Dashboard',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: 'Total Proparties',
              icon: Icons.business_outlined,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: '₦ Total Reveneue',
              icon: Icons.nine_k_sharp,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: 'Complete Payments',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: 'Total Clients',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: 'Member Profile',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: 'Read-List Management',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: 'Payment Tracker',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),

            Custom_MenuTile(
              title: 'Message',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),

            Custom_MenuTile(
              title: 'Quite Rental',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),
            Custom_MenuTile(
              title: 'Add New Property',
              icon: Icons.dashboard_rounded,
              onTap: () {},
            ),
          ],
        ),
      ),
    );

    //  Drawer(
    //   child: ListView(
    //     children: [
    //       DrawerHeader(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               spacing: 10,
    //               children: [
    //                 CircleAvatar(
    //                   backgroundColor: Colors.tealAccent,
    //                   child: Icon(Icons.person),
    //                 ),
    //                 Text(
    //                   "Mr.Harry",
    //                   style: GoogleFonts.onest(
    //                     fontSize: 24,
    //                     color: Colors.teal,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Text(
    //               "mr.harry@email.com",
    //               style: GoogleFonts.onest(fontSize: 18, color: Colors.teal),
    //             ),
    //             Row(
    //               spacing: 10,
    //               children: [
    //                 Icon(Icons.location_pin, color: Colors.red),
    //                 Text(
    //                   "New Jersy",
    //                   style: GoogleFonts.onest(
    //                     fontSize: 18,
    //                     color: Colors.teal,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //       ListTile(leading: Icon(Icons.home), title: Text("Home")),
    //       ListTile(leading: Icon(Icons.person), title: Text("Profile")),
    //       ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
    //       Divider(height: 50),
    //       ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
    //     ],
    //   ),
    // );
  }
}
