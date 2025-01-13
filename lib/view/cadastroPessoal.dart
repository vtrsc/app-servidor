import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/models/cepModel.dart';
import 'package:myproject/providers/cepAPI.dart';
import 'package:myproject/utils/estilos.dart';

class LancamentoCadPessoaPage extends StatefulWidget {
  const LancamentoCadPessoaPage({
    super.key,
  });

  @override
  _LancamentoCadPessoaPageState createState() => _LancamentoCadPessoaPageState();
}

class _LancamentoCadPessoaPageState extends State<LancamentoCadPessoaPage> {
  String? radioButtonTipoCadPessoaValue;
  final textFieldCadPessoaCpfCnpjKey = GlobalKey();
  TextEditingController? textFieldCadPessoaCpfCnpjController;
  String? textFieldCadPessoaCpfCnpjSelectedOption;
  TextEditingController CepController = TextEditingController();
  TextEditingController BairroController = TextEditingController();
  TextEditingController CidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formNomeKey = GlobalKey<FormState>();
  String? validaNome(String? texto) {
    if (texto!.isEmpty) {
      return "Digite a nome";
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  btnPesquisa(context) async {
    final CepProvider cepProvider = CepProvider(); // Crie uma instância do CepProvider

    // Verifique se o campo de texto contém um CEP válido
    if (CepController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CEP Inválido')),
      );
      return;
    }

    // Chame o método buscarEnderecoPorCep passando o CEP
    CepCorreiosModel? buscaEnderecoModel = await cepProvider.buscarEnderecoPorCep(CepController.text);

    // Caso ache um CEP válido salva os valores
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
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Estilos.branco,
        shadowColor: Estilos.cinza,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Estilos.preto,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 4,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        key: textFieldCadPessoaCpfCnpjKey,
                        obscureText: false,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'CPF/CNPJ *',
                          hintText: 'Informe o CPF/CNPJ',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Estilos.preto,
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 15,
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: TextFormField(
                            validator: validaNome,
                            key: formNomeKey,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Nome Pessoa/Empresa *',
                              hintText: 'Informe o Nome da Pessoa/Empresa',
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                      ),
                    ],
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
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            controller: CepController,
                            decoration: const InputDecoration(
                              labelText: 'CEP *',
                              hintText: 'Informe o CEP',
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Estilos.azulClaro),
                        icon: const Icon(Icons.search),
                        label: const Text(
                          '',
                          style: TextStyle(color: Estilos.branco, fontSize: 25),
                        ),
                        onPressed: () {
                          btnPesquisa(context);
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: numeroController,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            maxLength: 5,
                            decoration: const InputDecoration(
                              labelText: 'Número *',
                              hintText: 'Informe o número',
                              border: OutlineInputBorder(),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: complementoController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Complemento',
                              hintText: 'Informe o complemento',
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxLength: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: TextFormField(
                            controller: logradouroController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Logradouro',
                              hintText: 'Informe o Logradouro',
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxLength: 200,
                          ),
                        ),
                      ),
                    ],
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
                            controller: BairroController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Bairro',
                              hintText: 'Bairro',
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxLength: 50,
                          ),
                        ),
                      ),
                    ],
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
                            controller: CidadeController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Cidade',
                              hintText: 'Cidade',
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxLength: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                          child: TextFormField(
                            controller: ufController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Estado',
                              hintText: 'Estado',
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            maxLength: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: Estilos.azulClaro),
                          icon: const Icon(Icons.save),
                          label: const Text(
                            'Salvar',
                            style: TextStyle(color: Estilos.branco, fontSize: 25),
                          ),
                          onPressed: () {
                            btnPesquisa;
                          }),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),

                            /* child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: LancamentoPage(),
                                  ),
                                );
                              },
                              text: 'Incluir Pessoa',
                              options: FFButtonOptions(
                                color: Estilos.azulClaro,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ), */
                          ),
                        ),
                      ),
                    ],
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
