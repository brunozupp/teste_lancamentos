import 'package:flutter/material.dart';
import 'package:teste_lancamentos/teste_painel/painel/board_item.dart';
import 'package:teste_lancamentos/teste_painel/painel/board_list.dart';
import 'package:teste_lancamentos/teste_painel/painel/boardview.dart';
import 'package:teste_lancamentos/teste_painel/painel/boardview_controller.dart';
import 'package:teste_lancamentos/teste_painel/widgets/item_carrossel.dart';

class TestePainelPage extends StatefulWidget {
  const TestePainelPage({Key? key}) : super(key: key);

  @override
  State<TestePainelPage> createState() => _TestePainelPageState();
}

class _TestePainelPageState extends State<TestePainelPage> {

  final BoardViewController boardViewController = BoardViewController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              padding: EdgeInsets.only(
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
                  SizedBox(width: 10),
                  ItemCarrossel(
                    text: "2",
                    onTap: () {
                      boardViewController.animateTo(1);
                    },
                  ),
                  SizedBox(width: 10),
                  ItemCarrossel(
                    text: "3",
                    onTap: () {
                      boardViewController.animateTo(2);
                    },
                  ),
                  SizedBox(width: 10),
                  ItemCarrossel(
                    text: "4",
                    onTap: () {
                      boardViewController.animateTo(3);
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
        backgroundColor: Color(0xFFE5E5E5),
        headerBackgroundColor: Color(0xFFE5E5E5),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        borderColor: Color(0xFF0069B3),
        borderWidth: EdgeInsets.only(
          left: 8,
        ),
        header: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
            ),
            child: Text(
              "Lista 1",
            ),
          ),
        ],
        items: _generateBoardItem(
          length: 15,
          nameList: "Lista 1",
        ),
      ),
      BoardList(
        backgroundColor: Colors.green,
        headerBackgroundColor: Colors.green,
        header: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              "Lista 2",
            ),
          ),
        ],
        items: _generateBoardItem(
          length: 1,
          nameList: "Lista 2",
        ),
      ),
      BoardList(
        backgroundColor: Colors.grey,
        headerBackgroundColor: Colors.grey,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
          bottom: Radius.circular(20),
        ),
        header: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              "Lista 3",
            ),
          ),
        ],
        items: _generateBoardItem(
          length: 0,
          nameList: "Lista 3",
        ),
      ),
      BoardList(
        backgroundColor: Colors.orange,
        headerBackgroundColor: Colors.orange,
        header: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: Text(
              "Lista 4",
            ),
          ),
        ],
        items: _generateBoardItem(
          length: 15,
          nameList: "Lista 4",
        ),
      ),
    ];
  }

  List<BoardItem> _generateBoardItem({
    required String nameList,
    required int length
  }) {
    return List.generate(length, (index) => BoardItem(
      item: Card(
        color: Color(0xFFf4f6fa),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Text(
            "$nameList - $index",
          ),
        ),
      ),
    ));
  }
}