import 'package:flutter/material.dart';
import 'package:flutter_multi_select_listview/ContactModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> contacts = [
    ContactModel("Zaman", "0778979454", false),
    ContactModel("Naim", "0766223795", false),
    ContactModel("Sardar", "0749112016", false),
    ContactModel("Baqer", "0775286570", false),
    ContactModel("Yasin", "0744795640", false),
    ContactModel("Hurmat", "0707404370", false),
    ContactModel("M.Ali", "0772680138", false),
  ];

  List<ContactModel> selectedContacts = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Selection ListView"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        contacts[index].name,
                        contacts[index].phoneNumber,
                        contacts[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedContacts.length > 0 ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green[700],
                    child: Text(
                      "Delete (${selectedContacts.length})",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      print("Delete List Lenght: ${selectedContacts.length}");
                    },
                  ),
                ),
              ): Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String name, String phoneNumber, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(phoneNumber),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          contacts[index].isSelected = !contacts[index].isSelected;
          if (contacts[index].isSelected == true) {
            selectedContacts.add(ContactModel(name, phoneNumber, true));
          } else if (contacts[index].isSelected == false) {
            selectedContacts
                .removeWhere((element) => element.name == contacts[index].name);
          }
        });
      },
    );
  }
}
