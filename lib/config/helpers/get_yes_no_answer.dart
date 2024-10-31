import 'package:yes_no_app_4sa/domain/entities/message.dart';

class GetYesNoAnswer {

  //Se crea una instancia (objeto) de la clase Dio
  //Instanciar es hacer referencia a _____

  final _dio = Dio();


  //Obtener respuesta

  Future <Message> getAnswer () async{
    //Almacenar la petición en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    //Generar el error
    throw UnimplementedError();
  }
}