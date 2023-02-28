// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class CoffeTile extends StatelessWidget {
  final String coffeImagePath;
  final String coffeName;
  final String coffePrice;
  const CoffeTile({
    super.key,
    required this.coffeImagePath,
    required this.coffeName,
    required this.coffePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 60),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            //* Imagem -> Coffe image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeImagePath),
            ),

            //* Nome -> Coffe name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Com leite de amêndoas',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            //* Preço - Coffe price
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('R\$' + coffePrice),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
