import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/botao.dart';
import 'package:myproject/camera.dart';
import 'package:myproject/config.dart';
import 'package:myproject/estilos.dart';
import 'package:myproject/cardNoticias.dart';

class HomeServidorView extends StatefulWidget {
  const HomeServidorView({Key? key}) : super(key: key);

  @override
  _HomeServidorViewWidgetState createState() => _HomeServidorViewWidgetState();
}

class _HomeServidorViewWidgetState extends State<HomeServidorView>
    with WidgetsBindingObserver {
  bool isLoadingButton = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double ffem = Configuracoes.recuperarTamanho(context);

    return Scaffold(
      backgroundColor: Estilos.branco,
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.getFont(
            'Nunito',
            color: Estilos.branco,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Estilos.azulGradient4,
        elevation: 0, // Remover a sombra do AppBar
      ),
      body: Container(
        color: Estilos.azulGradient4,
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
                            color: Estilos.azulGradient3,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      // Coluna Rolável Horizontal com Botões
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 31 * ffem, vertical: 15 * ffem),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 10), // Espaçamento entre os botões
                              BtnPadraoSquare(
                                onTap: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const CameraApp())),
                                icon: Icons
                                    .add_a_photo_rounded, // Ícone personalizado
                                textBtn: "Casa",
                                bgIconColor: Colors.blue.shade100,
                                iconColor: Colors.blue,
                              ),
                              BtnPadraoSquare(
                                onTap: () =>
                                    Navigator.pushNamed(context, "camera"),
                                icon: Icons
                                    .auto_stories_rounded, // Ícone personalizado
                                textBtn: "Casa",
                                bgIconColor: Colors.blue.shade100,
                                iconColor: Colors.blue,
                              ),
                              BtnPadraoSquare(
                                onTap: () => print("Casa clicada"),
                                icon: Icons
                                    .bar_chart_rounded, // Ícone personalizado
                                textBtn: "Casa",
                                bgIconColor: Colors.blue.shade100,
                                iconColor: Colors.blue,
                              ),
                              BtnPadraoSquare(
                                onTap: () => print("Casa clicada"),
                                icon: Icons.home, // Ícone personalizado
                                textBtn: "Casa",
                                bgIconColor: Colors.blue.shade100,
                                iconColor: Colors.blue,
                              ),
                              BtnPadraoSquare(
                                onTap: () => print("Casa clicada"),
                                icon: Icons.home, // Ícone personalizado
                                textBtn: "Casa",
                                bgIconColor: Colors.blue.shade100,
                                iconColor: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Título Notícias
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 31 * ffem, vertical: 15 * ffem),
                        child: Text(
                          'Notícias',
                          style: GoogleFonts.getFont(
                            'Nunito',
                            color: Estilos.azulGradient3,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // Notícias
                      CardNoticias(
                        image: 'assets/imagens/alarme.png',
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
                                text:
                                    ', de 13 de dezembro de 2023, os feriados de 2024.',
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

                      // Row Rolável Horizontal com 3 Botões Square Padrão
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
