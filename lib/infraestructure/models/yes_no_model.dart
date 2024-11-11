//El modelo define que datos debe tener la aplicación, investigar patrón de diseño de software
//MVC modelo = información
//vista: pantalla, controlador: como va a funcionar

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

}