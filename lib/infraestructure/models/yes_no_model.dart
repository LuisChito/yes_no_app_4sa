//El modelo define que datos debe tener la aplicación, investigar MVC = patrón de diseño de software
//MVC modelo = información
//vista: pantalla, controlador: como va a funcionar
// modelo, vista y controlador
//Modelo: Contiene la lógica relacionada con los datos, como los esquemas, las bases de datos y sus campos
//Vista: Se encarga de la presentación de los datos y de la interacción del usuario.
//Controlador: Es la lógica de negocios que manipula los datos, los transforma y los muestra en la pantalla
//Diferencia entre constructor y factory= el constructor crea una instancia y factory puede o no crear una
//instancia
//Key Value = es la estructura del formato Json
//Qué es factory: es un tipop especial de constructor que puede devolver una instacia nueva de la clase 
//o nueva ya existente
//Traduce factory: no es factorial, es fábrica, es un falso cognado
//parse: convertir un dato a un formato
import 'package:yes_no_app_4sa/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });
    //factory no necesariamente crea una instancia
    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Message toMessageEntity() => Message(
      //condicional ternario para darle valor a los mensajes
    text: answer == 'yes' ? 'Sí' : answer == 'no' ? 'No' : 'Maybe',
    fromWho: FromWho.hers,
    imageUrl:image,
);
}