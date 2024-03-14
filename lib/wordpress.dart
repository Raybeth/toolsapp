import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WordPressNewsScreen extends StatefulWidget {
  const WordPressNewsScreen({Key? key}) : super(key: key);

  @override
  WordPressNewsScreenState createState() => WordPressNewsScreenState();
}

class WordPressNewsScreenState extends State<WordPressNewsScreen> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    var url =
        Uri.parse('https://blackamericaweb.com/wp-json/wp/v2/posts?per_page=3');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _posts = json.decode(response.body);
      });
    } else {
      // Manejar el error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Últimas Noticias de WordPress'),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          var post = _posts[index];
          return ListTile(
            title: Text(post['title']['rendered']),
            subtitle: Text(post['excerpt']['rendered'].replaceAll(
                RegExp(r'<[^>]*>|&[^;]+;'), '')), // Elimina las etiquetas HTML
            onTap: () {
              // Implementar la lógica para abrir el enlace de la noticia
            },
          );
        },
      ),
    );
  }
}
