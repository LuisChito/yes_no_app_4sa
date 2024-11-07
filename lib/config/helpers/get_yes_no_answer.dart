import 'package:dio/dio.dart';
import 'package:yes_no_app_4sa/domain/entities/message.dart';

class GetYesNoAnswer {
  // Se crea instancia(objeto) de la clase Dio para manejar las peticiones HTTP
  final _dio = Dio();

  // Obtener la respuesta
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // Provocar o generar un error
    throw UnimplementedError();
  }
}
