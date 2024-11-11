import 'package:flutter/material.dart';
import 'package:yes_no_app_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  
  List<Message> messageList = [
    Message(text: 'Hola tilin', fromWho: FromWho.me),
    Message(text: 'lloras porque reprobaste TAP?', fromWho: FromWho.me)
 ];
  //Controlador para manerar la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  //Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //Evita que se mande mensaje vacio
      if ( text.isEmpty) return;
    //El mensaje siempre va a ser 'me' porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    //Notifica si algo de provider cambió para que se guarde en el

    if (text.endsWith('?')){
      herReply();
    }
    notifyListeners();
    //Mueve el Scroll
    moveScrollToBottom();
  }
//Future es una promesa
//get es para que el servidor me diga/obtenga algo
//dio es un paquete de flutter para manejar peticiones http

  Future<void> herReply() async{
    //Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    //añadir el mensaje de mi crush a la lista
    messageList.add(herMessage);
    //Notifica si algo de provider cambió para el estado
    notifyListeners();
    //Mueve el scroll hasta el ultimo mensaje
    moveScrollToBottom();
  }


//Mover el scroll al ultimo mensaje
Future<void> moveScrollToBottom() async {
  // Verificar si el ScrollController tiene clientes antes de hacer scroll
  if (chatScrollController.hasClients) {
    //Un pequeño atraso en la animación para garantizar que siempre se verá aun cuando se envien
    //mensajes cortos y rápidps
    await chatScrollController.animateTo(
      //maxScrollExtent: determina a lo máximo que el scroll puede dar
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut,
      );
    }  
  }
}