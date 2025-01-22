import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModifyTemplateScreen extends StatefulWidget {
  const ModifyTemplateScreen({super.key});

  @override
  _ModifyTemplateScreenState createState() => _ModifyTemplateScreenState();
}

class _ModifyTemplateScreenState extends State<ModifyTemplateScreen> {
  final String _apiKey = 'MWViOTU5MzYyMmM3NDg4ODg2N2QzYTIwZmVjNDM3NDgtMTY5NTg1MzIwNQ==';
  final String _templateId = 'exemplo-template-id'; // Substitua pelo seu templateId real
  final String _videoUrl =
      'https://files.heygencdn.com/prod/movio/preset/video/origin/0aec3387a37c43f1abd463378d261f3c.mp4'; // Substitua por outra URL de vídeo, se necessário
  bool _isLoading = false;
  String? _responseMessage;

  Future<void> modifyTemplate() async {
    const String apiUrl = 'https://api.heygen.com/v2/template/<template_id>/generate';
    final String generateUrl = apiUrl.replaceFirst('<template_id>', _templateId);

    setState(() {
      _isLoading = true;
      _responseMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse(generateUrl),
        headers: {
          'X-Api-Key': _apiKey,
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "caption": false,
          "title": "Teste de Vídeo",
          "variables": {
            "shopping_video": {
              "name": "shopping_video",
              "type": "video",
              "properties": {
                "url": _videoUrl,
                "asset_id": null,
                "play_style": "loop",
                "fit": "contain",
              }
            }
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final videoId = data['video_id'];
        setState(() {
          _responseMessage = 'Vídeo gerado com sucesso! ID: $videoId';
        });
      } else {
        throw Exception('Erro ao modificar template: ${response.body}');
      }
    } catch (e) {
      setState(() {
        _responseMessage = 'Erro: $e';
      });
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
        title: const Text('Modificar Template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : modifyTemplate,
              child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Substituir Vídeo e Gerar'),
            ),
            const SizedBox(height: 16),
            if (_responseMessage != null)
              Text(
                _responseMessage!,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
