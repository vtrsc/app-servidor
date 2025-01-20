import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Videogenerator extends StatefulWidget {
  const Videogenerator({super.key});

  @override
  _VideogeneratorState createState() => _VideogeneratorState();
}

class _VideogeneratorState extends State<Videogenerator> {
  File? _selectedImage;
  bool _isLoading = false;
  String? _videoUrl;

  final String _apiKey = 'MWViOTU5MzYyMmM3NDg4ODg2N2QzYTIwZmVjNDM3NDgtMTY5NTg1MzIwNQ==';
  final String _uploadUrl = 'https://api.heygen.com/v1/video';

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _uploadAndGenerateVideo() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione uma imagem primeiro!')),
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
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "template_id": "default",
          "text": "Olá! Este é um vídeo gerado automaticamente.",
          "photo": base64Encode(bytes),
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        setState(() {
          _videoUrl = responseData['data']['video_url'];
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vídeo gerado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: ${response.body}')),
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
        title: const Text('Dançando com HeyGen'),
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
              const Column(
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Selecione uma imagem',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Selecionar Imagem'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _uploadAndGenerateVideo,
              child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Gerar Vídeo'),
            ),
            const SizedBox(height: 20),
            if (_videoUrl != null)
              Column(
                children: [
                  const Text(
                    'Seu vídeo está pronto! Clique abaixo para assistir:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('URL do vídeo: $_videoUrl');
                    },
                    child: const Text('Assistir ao Vídeo'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
