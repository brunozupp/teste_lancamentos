import 'package:contrast_checker/contrast_checker.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:teste_lancamentos/texto_colorido_background/text_colorful.dart';
import 'package:teste_lancamentos/texto_colorido_background/text_colorful2.dart';

class TextoColoridoBackground extends StatelessWidget {

  const TextoColoridoBackground({ Key? key }) : super(key: key);

  final texto = "dsad adsadsadsa dwerwqewq ddwqdwe wfsdfsdfsd fsdfsdfsd fwerwerwe wefwefsdf sdfsdfsdfsdf 2rwerwe sdfsdfdsdf sdfsdfsfsdfs";

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final double total = 170;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cores FDP'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Card(
              color: Colors.grey.shade800,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (context,constraints) {

                        double valorEqualizado = equalizar(
                          total: total, 
                          valor: 36
                        );

                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: LinearPercentIndicator(
                            animation: true,
                            barRadius: const Radius.circular(20),
                            animationDuration: 1000,
                            lineHeight: 30.0,
                            percent: valorEqualizado,
                            center: TextColorful2(
                              text: const Text("Em Andamento",),
                              gradient: LinearGradient(
                                stops: [
                                  valorEqualizado + 0.5,
                                  valorEqualizado + 0.5,
                                ],
                                colors: const [
                                  Colors.purple,
                                  Colors.blue
                                ],
                              ),
                            ),
                            progressColor: Colors.red,
                            backgroundColor: Colors.grey[200],
                          ),
                        );
                      }
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    LayoutBuilder(
                      builder: (context,constraints) {

                        double valorEqualizado = equalizar(
                          total: total, 
                          valor: 140
                        );

                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: LinearPercentIndicator(
                            animation: true,
                            barRadius: const Radius.circular(20),
                            animationDuration: 1000,
                            lineHeight: 30.0,
                            percent: valorEqualizado,
                            center: TextColorful2(
                              text: const Text("Em Andamento",),
                              gradient: LinearGradient(
                                stops: [
                                  valorEqualizado + 0.5,
                                  valorEqualizado + 0.5
                                ],
                                colors: const [
                                  Colors.purple,
                                  Colors.blue
                                ],
                              ),
                            ),
                            progressColor: Colors.red,
                            backgroundColor: Colors.grey[200],
                          ),
                        );
                      }
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    LayoutBuilder(
                      builder: (context,constraints) {

                        double valorEqualizado = equalizar(
                          total: total, 
                          valor: 90
                        );

                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: LinearPercentIndicator(
                            animation: true,
                            barRadius: const Radius.circular(20),
                            animationDuration: 1000,
                            lineHeight: 30.0,
                            percent: valorEqualizado,
                            center: TextColorful2(
                              text: const Text("Em Andamento",),
                              gradient: LinearGradient(
                                stops: [
                                  valorEqualizado + 0.5,
                                  valorEqualizado + 0.5,
                                ],
                                colors: const [
                                  Colors.purple,
                                  Colors.blue
                                ],
                              ),
                            ),
                            progressColor: Colors.red,
                            backgroundColor: Colors.grey[200],
                          ),
                        );
                      }
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    LayoutBuilder(
                      builder: (context,constraints) {

                        double valorEqualizado = equalizar(
                          total: total, 
                          valor: 90
                        ) - 0.1;

                        print("Valor equalizado $valorEqualizado");

                        var backgroundColor = Colors.red; // this color could be anything
                        var foregroundColor = backgroundColor.computeLuminance();

                        var cor = foregroundColor > 0.23 ? Colors.purple : Colors.blue;

                        print("cor $foregroundColor");


                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: LinearPercentIndicator(
                            animation: true,
                            barRadius: const Radius.circular(20),
                            animationDuration: 1000,
                            lineHeight: 30.0,
                            percent: valorEqualizado,
                            center: Text("Hello World", style: TextStyle(color: cor)),
                            // center: TextColorful2(
                            //   text: const Text("Em Andamento",),
                            //   gradient: LinearGradient(
                            //     stops: [
                            //       valorEqualizado,
                            //       valorEqualizado,
                            //     ],
                            //     colors: const [
                            //       Colors.purple,
                            //       Colors.blue
                            //     ],
                            //   ),
                            // ),
                            progressColor: Colors.red,
                            backgroundColor: Colors.grey[200],
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }

  double equalizar({
    required double total,
    required double valor,
  }) {
    return valor / total;
  }
}