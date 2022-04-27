import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:teste_lancamentos/perfil/models/metric_model.dart';

class ItemMetricWidget extends StatelessWidget {

  final MetricModel metric;
  final Future<void> Function (MetricModel metrica) onTap;

  const ItemMetricWidget({
    Key? key,
    required this.metric,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.list,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: metric.color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              metric.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FlutterSwitch(
            width: 90.0,
            height: 40.0,
            valueFontSize: 25.0,
            toggleSize: 30.0,
            value: metric.show,
            borderRadius: 30.0,
            padding: 5.0,
            showOnOff: false,
            onToggle: (val) {
              onTap(metric);
            },
          ),
        ],
      ),
    );
  }
}
