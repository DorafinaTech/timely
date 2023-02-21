import 'package:flutter/material.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/pages/floating_button_for_note.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FloatingButtonForNote()),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'Notes',
        ),
        actions: [
          Row(
            children: [
              const MenuButton(
                mypopupcolor: Colors.white,
              ),
              Container(
                width: menuPadding,
              ),
              Container(
                width: menuPadding,
              )
            ],
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
                  title: Text(
                    'Method of Coding',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                  title: Text(
                    'How to be Good',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                  title: Text(
                    'Why I love being Wicked',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                  title: Text(
                    'Can I ever stop being Good',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                  title: Text(
                    'Be bad and be remembered',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                  title: Text(
                    'Be Good and stay in the heart of men',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                  title: Text(
                    'Being good is boring',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                  title: Text(
                    'Being bad is kiling',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '2/2/2023',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoahi',
                    ),
                  )),
              Container(height: 5),
              const Divider(
                color: Color(0xFFB3B3B3),
              ),
              const ListTile(
                title: Text(
                  'Just be yourself',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Satoahi',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '2/2/2023',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Satoahi',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
