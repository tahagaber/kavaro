import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputs extends StatefulWidget {
  const OtpInputs({super.key});

  @override
  State<OtpInputs> createState() => _OtpInputsState();
}

class _OtpInputsState extends State<OtpInputs> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xFF05050A).withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF3b1a50), width: 1.5),
          ),
          child: Center(
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: "-",
                hintStyle: TextStyle(color: Color(0xFF3b1a50), fontSize: 24),
              ),
              onChanged: (value) => _onChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}
