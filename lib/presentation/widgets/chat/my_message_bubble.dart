import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';
import 'package:intl/intl.dart'; // Paquete para la hora de envío

//Resolviendo Bug de GitHub

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Formatear la hora de envío
    final formattedTime = DateFormat('hh:mm a').format(message.timeSent);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Burbuja de texto
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              children: [
                // Columna para el texto y la fila con hora + palomitas
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Mensaje de texto
                    Text(
                      message.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                    // Fila con la hora y las palomitas
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Hora
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 8, // Reducido el tamaño de fuente
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Ícono de dos palomitas azules
                        const Icon(
                          Icons.done_all, // Ícono de dos palomitas
                          color: Colors.blue, // Color azul para las palomitas
                          size: 12, // Tamaño pequeño
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}