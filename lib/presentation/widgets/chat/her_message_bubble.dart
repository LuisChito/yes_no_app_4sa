import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';
import 'package:intl/intl.dart'; //paquete para la hora de envío

//Resolviendo Bug de GitHub

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    //Formtear la hora de envio 
    final formattedTime = DateFormat("hh:mma").format(message.timeSent);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              children: [
                //Mensaje de texto
                Padding(padding: const EdgeInsets.only(right: 50), 
                child: Text(message.text,
                style: const TextStyle(color: Colors.white),
                 ),
                ),
                //Hora en la esquina inferior derecha con fuente mas pequeña
                Positioned(bottom: 0,
                right: 0,
                child:  Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 8,
                    //Reducido el tamaño de fuente
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                ),
              ],
            ),
            ),
            ),
            if (message.imageUrl != null) ...[
          const SizedBox(height: 5),
          _ImageBubble(imageUrl: message.imageUrl!, timeSent: message.timeSent),
        ],
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  final DateTime timeSent;

  const _ImageBubble({required this.imageUrl, required this.timeSent});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formattedTime = DateFormat("hh:mm a").format(timeSent);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrl,
            width: size.width * 0.7,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                width: size.width * 0.7,
                height: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text("Mi Monita Bb está enviando un gif..."),
              );
            },
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              formattedTime,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}