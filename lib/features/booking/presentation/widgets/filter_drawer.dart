import 'package:flutter/material.dart';

Drawer filterDrawer() => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Filter'),
          ),
          ListTile(
            title: const Text('Filter by status'),
            onTap: () {
              // Handle filter by status
            },
          ),
          ListTile(
            title: const Text('Filter by date'),
            onTap: () {
              // Handle filter by date
            },
          ),
        ],
      ),
    );
