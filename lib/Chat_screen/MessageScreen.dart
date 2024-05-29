import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pass_app_ultron_techonology/Chat_screen/profile_screen.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';



import '../../Modle/chat_user.dart';

import '../../same_code/dialogs.dart';
import 'apis.dart';
import 'chat_user_card.dart';

// Home screen -- where all available contacts are shown
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // For storing all users
  List<ChatUser> _list = [];

  // For storing searched items
  final List<ChatUser> _searchList = [];
  // For storing search status
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
    SystemChannels.lifecycle.setMessageHandler((message) {
      log('Message: $message');

      if (APIs.auth.currentUser != null) {
        if (message.toString().contains('resume')) {
          APIs.updateActiveStatus(true);
        }
        if (message.toString().contains('pause')) {
          APIs.updateActiveStatus(false);
        }
      }

      return Future.value(message);
    });

    // For updating user active status according to lifecycle events
    // resume -- active or online
    // pause  -- inactive or offline
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size; // Initialize mq here

    return GestureDetector(
      // For hiding keyboard when a tap is detected on screen
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        // If search is on & back button is pressed then close search
        // Or else simply close current screen on back button click
        onWillPop: () async {
          if (_isSearching) {
            setState(() => _isSearching = !_isSearching);
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          // App bar
          appBar: AppBar(
              backgroundColor: Color(0xFFFFECE7),
            // leading: const Icon(CupertinoIcons.home),
            title: _isSearching
                ? TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Name, Email, ...'),
              autofocus: true,
              style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
              // When search text changes then update search list
              onChanged: (val) {
                // Search logic
                _searchList.clear();

                for (var i in _list) {
                  if (i.name.toLowerCase().contains(val.toLowerCase()) ||
                      i.email.toLowerCase().contains(val.toLowerCase())) {
                    _searchList.add(i);
                    setState(() {});
                  }
                }
              },
            )
                : const Text('Chat'),
            actions: [
              // Search user button
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                  icon: Icon(_isSearching
                      ? CupertinoIcons.clear_circled_solid
                      : Icons.search)),

              // More features button
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProfileScreen(user: APIs.me)));
                  },
                  icon: const Icon(Icons.more_vert))
            ],
          ),

          // Floating button to add new user
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
                onPressed: () {
                  _addChatUserDialog();
                },
              backgroundColor: Color(0xFFFFECE7),
              child: const Icon(
                Icons.add_comment_rounded,
                color: punk, // Set the icon color here
              ),),
          ),
// Body with background color
          backgroundColor: Color(0xFFFFECE7),
          // Body
          body: StreamBuilder(
            stream: APIs.getMyUsersId(),

            // Get id of only known users
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
              // If data is loading
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(child: CircularProgressIndicator());

              // If some or all data is loaded then show it
                case ConnectionState.active:
                case ConnectionState.done:
                  return StreamBuilder(
                    stream: APIs.getAllUsers(
                        snapshot.data?.docs.map((e) => e.id).toList() ?? []),

                    // Get only those users whose ids are provided
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                      // If data is loading
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return const Center(
                              child: CircularProgressIndicator());

                      // If some or all data is loaded then show it
                        case ConnectionState.active:
                        case ConnectionState.done:
                          final data = snapshot.data?.docs;
                          _list = data
                              ?.map((e) => ChatUser.fromJson(e.data()))
                              .toList() ??
                              [];

                          if (_list.isNotEmpty) {
                            return ListView.builder(
                                itemCount: _isSearching
                                    ? _searchList.length
                                    : _list.length,
                                padding: EdgeInsets.only(top: mq.height * .01),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ChatUserCard(
                                      user: _isSearching
                                          ? _searchList[index]
                                          : _list[index]);
                                });
                          } else {
                            return const Center(
                              child: Text('No Connections Found!',
                                  style: TextStyle(fontSize: 20)),
                            );
                          }
                      }
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  // For adding new chat user
  void _addChatUserDialog() {
    String email = '';

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          contentPadding: const EdgeInsets.only(
              left: 24, right: 24, top: 20, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),

          // Title
          title: const Row(
            children: [
              Icon(
                Icons.person_add,
                color: punk,
                size: 28,
              ),
              Text('  Add User')
            ],
          ),

          // Content
          content: TextFormField(
            maxLines: null,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
                hintText: 'Email Id',
                prefixIcon: const Icon(Icons.email, color:punk),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),

          // Actions
          actions: [
            // Cancel button
            MaterialButton(
                onPressed: () {
                  // Hide alert dialog
                  Navigator.pop(context);
                },
                child: const Text('Cancel',
                    style: TextStyle(color: punk, fontSize: 16))),

            // Add button
            MaterialButton(
                onPressed: () async {
                  // Hide alert dialog
                  Navigator.pop(context);
                  if (email.isNotEmpty) {
                    await APIs.addChatUser(email).then((value) {
                      if (!value) {
                        Dialogs.showSnackbar(
                            context, 'User does not Exist!');
                      }
                    });
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: punk, fontSize: 16),
                ))
          ],
        ));
  }
}
