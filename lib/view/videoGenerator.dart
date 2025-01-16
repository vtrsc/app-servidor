import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Videogenerator extends StatefulWidget {
  @override
  _VideogeneratorState createState() => _VideogeneratorState();
}

class _VideogeneratorState extends State<Videogenerator> {
  File? _selectedImage;
  bool _isLoading = false;
  String? _videoUrl;

  final String _apiKey = '<your-api-key>'; // Substitua pela sua API Key.
  final String _uploadUrl = 'https://upload.heygen.com/v1/talking_photo';

  // Método para selecionar imagem da galeria
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      
    }
  }

  // Método para enviar a imagem e obter o vídeo
  Future<void> _uploadAndGenerateVideo() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecione uma imagem primeiro!')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final bytes = await _selectedImage!.readAsBytes();
      final response = await http.post(
        Uri.parse(_uploadUrl),
        headers: {
          'x-api-key': _apiKey,
          'Content-Type': 'image/jpeg',
        },
        body: bytes,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Simulando a criação do vídeo com uma URL fictícia (substitua com lógica real da API).
        setState(() {
          _videoUrl = 'https://video.simulado.com/dancing_video.mp4';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Vídeo gerado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao enviar imagem: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dançando com HeyGen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                height: 200,
                fit: BoxFit.cover,
              )
            else
              Placeholder(
                fallbackHeight: 200,
                color: Colors.grey,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Selecionar Imagem'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _uploadAndGenerateVideo,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Gerar Vídeo Dançando'),
            ),
            SizedBox(height: 20),
            if (_videoUrl != null)
              Column(
                children: [
                  Text(
                    'Seu vídeo está pronto! Clique abaixo para assistir:',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Abre o vídeo no navegador ou player.
                      // Substitua por uma integração mais avançada, se necessário.
                      print('URL do vídeo: $_videoUrl');
                    },
                    child: Text('Assistir ao Vídeo'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
