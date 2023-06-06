import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textoController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    return TextFormField(
      controller: textoController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          hintText: 'Termina tu mensaje con "?"',
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              final textValue = textoController.value.text;
              textoController.clear();
              onValue(textValue);
            },
          )),
      onFieldSubmitted: (value) {
        textoController.clear();
        onValue(value);
        focusNode.requestFocus();
      },
    );
  }
}
