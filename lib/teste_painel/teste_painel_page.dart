import 'package:flutter/material.dart';
import 'package:teste_lancamentos/teste_painel/painel/board_item.dart';
import 'package:teste_lancamentos/teste_painel/painel/board_list.dart';
import 'package:teste_lancamentos/teste_painel/painel/boardview.dart';
import 'package:teste_lancamentos/teste_painel/painel/boardview_controller.dart';
import 'package:teste_lancamentos/teste_painel/widgets/card_item.dart';
import 'package:teste_lancamentos/teste_painel/widgets/item_carrossel.dart';

class TestePainelPage extends StatefulWidget {
  const TestePainelPage({Key? key}) : super(key: key);

  @override
  State<TestePainelPage> createState() => _TestePainelPageState();
}

class _TestePainelPageState extends State<TestePainelPage> {

  final BoardViewController boardViewController = BoardViewController();

  final abertoColor = const Color(0xFF0069B3);
  final emAndamentoColor = const Color(0xFFE29521);
  final solucionadoColor = const Color(0xFFE2214F);
  final finalizadoColor = const Color(0xFF83DA1E);
  final canceladoColor = const Color(0xFF666666);

  final cardColor = const Color(0xFFF4F6FA);
  final listColor = const Color(0xFFE5E5E5);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teste Painel",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ItemCarrossel(
                    text: "1",
                    onTap: () {
                      boardViewController.animateTo(0);
                    },
                  ),
                  const SizedBox(width: 10),
                  ItemCarrossel(
                    text: "2",
                    onTap: () {
                      boardViewController.animateTo(1);
                    },
                  ),
                  const SizedBox(width: 10),
                  ItemCarrossel(
                    text: "3",
                    onTap: () {
                      boardViewController.animateTo(2);
                    },
                  ),
                  const SizedBox(width: 10),
                  ItemCarrossel(
                    text: "4",
                    onTap: () {
                      boardViewController.animateTo(3);
                    },
                  ),
                  const SizedBox(width: 10),
                  ItemCarrossel(
                    text: "5",
                    onTap: () {
                      boardViewController.animateTo(4);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BoardView(
                width: 340,
                lists: _generateBoardList(),
                boardViewController: boardViewController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BoardList> _generateBoardList() {
    return [
      BoardList(
        backgroundColor: listColor,
        headerBackgroundColor: listColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        borderColor: abertoColor,
        borderWidth: const EdgeInsets.only(
          //top: 8,
          //left: 8,
        ),
        header: _generateHeader(
          title: "Aberto  15",
          titleColor: abertoColor,
        ),
        items: _generateBoardItem(
          length: 15,
          nameList: "Em aberto",
          borderColor: abertoColor, 
        ),
      ),
      BoardList(
        backgroundColor: listColor,
        headerBackgroundColor: listColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        borderColor: emAndamentoColor,
        borderWidth: const EdgeInsets.only(
          left: 8,
        ),
        header: _generateHeader(
          title: "Em andamento  1",
          titleColor: emAndamentoColor,
        ),
        items: _generateBoardItem(
          length: 1,
          nameList: "Em andamento",
          borderColor: emAndamentoColor, 
        ),
      ),
      BoardList(
        backgroundColor: listColor,
        headerBackgroundColor: listColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        borderColor: solucionadoColor,
        borderWidth: const EdgeInsets.only(
          left: 8,
        ),
        header: _generateHeader(
          title: "Solucionado  0",
          titleColor: solucionadoColor,
        ),
        items: _generateBoardItem(
          length: 0,
          nameList: "Solucionado",
          borderColor: solucionadoColor, 
        ),
      ),
      BoardList(
        backgroundColor: listColor,
        headerBackgroundColor: listColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        borderColor: finalizadoColor,
        borderWidth: const EdgeInsets.only(
          left: 8,
        ),
        header: _generateHeader(
          title: "Finalizado  15",
          titleColor: finalizadoColor,
        ),
        items: _generateBoardItem(
          length: 15,
          nameList: "Finalizado",
          borderColor: finalizadoColor, 
        ),
      ),
      BoardList(
        backgroundColor: listColor,
        headerBackgroundColor: listColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        borderColor: canceladoColor,
        borderWidth: const EdgeInsets.only(
          left: 8,
        ),
        header: _generateHeader(
          title: "Cancelado  15",
          titleColor: canceladoColor,
        ),
        items: _generateBoardItem(
          length: 3,
          nameList: "Cancelado",
          borderColor: canceladoColor, 
        ),
      ),
    ];
  }

  List<Widget> _generateHeader({
    required Color titleColor,
    required String title,
  }) {
    return [
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<BoardItem> _generateBoardItem({
    required String nameList,
    required int length,
    required Color borderColor,
  }) {
    return List.generate(length, (index) => BoardItem(
      item: CardItem(
        text: nameList, 
        borderColor: borderColor
      ),
    ));
  }
}