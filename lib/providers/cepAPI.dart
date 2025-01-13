import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myproject/models/cepModel.dart';


class CepProvider {
  final String _baseUrl = 'https://viacep.com.br/ws'; // Endpoint base da API

  Future<CepCorreiosModel?> buscarEnderecoPorCep(String cep) async {
    try {
      final url = Uri.parse('$_baseUrl/$cep/json/');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CepCorreiosModel.fromJson(data);
      } else {
        throw Exception('Erro ao buscar endereço. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro na requisição: $e');
      return null;
    }
  }
}
