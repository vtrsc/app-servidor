import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/estilos.dart';


class CardNoticias extends StatelessWidget {
  final String image;
  final Widget noticia;
  final VoidCallback? onTap;
  const CardNoticias({
    super.key,
    required this.image,
    required this.noticia,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = (fem * 0.97);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 31 * ffem, right: 31 * ffem, bottom: 20 * ffem),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 16 * ffem, right: 16 * ffem, top: 25 * ffem),
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: Estilos.branco,
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain, alignment: Alignment.bottomCenter),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 16 * ffem, right: 16 * ffem, top: 25 * ffem),
                width: double.infinity,
                height: 164,
                decoration: const BoxDecoration(
                    color: Estilos.branco,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    noticia,
                    Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Saiba Mais',
                          style: GoogleFonts.getFont(
                            'Nunito',
                            color: const Color(0xFF2A93F2),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
