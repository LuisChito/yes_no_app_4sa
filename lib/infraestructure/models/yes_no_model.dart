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