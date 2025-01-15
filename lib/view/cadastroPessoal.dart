import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/models/cepModel.dart';
import 'package:myproject/providers/cepAPI.dart';
import 'package:myproject/utils/estilos.dart';

class LancamentoCadPessoaPage extends StatefulWidget {
  const LancamentoCadPessoaPage({super.key});

  @override
  _LancamentoCadPessoaPageState createState() => _LancamentoCadPessoaPageState();
}

class _LancamentoCadPessoaPageState extends State<LancamentoCadPessoaPage> {
  String? radioButtonTipoCadPessoaValue;
  TextEditingController CepController = TextEditingController();
  TextEditingController BairroController = TextEditingController();
  TextEditingController CidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  btnPesquisa(context) async {
    final CepProvider cepProvider = CepProvider(); // Crie uma instância do CepProvider

    if (CepController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CEP Inválido')),
      );
      return;
    }

    CepCorreiosModel? buscaEnderecoModel = await cepProvider.buscarEnderecoPorCep(CepController.text);

    if (buscaEnderecoModel != null) {
      CepController.text = buscaEnderecoModel.cep ?? '';
      BairroController.text = buscaEnderecoModel.bairro ?? '';
      CidadeController.text = buscaEnderecoModel.localidade ?? '';
      ufController.text = buscaEnderecoModel.uf ?? '';
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CEP não encontrado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro Pessoal',
          style: GoogleFonts.getFont(
            'Nunito',
            color: Estilos.branco,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFF4A148C),
        elevation: 0,
      ),
      backgroundColor: Estilos.branco,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16 * fem, 26 * fem, 0 * fem, 6 * fem),
                  child: Text(
                    'Munícipe',
                    style: GoogleFonts.getFont(
                      'Comfortaa',
                      fontSize: 27 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.115 * ffem / fem,
                      letterSpacing: -0.54 * fem,
                      color: Estilos.preto,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'CPF/CNPJ *',
                      hintText: 'Informe o CPF/CNPJ',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome Pessoa/Empresa *',
                      hintText: 'Informe o Nome',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.text,
                    maxLength: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      hintText: 'Informe o Telefone',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: TextFormField(
                            controller: CepController,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            decoration: InputDecoration(
                              labelText: 'CEP *',
                              hintText: 'Informe o CEP',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  btnPesquisa(context);
                                },
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: BairroController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Bairro *',
                      hintText: 'Informe o Bairro',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    maxLength: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: CidadeController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Cidade *',
                      hintText: 'Informe a Cidade',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    maxLength: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: ufController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Estado *',
                      hintText: 'Informe o Estado',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    maxLength: 50,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A148C), // Cor de fundo roxa
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // Borda quadrada
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32), // Ajuste o padding para um tamanho mais adequado
                    minimumSize: const Size(double.infinity, 60), // O botão ocupará toda a largura e terá altura de 60
                  ),
                  onPressed: () {
                    // Ação ao salvar os dados
                  },
                  child: Text(
                    'Salvar',
                    style: GoogleFonts.poppins(
                      fontSize: 18, // Tamanho da fonte ajustado
                      fontWeight: FontWeight.w600,
                      color: Estilos.branco, // Cor do texto em branco
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
