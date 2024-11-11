import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key, required Message message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;




    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
            child: Text('Hola bebé precioso😍', 
            style: TextStyle(color: Colors.white),),
          ),
        ),

        const SizedBox(height: 5),

        _ImageBubble(),
        const SizedBox(height: 10),



        //todo: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/11-a23cbde4ae018bbda812d2d8b2b8fc6c.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if( loadingProgress == null ) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Mi amor está enviando un mensaje'),
          );
        },
        ));
  }
}