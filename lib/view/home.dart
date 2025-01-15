import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/utils/config.dart';
import 'package:myproject/utils/estilos.dart';
import 'package:myproject/view/botao.dart';
import 'package:myproject/view/cadastroPessoal.dart';
import 'package:myproject/view/camera.dart';
import 'package:myproject/view/cardNoticias.dart';

class HomeServidorView extends StatefulWidget {
  const HomeServidorView({super.key});

  @override
  _HomeServidorViewWidgetState createState() => _HomeServidorViewWidgetState();
}

class _HomeServidorViewWidgetState extends State<HomeServidorView> with WidgetsBindingObserver {
  bool isLoadingButton = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double ffem = Configuracoes.recuperarTamanho(context);

    return Scaffold(
      backgroundColor: Estilos.branco,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Impede o botão de voltar
        backgroundColor: const Color(0xFF4A148C), // Cor de fundo do AppBar
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A148C), Color(0xFF7C4DFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/nextbyte.png', // Caminho correto da imagem
              height: 50, // Ajuste a altura conforme necessário
              color: Colors.white, // Define a cor branca para a imagem
              fit: BoxFit.contain, // Mantém a proporção da imagem
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF4A148C), // Alterado para roxo escuro
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Estilos.branco,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: isLoadingButton
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 35),

                      // Título Acesso Rápido
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 31 * ffem),
                        child: Text(
                          'Acesso Rápido',
                          style: GoogleFonts.getFont(
                            'Nunito',
                            color: const Color(0xFF7C4DFF), // Cor roxa vibrante
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      // Coluna Rolável Horizontal com Botões
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 31 * ffem, vertical: 15 * ffem),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const SizedBox(width: 10), // Espaçamento entre os botões
                              BtnPadraoSquare(
                                onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const CameraApp())),
                                icon: Icons.add_a_photo_rounded,
                                textBtn: "Casa",
                                bgIconColor: Colors.deepPurple.shade100, // Alterado para roxo claro
                                iconColor: Colors.deepPurple,
                              ),
                              BtnPadraoSquare(
                                onTap: () => Navigator.pushNamed(context, "camera"),
                                icon: Icons.auto_stories_rounded,
                                textBtn: "Casa",
                                bgIconColor: Colors.deepPurple.shade100,
                                iconColor: Colors.deepPurple,
                              ),
                              BtnPadraoSquare(
                                onTap: () => print("Casa clicada"),
                                icon: Icons.bar_chart_rounded,
                                textBtn: "Casa",
                                bgIconColor: Colors.deepPurple.shade100,
                                iconColor: Colors.deepPurple,
                              ),
                              BtnPadraoSquare(
                                onTap: () => print("Casa clicada"),
                                icon: Icons.home,
                                textBtn: "Casa",
                                bgIconColor: Colors.deepPurple.shade100,
                                iconColor: Colors.deepPurple,
                              ),
                              BtnPadraoSquare(
                                onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const LancamentoCadPessoaPage())),
                                icon: Icons.edit_sharp,
                                textBtn: "Cadastro",
                                bgIconColor: Colors.deepPurple.shade100,
                                iconColor: Colors.deepPurple,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Título Notícias
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 31 * ffem, vertical: 15 * ffem),
                        child: Text(
                          'Notícias',
                          style: GoogleFonts.getFont(
                            'Nunito',
                            color: const Color(0xFF7C4DFF), // Cor roxa vibrante
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Notícias
                      CardNoticias(
                        image: 'assets/alarme.png',
                        onTap: () {},
                        noticia: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'A ',
                                style: TextStyle(
                                  color: Color(0xFF1C1939),
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                  height: 1.65,
                                ),
                              ),
                              TextSpan(
                                text: 'Secretaria de Inovação e Administração ',
                                style: TextStyle(
                                  color: Color(0xFF1C1939),
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700,
                                  height: 1.65,
                                ),
                              ),
                              TextSpan(
                                text: 'comunica, nos termos do ',
                                style: TextStyle(
                                  color: Color(0xFF1C1939),
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                  height: 1.65,
                                ),
                              ),
                              TextSpan(
                                text: 'Decreto Municipal nº 18.209',
                                style: TextStyle(
                                  color: Color(0xFF1C1939),
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700,
                                  height: 1.65,
                                ),
                              ),
                              TextSpan(
                                text: ', de 13 de dezembro de 2023, os feriados de 2024.',
                                style: TextStyle(
                                  color: Color(0xFF1C1939),
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                  height: 1.65,
                                ),
                              ),
                            ],
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
