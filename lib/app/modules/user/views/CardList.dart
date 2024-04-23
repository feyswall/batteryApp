import 'package:batteryi/app/modules/user/model/UserModel.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final UserModel user;

  CardList({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 25, // Adjust the radius as needed
          backgroundImage: NetworkImage(
              'https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg'), // Your image path
        ),
        title: Text('${user.name}'),
        subtitle: Text('${user.phone}'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print("user ${user.name} is being clicked");
        },
      ),
    );
  }
}
