import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  
  final String text;
  final Color borderColor;

  const CardItem({
    super.key,
    required this.text,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 30,
        right: 10,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(
                left: 6,
                top: 2,
                bottom: 2,
                right: 2,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "00000001",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Assunto: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              TextSpan(
                                text: "Título da requisição $text",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Solicitado por: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              TextSpan(
                                text: "Bruno Aparecido Zupp Noveli",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Categoria: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              TextSpan(
                                text: "Martech",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Abertura: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: borderColor,
                                ),
                              ),
                              TextSpan(
                                text: "23/10/2022 14:26",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: borderColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        
          Positioned(
            left: -20,
            top: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE5E5E5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                        color: Colors.black.withOpacity(0.25),
                      ),
                      //BoxShadow(),
                    ]
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD52CFF),
                        Color(0xFF0B4C81),
                      ]
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "BN",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFE5EBFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
