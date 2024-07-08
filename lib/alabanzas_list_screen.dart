// alabanzas_list_screen.dart

// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'alabanza.dart'; // Importa la clase Alabanza
import 'alabanza_detail_screen.dart'; // Importa la pantalla de detalle de la alabanza
import 'data.dart'; // Importa la función fetchAlabanzas

class AlabanzasListScreen extends StatefulWidget {
  @override
  _AlabanzasListScreenState createState() => _AlabanzasListScreenState();
}

class _AlabanzasListScreenState extends State<AlabanzasListScreen> {
  List<Alabanza> alabanzas = [];
  List<Alabanza> alabanzasFiltradas = [];

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAlabanzas();
    _controller.addListener(onSearchTextChanged);
  }

  Future<void> loadAlabanzas() async {
    List<Alabanza> loadedAlabanzas = await fetchAlabanzas();
    setState(() {
      alabanzas = loadedAlabanzas;
      alabanzasFiltradas = loadedAlabanzas;
    });
  }

  void onSearchTextChanged() {
    setState(() {
      String searchText = _controller.text.toLowerCase();
      alabanzasFiltradas = alabanzas
          .where((alabanza) =>
              alabanza.numero.toString().contains(searchText) ||
              alabanza.titulo.toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Himnario Iglesia De Dios'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Buscar alabanza...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: alabanzasFiltradas.isEmpty
                ? const Center(child: Text('No se encontraron alabanzas'))
                : ListView.builder(
                    itemCount: alabanzasFiltradas.length,
                    itemBuilder: (context, index) {
                      Alabanza alabanza = alabanzasFiltradas[index];
                      return ListTile(
                        title: Text(
                          '${alabanza.numero}. ${alabanza.titulo}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AlabanzaDetailScreen(alabanza: alabanza),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
