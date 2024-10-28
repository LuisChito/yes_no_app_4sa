import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Simple',
      theme: ThemeData.dark(),  // Tema oscuro
      debugShowCheckedModeBanner: false,  // Ocultar el banner "DEBUG"
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];  // Lista para almacenar los mensajes y posibles imágenes
  Random _random = Random();

  Future<void> _sendMessage() async {
    String userMessage = _controller.text;

    // Guardar el mensaje del usuario en la lista de mensajes
    setState(() {
      _messages.add({'sender': 'user', 'message': userMessage});
      _controller.clear();  // Limpiar el campo de texto después de enviar el mensaje
    });

    // Decidir si forzar la respuesta a "maybe" 1 de cada 10 veces
    bool forceMaybe = _random.nextInt(10) == 9;  // 1 de cada 10 veces será true
    String apiUrl = forceMaybe
        ? 'https://yesno.wtf/api?force=maybe'
        : 'https://yesno.wtf/api';

    // Realizar la petición a la API
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      String apiResponse = jsonResponse['answer'];  // Obtener la respuesta de la API
      String gifUrl = jsonResponse['image'];  // Obtener el GIF de la API

      // Guardar la respuesta de la API y el GIF en la lista de mensajes
      setState(() {
        _messages.add({'sender': 'api', 'message': apiResponse, 'image': gifUrl});
      });
    } else {
      // En caso de error, mostrar un mensaje de error
      setState(() {
        _messages.add({'sender': 'api', 'message': 'Error al conectar con la API'});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Fondo negro
      appBar: AppBar(
        title: Text("Wasap 2 "),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,  // Para que el mensaje más reciente aparezca abajo
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];  // Mostrar mensajes en orden inverso
                return Column(
                  crossAxisAlignment: message['sender'] == 'user' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: message['sender'] == 'user' ? Colors.blueAccent : Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['message']!,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    if (message['image'] != null)  // Mostrar el GIF si está disponible
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(
                          message['image'],
                          width: 150,
                          height: 150,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),  // Texto en blanco
                    decoration: InputDecoration(
                      hintText: "Escribe tu mensaje aquí",
                      hintStyle: TextStyle(color: Colors.grey),  // Placeholder en gris
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text("Enviar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
