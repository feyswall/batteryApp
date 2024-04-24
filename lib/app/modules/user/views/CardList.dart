import 'package:batteryi/app/modules/user/model/UserModel.dart';
import 'package:batteryi/app/modules/user/views/pages/single_user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Get.to(SingleUserView(), arguments: {'fcmToken': user.fcmToken});
        },
      ),
    );
  }
}
