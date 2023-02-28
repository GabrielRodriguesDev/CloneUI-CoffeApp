// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:coffeeappui/utils/coffe_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/coffe_types.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* Lista de tipos de cafés
  final List coffeType = [
    //*[CoffeType, isSelected]
    ['Capputino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false]
  ];

  //* Usuário clicou para alterar o tipo de café
  void coffeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          //* Encontre o melhor café para você -> Find the best coffe for you
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Encontre o melhor café para você',
              style: GoogleFonts.bebasNeue(fontSize: 40),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          //* Barra de pesquisa - Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Encontre seu café..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          //* Lista horizontal de de tipos de cafés -> horizontal listview off coffe types

          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeType.length,
              itemBuilder: (context, index) {
                return CoffeType(
                  coffeType: coffeType[index][0],
                  isSelected: coffeType[index][1],
                  onTap: () {
                    coffeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          //* Lista horizontal de cafés -> horizontal listview of coffe tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeTile(
                  coffeImagePath: 'lib/images/latte.jpg',
                  coffeName: 'Latte',
                  coffePrice: '12,00',
                ),
                CoffeTile(
                  coffeImagePath: 'lib/images/cappuccino.jpg',
                  coffeName: 'Cappuccino',
                  coffePrice: '14,00',
                ),
                CoffeTile(
                  coffeImagePath: 'lib/images/milk.jpg',
                  coffeName: 'Café com Leite',
                  coffePrice: '8,00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
