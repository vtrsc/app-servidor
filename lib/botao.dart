// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:myproject/estilos.dart';


class BtnPadraoSquare extends StatefulWidget {
  final bool visible;
  final Function() onTap;
 
  final Color iconColor;
  final Color bgIconColor;
  final bool isLoading;
  final String textBtn;
  final String secondTextBtn;

  const BtnPadraoSquare({
    super.key,
    this.visible = true,
    required this.onTap,
    
    this.iconColor = Estilos.colorIconsInicial,
    this.bgIconColor = Estilos.colorBGIconsInicial,
    this.isLoading = false,
    required this.textBtn,
    this.secondTextBtn = "",
  });

  @override
  State<BtnPadraoSquare> createState() => _BtnPadraoSquareState();
}

class _BtnPadraoSquareState extends State<BtnPadraoSquare> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Visibility(
      visible: widget.visible,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.only(right: 15 * ffem),
          width: 102,
          height: 122,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 20,
                offset: Offset(0, 70),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: widget.bgIconColor,
                      borderRadius: BorderRadius.circular(100), // Define o raio em pixels
                    ),
                    width: 45,
                    height: 45,
                  ),
                
                      Icon(
                          Icons.add_home_work,
                          color: widget.iconColor,
                        ),
                     
                ],
              ),
              Container(
                height: 35,
                margin: EdgeInsets.only(top: 5 * ffem),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.textBtn,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.56, // Use Estilos.preto, se estiver definido em outro lugar.
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
