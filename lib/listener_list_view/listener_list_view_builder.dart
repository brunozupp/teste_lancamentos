import 'package:flutter/material.dart';

class ListenerListViewBuilder extends StatefulWidget {
  const ListenerListViewBuilder({ Key? key }) : super(key: key);

  @override
  State<ListenerListViewBuilder> createState() => _ListenerListViewBuilderState();
}

class _ListenerListViewBuilderState extends State<ListenerListViewBuilder> {

  final _controller = ScrollController();

  var itensDaLista = 50;

  var loading = false;

  void _onScrollEvent() {
    final extentAfter = _controller.position.extentAfter;
    print("Extent after: $extentAfter");

    if(extentAfter == 0.0 && itensDaLista < 200 && !loading) {
      
      setState(() {
        loading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          itensDaLista += 50;
          loading = false;
        });
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(_onScrollEvent);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Listener"),
      ),
      body: Column(
        children: [
          Visibility(
            visible: loading,
            child: const LinearProgressIndicator(
              minHeight: 10,
            )
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: itensDaLista,
              itemBuilder: (_,index) {

                //print("Aqui o index $index");

                return ListTile(
                  title: Text("Item: $index"),
                  leading: const CircleAvatar(),
                  subtitle: const Text("Alguma coisa aqui"),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}