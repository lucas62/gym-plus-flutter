import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> exercicios = [
    {
      'foto': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'titulo': 'Abdominal',
      'series': 3,
      'repeticoes': 10,
    },
    {
      'foto': 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'titulo': 'Agachamento Stiff',
      'series': 5,
      'repeticoes': 15,
    },
    // Adicione mais itens se necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Icon(
              Icons.account_circle_rounded,
              size: 46,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Olá,"),
                Text("Lucas Anselmo"),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Exercícios"),
                Text(exercicios.length.toString()),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: exercicios.length,
                itemBuilder: (context, index) {
                  final exercicio = exercicios[index];
                  final foto = exercicio['foto'];
                  final titulo = exercicio['titulo'];
                  final series = exercicio['series'];
                  final repeticoes = exercicio['repeticoes'];

                  return Card(
                    color: const Color(0xFF29292E), // Alterar cor de fundo do card
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/home/exercise/description',
                          arguments: {
                            'foto': foto,
                            'titulo': titulo,
                            'series': series,
                            'repeticoes': repeticoes,
                          },
                        );
                      },
                      leading: CachedNetworkImage(
                        imageUrl: foto,
                        width: 56,
                        height: 56,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      title: Text(
                        titulo,
                        style: const TextStyle(
                          color: Colors.white, // Alterar cor do título
                        ),
                      ),
                      subtitle: Text(
                        'Series: $series | Repetições: $repeticoes',
                        style: const TextStyle(
                          color: Color(0xFFC4C4CC), // Alterar cor do subtitulo
                        ),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 32,
                        color: Color(0xFFC4C4CC), // Alterar cor do ícone
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
