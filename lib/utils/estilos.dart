// ignore_for_file: prefer_interpolation_to_compose_strings, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/utils/config.dart';




class Estilos {
  static const branco = Color.fromARGB(255, 255, 255, 255);
  static const azulGradient1 = Color(0xFF0575E6);
  static const azulGradient2 = Color(0xFF02298A);
  static const azulGradient3 = Color(0xFF021B79);
  static const azulGradient4 = Color(0xFF045ac2);
  static const azulGradient5 = Color(0xFF044bb0);
  static const azulClaro = Color(0xFF1E8CD2);
  static const colorIconsInicial = Color(0xFF2A93F2);
  static const colorBGIconsInicial = Color(0xFFCCE9FF);
  static const preto = Color.fromARGB(255, 0, 0, 0);
  static const cinza = Color.fromARGB(255, 117, 117, 117);
  static const cinzaDivider = Color.fromARGB(255, 246, 246, 246);
  static const cinzaClaro = Color(0xFFE2DEDE);
  static const cinzaClaroAzulado = Color(0xFFAAB2C8);
  static const verdeEscuro = Color.fromARGB(255, 76, 175, 80);
  static const roxo = Color.fromARGB(255, 103, 58, 183);
  static const vermelho = Color.fromARGB(255, 219, 34, 34);
  static const cinzaMenu = Color(0XFF7C7A80);
  static const vermelhoMenu = Color(0xFFD55F5A);
  static const azulFundo = Color.fromARGB(100, 204, 233, 255);
  static const danger = Color.fromARGB(255, 248, 215, 218);
  static const textDanger = Color.fromARGB(255, 114, 28, 36);
  static const textWarning = Color.fromARGB(255, 133, 100, 4);
  static const warning = Color.fromARGB(255, 255, 243, 205);
  static const success = Color.fromARGB(255, 212, 237, 218);
  static const textSuccess = Color.fromARGB(255, 21, 87, 36);
  static const vermelhoClaro = Color(0xFFFFE3E1);
  // Estilos Frotas
  static const amarelo = Color(0xffF6CA2C);
  static const fundoAmarelo = Color(0xffFFEEB0);
  static const verde = Color(0xff23A26D);
  static const fundoVerde = Color(0xffE4F3ED);
  static const fundoVermelho = Color(0xffFFE3E1);

  static late double baseWidth;
  static late double fem;
  static late double ffem;

  void recuperarTamanho(context) {
    baseWidth = 400;
    fem = MediaQuery.of(context).size.width / baseWidth;
    ffem = (fem * 0.97);
  }

  static final ThemeData temaPadrao = ThemeData(
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: branco,
      foregroundColor: preto,
      titleTextStyle: GoogleFonts.getFont(
        'Comfortaa',
        textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Estilos.preto),
      ),
    ),
    primaryColor: const Color(0xff37474f),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xff546e7a),
    ),
  );

  static appBarHome(context, titulo, scaffoldKey, double ffem, {bool icon = false, onTap, String? imageIcon}) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
      statusBarBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
    );

    return AppBar(
      elevation: 0,
      toolbarHeight: 112,
      systemOverlayStyle: systemUiOverlayStyle,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Estilos.azulGradient4,
              Estilos.azulGradient2,
              Estilos.azulGradient3,
            ],
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15 * ffem),
                child: GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Estilos.branco,
                  ),
                ),
              ),
              Text(
                "Olá, $titulo !",
                style: GoogleFonts.getFont(
                  'Comfortaa',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.24,
                  color: Estilos.branco,
                ),
              ),
            ],
          ),
          icon
              ? GestureDetector(
                  onTap: onTap,
                  child: imageIcon != null
                      ? SvgPicture.asset(
                          imageIcon,
                          color: Estilos.branco,
                          width: 24,
                          height: 24,
                        )
                      : Container(),
                )
              : Container(),
        ],
      ),
      leading: Container(),
      leadingWidth: 10,
    );
  }

  static appbar(context, titulo, {bool icon = false, onTap, String? imageIcon}) {
    double ffem = Configuracoes.recuperarTamanho(context);
    return AppBar(
      foregroundColor: Estilos.branco,
      toolbarHeight: 112 * ffem,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
        statusBarBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Estilos.azulGradient4, Estilos.azulGradient3],
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: GoogleFonts.getFont(
              'Comfortaa',
              textStyle:
                  TextStyle(fontSize: 16 * ffem, fontFamily: 'Nunito', fontWeight: FontWeight.w400, height: 0, letterSpacing: -0.24, color: Estilos.branco),
            ),
          ),
          icon
              ? GestureDetector(
                  onTap: onTap,
                  child: imageIcon != null
                      ? SvgPicture.asset(
                          imageIcon,
                          color: Estilos.branco,
                          width: 24 * ffem,
                          height: 24 * ffem,
                        )
                      : const Icon(Icons.visibility),
                )
              : Container()
        ],
      ),
      elevation: 0,
    );
  }

  static appbar2(context, titulo) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
        statusBarBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
      ),
      foregroundColor: Estilos.branco,
      toolbarHeight: 112,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Estilos.azulGradient5, Estilos.azulGradient3],
          ),
        ),
      ),
      //actions: isVisible ? [const VisibilityIcon()] : [],
      title: Text(
        titulo,
        style: GoogleFonts.getFont(
          'Nunito',
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 0, letterSpacing: -0.24, color: Estilos.branco),
        ),
      ),
      elevation: 0,
    );
  }

  static appBarBranca(context, double ffem) {
    return AppBar(
      toolbarHeight: 60 * ffem,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
        statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
      ),
      backgroundColor: Estilos.branco,
      elevation: 0,
    );
  }
}
