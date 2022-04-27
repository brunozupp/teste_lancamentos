import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_lancamentos/perfil/models/metric_model.dart';
import 'package:teste_lancamentos/perfil/widgets/item_metric_widget.dart';

class MetricsWidget extends StatefulWidget {
  const MetricsWidget({ Key? key }) : super(key: key);

  @override
  State<MetricsWidget> createState() => _MetricsWidgetState();
}

class _MetricsWidgetState extends State<MetricsWidget> {

  final metrics = <MetricModel>[];

  static const String METRICAS_KEY = "metricas";

  @override
  void initState() {
    super.initState();

    _obterMetricas().then((value) {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ReorderableListView(
        shrinkWrap: true,
        onReorder: _onReorder,
        children: metrics.map((e) => Padding(
          key: ValueKey(e),
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ItemMetricWidget(
            metric: e,
            onTap: _onTap,
          ),
        ),).toList(),
      ),
    );
  }

  Future deletar() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(METRICAS_KEY);
  }

  void _inicializarMetricas() {
    metrics.addAll([
      MetricModel(
        name: "Backlog",
        alias: "Backlog", 
        color: Colors.grey, 
        index: 0, 
        show: true,
      ),
      MetricModel(
        name: "Em Desenvolvimento", 
        alias: "EmDesenvolvimento",
        color: Colors.green, 
        index: 1, 
        show: true,
      ),
      MetricModel(
        name: "Desenvolvimento Concluido",
        alias: "DesenvolvimentoConcluido",
        color: Colors.blue, 
        index: 2, 
        show: false,
      ),
      MetricModel(
        name: "Em Homologação", 
        alias: "EmHomologacao",
        color: Colors.purple, 
        index: 3, 
        show: false,
      ),
      MetricModel(
        name: "Homologado", 
        alias: "Homologado",
        color: Colors.red, 
        index: 4, 
        show: true,
      ),
      MetricModel(
        name: "Concluido", 
        alias: "Concluido",
        color: Colors.orange, 
        index: 5, 
        show: true,
      ),
    ]);
  }

  Future<void> _salvarMetricas() async {
    final prefs = await SharedPreferences.getInstance();

    final metricasJson = metrics.map((e) => e.toJson()).toList();

    await prefs.setStringList(METRICAS_KEY, metricasJson);
  }

  Future<void> _obterMetricas() async {
    final prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey(METRICAS_KEY)) {
      final metricasJson = prefs.getStringList(METRICAS_KEY)!;

      metrics.addAll(metricasJson.map((e) => MetricModel.fromJson(e)));
    } else {
      _inicializarMetricas();
      await _salvarMetricas();
    }
  }

  Future<void> _onTap(MetricModel metrica) async {
    
    final index = metrics.indexOf(metrica);

    if(index == -1) {
      return;
    }

    final metricasSelecionadas = metrics.where((e) => e.show);

    if(metricasSelecionadas.length == 4 && metricasSelecionadas.contains(metrica)) {
      return;
    }

    var metricaTapped = metrics.removeAt(index);

    metricaTapped = metricaTapped.copyWith(
      show: !metricaTapped.show,
    );

    metrics.insert(index, metricaTapped);

    await _salvarMetricas();

    setState(() { });
  }

  Future<void> _onReorder(int oldIndex, int newIndex) async {

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    print("oldIndex = $oldIndex");
    print("newIndex = $newIndex\n");

    // Item que estou movendo
    final item = metrics.removeAt(oldIndex);

    metrics.insert(newIndex, item);

    setState(() { });

    for (var i = 0; i < metrics.length; i++) {
      metrics[i] = metrics[i].copyWith(
        index: i,
      );
    }

    await _salvarMetricas();
  }
}