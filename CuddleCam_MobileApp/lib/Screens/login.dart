import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String enteredPin = '';
  String correctPin = '1234';

  void _onPinEntered(String pin) {
    _clearPin();

    setState(() {
      enteredPin = pin;
    });

    if (enteredPin.length == 4) {
      if (enteredPin == correctPin) {
        Navigator.pushReplacementNamed(context, '/notifications');
      } else {
        _showSnackBar('Invalid PIN');
        
      }
    }
  }

  void _clearPin() {
    setState(() {
      enteredPin = '';
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          const Text(
            'Enter your PIN',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: PinCodeInput(
              onPinEntered: _onPinEntered,
              pinLength: 4,
              borderColor: Colors.grey,
              filledColor: const Color.fromARGB(255, 133, 131, 131),
              textColor: Colors.black,
              enteredPinLength: enteredPin.length,
            ),
          ),
          const SizedBox(height: 20),
          NumberPad(
            onNumberPressed: (number) {
              if (enteredPin.length < 4) {
                setState(() {
                  enteredPin += number;
                });
              }
            },
            onClearPressed: _clearPin, onFingerprintPressed: () {  },
          ),
        ],
      ),
    );
  }
}

class PinCodeInput extends StatelessWidget {
  final ValueChanged<String> onPinEntered;
  final int pinLength;
  final Color borderColor;
  final Color filledColor;
  final Color textColor;
  final int enteredPinLength;

  const PinCodeInput({
    Key? key,
    required this.onPinEntered,
    this.pinLength = 4,
    this.borderColor = Colors.grey,
    this.filledColor = Colors.grey,
    this.textColor = Colors.black,
    required this.enteredPinLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pinLength, (index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              color: filledColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                index < enteredPinLength ? '*' : '',
                style: TextStyle(fontSize: 16, color: textColor),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class NumberPad extends StatelessWidget {
  final ValueChanged<String> onNumberPressed;
  final VoidCallback onClearPressed;
  final VoidCallback onFingerprintPressed;
  final double buttonSpacing;

  const NumberPad({
    Key? key,
    required this.onNumberPressed,
    required this.onClearPressed,
    required this.onFingerprintPressed,
    this.buttonSpacing = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(number: '7', onPressed: onNumberPressed),
                SizedBox(width: buttonSpacing),
                NumberButton(number: '8', onPressed: onNumberPressed),
                SizedBox(width: buttonSpacing),
                NumberButton(number: '9', onPressed: onNumberPressed),
              ],
            ),
            SizedBox(height: buttonSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(number: '4', onPressed: onNumberPressed),
                SizedBox(width: buttonSpacing),
                NumberButton(number: '5', onPressed: onNumberPressed),
                SizedBox(width: buttonSpacing),
                NumberButton(number: '6', onPressed: onNumberPressed),
              ],
            ),
            SizedBox(height: buttonSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(number: '1', onPressed: onNumberPressed),
                SizedBox(width: buttonSpacing),
                NumberButton(number: '2', onPressed: onNumberPressed),
                SizedBox(width: buttonSpacing),
                NumberButton(number: '3', onPressed: onNumberPressed),
              ],
            ),
            SizedBox(height: buttonSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible( // Wrap the expanded container with Flexible
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.fingerprint),
                      onPressed: onFingerprintPressed,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: buttonSpacing),
                Flexible( // Wrap the expanded container with Flexible
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: TextButton(
                      onPressed: () => onNumberPressed('0'),
                      child: const Text(
                        '0',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: buttonSpacing),
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.backspace),
                    onPressed: onClearPressed,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final ValueChanged<String> onPressed;

  const NumberButton({
    Key? key,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(number),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.6,
            heightFactor: 0.6,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                number,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}