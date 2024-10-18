import 'package:app_02/messages.dart';
import 'package:app_02/open_chat.dart';
import 'package:app_02/person.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<Person> personList = [
    Person(
        name: 'Ram',
        messages: [
          Messages(msg: 'koni aayu', otherPersonName: 'Amon', time: '10:20PM'),
        ],
        imageUrl:
            'https://th.bing.com/th/id/OIP.6YY80xg4wCEMkbY95XTt7wHaE8?w=235&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
    Person(
        name: 'Flowers king',
        messages: [
          Messages(
              msg: 'hello,we have New Flowers ',
              otherPersonName: 'Robin',
              time: '10:35PM'),
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1726486896376-4d1340e2f672?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNjl8fHxlbnwwfHx8fHw%3D'),
    Person(
        name: 'Yoga Master',
        messages: [
          Messages(
              msg: 'hi ,we class to today',
              otherPersonName: 'Leon',
              time: '01:50AM'),
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8eW9nYXxlbnwwfHwwfHx8MA%3D%3D'),
    Person(
        name: 'Syam',
        messages: [
          Messages(
              msg: 'give thro naame', otherPersonName: 'Ash', time: '01:20AM'),
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1726510114046-b7938cdc1bd1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2M3x8fGVufDB8fHx8fA%3D%3D'),
    Person(
        name: 'Ravi',
        messages: [
          Messages(msg: 'ko re', otherPersonName: '', time: '05:20AM'),
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1726672941260-07fbcabb3a96?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw4NXx8fGVufDB8fHx8fA%3D%3D'),
    Person(
        name: 'Mohan',
        messages: [
          Messages(msg: 'Naa', otherPersonName: 'Amon', time: '10:20AM'),
        ],
        imageUrl:
            'https://images.unsplash.com/photo-1726687676612-c745a9ef9c21?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMzh8fHxlbnwwfHx8fHw%3D'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35,
              )),
          title: Text('Chat Screen'),
        ),
        body: ListView.builder(
            itemCount: personList.length,
            itemBuilder: (context, int index) {
              Person person = personList[index];
              return ListTile(
                title: Text(person.name),
                leading: ClipOval(
                  child: Image.network(
                    person.imageUrl,
                    height: 45,
                    width: 45,fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return OpenChat(
                      person: person,
                    );
                  }));
                },
              );
            }));
  }
}
