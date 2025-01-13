import 'dart:convert';

// Função para converter o JSON da API para o modelo.
CepCorreiosModel enderecoFromJson(String str) =>
    CepCorreiosModel.fromJson(json.decode(str));

// Função para converter o modelo para JSON.
String enderecoToJson(CepCorreiosModel data) => json.encode(data.toJson());

class CepCorreiosModel {
  String? cep; // Código postal
  String? logradouro; // Nome da rua/avenida
  String? complemento; // Complemento do endereço
  String? unidade; // Unidade
  String? bairro; // Nome do bairro
  String? localidade; // Nome da cidade
  String? uf; // Unidade federativa (estado)
  String? estado; // Estado completo
  String? regiao; // Região
  String? ibge; // Código IBGE
  String? gia; // Código GIA
  String? ddd; // Código DDD
  String? siafi; // Código SIAFI

  CepCorreiosModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.unidade,
    this.bairro,
    this.localidade,
    this.uf,
    this.estado,
    this.regiao,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  });

  // Método para converter um JSON em um objeto do modelo.
  factory CepCorreiosModel.fromJson(Map<String, dynamic> json) =>
      CepCorreiosModel(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        unidade: json["unidade"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        estado: json["estado"],
        regiao: json["regiao"],
        ibge: json["ibge"],
        gia: json["gia"],
        ddd: json["ddd"],
        siafi: json["siafi"],
      );

  // Método para converter o objeto do modelo para JSON.
  Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "unidade": unidade,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "estado": estado,
        "regiao": regiao,
        "ibge": ibge,
        "gia": gia,
        "ddd": ddd,
        "siafi": siafi,
      };
}
