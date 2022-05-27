import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';

class CollapseBoardviewPage extends StatefulWidget {
  const CollapseBoardviewPage({Key? key}) : super(key: key);

  @override
  State<CollapseBoardviewPage> createState() => _CollapseBoardviewPageState();
}

class _CollapseBoardviewPageState extends State<CollapseBoardviewPage> {
  
  final boardViewController = BoardViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boardview do Colapso"),
      ),
      body: BoardView(
        boardViewController: boardViewController,
        lists: <BoardList>[
          _gerarBoardList(
            title: "Coluna 1"
          ),
          _gerarBoardList(
            title: "Coluna 2"
          ),
          _gerarBoardList(
            title: "Coluna 3"
          ),
          _gerarBoardList(
            title: "Coluna 4"
          ),
        ],
      ),
    );
  }

  BoardList _gerarBoardList({
    required String title,
  }) {
    return BoardList(
      draggable: false,
      onStartDragList: (int? listIndex) {
    
      },
      onTapList: (int? listIndex) async {
    
      },
      onDropList: (int? listIndex, int? oldListIndex) {       
      
      },
      headerBackgroundColor: const Color.fromARGB(255, 235, 236, 240),
      backgroundColor: const Color.fromARGB(255, 235, 236, 240),
      header: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
      items: [
        BoardItem(
          onStartDragItem: (int? listIndex, int? itemIndex, BoardItemState state) {
          
          },
          onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
              int? oldItemIndex, BoardItemState state) {
                        
          },
          onTapItem: (int? listIndex, int? itemIndex, BoardItemState state) async {
          
          },
          item: const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Board Item"),
            ),
          )
        ),
      ],
    );
  }
}