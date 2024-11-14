//identidad atómica: la unidad más pequeña de un sistema
//Resolviendo Bug de GitHub
enum FromWho{me, hers }
class Message{
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  //Almacenar la hora de envío, que nos servirá para mostrar la hora en el que se envió el mensaje
  final DateTime timeSent;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    DateTime? timeSent,
  }) : timeSent = timeSent ?? DateTime.now();
}