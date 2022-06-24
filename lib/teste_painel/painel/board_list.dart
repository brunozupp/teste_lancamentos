import 'package:flutter/material.dart';

import 'package:teste_lancamentos/teste_painel/painel/board_item.dart';
import 'package:teste_lancamentos/teste_painel/painel/boardview.dart';

typedef OnDropList = void Function(int? listIndex,int? oldListIndex);

typedef OnTapList = void Function(int? listIndex);

typedef OnStartDragList = void Function(int? listIndex);

class BoardList extends StatefulWidget {
  final List<Widget>? header;
  final Widget? footer;
  final List<BoardItem>? items;
  final Color backgroundColor;
  final Color headerBackgroundColor;
  final BoardViewState? boardView;
  final OnDropList? onDropList;
  final OnTapList? onTapList;
  final OnStartDragList? onStartDragList;
  final bool draggable;
  final BorderRadiusGeometry? borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry borderWidth;

  const BoardList({
    super.key,
    this.header,
    this.footer,
    this.items,
    this.backgroundColor = Colors.white,
    this.headerBackgroundColor = Colors.white,
    this.boardView,
    this.onDropList,
    this.onTapList,
    this.onStartDragList,
    this.draggable = true,
    this.borderRadius,
    this.borderColor = Colors.white,
    this.borderWidth = EdgeInsets.zero,
    this.index,
  });

  final int? index;

  @override
  State<StatefulWidget> createState() {
    return BoardListState();
  }
}

class BoardListState extends State<BoardList> with AutomaticKeepAliveClientMixin{
  
  List<BoardItemState> itemStates = [];

  ScrollController boardListController = ScrollController();

  void onDropList(int? listIndex) {
    if(widget.onDropList != null){
      widget.onDropList!(listIndex,widget.boardView!.startListIndex);
    }
    widget.boardView!.draggedListIndex = null;
    if(widget.boardView!.mounted) {
      widget.boardView!.setState(() {

      });
    }
  }

  void _startDrag(Widget item, BuildContext context) {
    if (widget.boardView != null && widget.draggable) {
      if(widget.onStartDragList != null){
        widget.onStartDragList!(widget.index);
      }
      widget.boardView!.startListIndex = widget.index;
      widget.boardView!.height = context.size!.height;
      widget.boardView!.draggedListIndex = widget.index!;
      widget.boardView!.draggedItemIndex = null;
      widget.boardView!.draggedItem = item;
      widget.boardView!.onDropList = onDropList;
      widget.boardView!.run();
      if(widget.boardView!.mounted) {
        widget.boardView!.setState(() {});
      }
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    super.build(context);

    List<Widget> listWidgets = [];
    if (widget.header != null) {

      listWidgets.add(GestureDetector(
          onTap: (){
            if(widget.onTapList != null){
              widget.onTapList!(widget.index);
            }
          },
          onTapDown: (otd) {
            if(widget.draggable) {
              RenderBox object = context.findRenderObject() as RenderBox;
              Offset pos = object.localToGlobal(Offset.zero);
              widget.boardView!.initialX = pos.dx;
              widget.boardView!.initialY = pos.dy;

              widget.boardView!.rightListX = pos.dx + object.size.width;
              widget.boardView!.leftListX = pos.dx;
            }
          },
          onTapCancel: () {},
          onLongPress: () {
            if(!widget.boardView!.widget.isSelecting && widget.draggable) {
              _startDrag(widget, context);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.headerBackgroundColor,
              borderRadius: widget.borderRadius,
            ),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.header!),
          ),
        ),
      );
    }
    if (widget.items != null) {
      listWidgets.add(
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            controller: boardListController,
            itemCount: widget.items!.length,
            itemBuilder: (ctx, index) {
              if (widget.items![index].boardList == null ||
                  widget.items![index].index != index ||
                  widget.items![index].boardList!.widget.index !=
                      widget.index ||
                  widget.items![index].boardList != this) {
                widget.items![index] = BoardItem(
                  boardList: this,
                  item: widget.items![index].item,
                  draggable: widget.items![index].draggable,
                  index: index,
                  onDropItem: widget.items![index].onDropItem,
                  onTapItem: widget.items![index].onTapItem,
                  onDragItem: widget.items![index].onDragItem,
                  onStartDragItem: widget.items![index].onStartDragItem,
                );
              }
              if (widget.boardView!.draggedItemIndex == index &&
                  widget.boardView!.draggedListIndex == widget.index) {
                return Opacity(
                  opacity: 0.0,
                  child: widget.items![index],
                );
              } else {
                return widget.items![index];
              }
            },
          ),
        ),
      );
    }

    if (widget.footer != null) {
      listWidgets.add(widget.footer!);
    }

    if (widget.boardView!.listStates.length > widget.index!) {
      widget.boardView!.listStates.removeAt(widget.index!);
    }
    
    widget.boardView!.listStates.insert(widget.index!, this);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.borderColor,
          borderRadius: widget.borderRadius,
        ),
        child: Container(
          margin: widget.borderWidth,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.borderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: listWidgets,
          ),
        ),
      ),
    );
  }
}
