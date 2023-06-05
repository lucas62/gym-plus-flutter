import 'package:flutter/material.dart';

class DescricaoExercicioPage extends StatelessWidget {
  final String foto;
  final String titulo;
  final int series;
  final int repeticoes;

  const DescricaoExercicioPage({super.key,
    required this.foto,
    required this.titulo,
    required this.series,
    required this.repeticoes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(foto),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Series: $series'),
                  Text('Repetições: $repeticoes'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}