import 'package:app_02/messages.dart';
import 'package:app_02/person.dart';
import 'package:flutter/material.dart';

class OpenChat extends StatefulWidget {
   OpenChat({required this.person, super.key});

  final Person person;

  @override
  State<OpenChat> createState() => _OpenChatState();
}

class _OpenChatState extends State<OpenChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat messages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.person.name,style: TextStyle(fontSize: 23),),
            Divider(),
            Image.network(widget.person.imageUrl),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.person.messages.length,
                  itemBuilder: (context, index) {
                    Messages message = widget.person.messages[index];
                    return Align(
                      alignment: message.isSend
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: message.isSend
                                ? Colors.green[100]
                                : Colors.blue[100],
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            message.imgUrl == null
                                ? Text(message.msg)
                                : SizedBox(),
                            message.imgUrl != null
                                ? Image.network(
                              message.imgUrl!,
                              width:
                              MediaQuery.of(context).size.width * 0.5,
                            )
                                : SizedBox(),
                            Text(
                              message.time,
                              style: TextStyle(
                                  fontSize: 9, color: Colors.grey[800]),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )

          ],
        ),
      ),
    );
  }
}
