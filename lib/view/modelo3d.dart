import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produto 3D"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Cube(
              onSceneCreated: (Scene scene) {
                final obj = Object(fileName: "assets/cube/Jeep_Renegade_2016.obj");
                // Ajustando a rotação para mostrar o produto de frente, mas um pouco ao lado
                obj.rotation.setValues(0, 60, 0); // 0 no eixo X, 45 no eixo Y, 0 no eixo Z
                obj.scale.setValues(8.0, 8.0, 8.0); // Escala do modelo para 8.0 em todos os eixos
                obj.updateTransform(); // Aplica as transformações
                scene.world.add(obj);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nome do Produto",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Descrição detalhada do produto. Aqui você pode adicionar informações sobre características, materiais e funcionalidades.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: const Text("Comprar Agora"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
