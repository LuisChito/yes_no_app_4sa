import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';
import 'package:yes_no_app_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://images.tagesschau.de/image/d0295fb9-e9c8-4aaf-a603-16b0b9c180e8/AAABkkX3FSs/AAABkZLngyM/1x1-256/sheinbaum-122.jpg'),
          ),
        ),
        title: const Text('Mi pinshesha🥰'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 ),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                //Instancia de message que sabrá quien es el mensaje
                final message = chatProvider.messageList[index];
                return (message.fromWho  == FromWho.hers )
                ? HerMessageBubble(message: message)
                : MyMessageBubble(message: message);

              
            })
            ),
            
        /// Caja de Texto de mensajes
        
            MessageFieldBox(
              //Una vez que tiene el valor cambiado, enviao
              onValue: chatProvider.sendMessage,
              ),
          ],
        ),
      ),
    );
  }
}