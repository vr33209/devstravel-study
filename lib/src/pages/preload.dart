import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
  const PreloadPage({Key? key}) : super(key: key);

  @override
  State<PreloadPage> createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading:
      true;
    });

    bool request =
        await Provider.of<AppData>(context, listen: false).requestData();
    if (request) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading:
        false;
      });
    }
  }

  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/devstravel_logo.png',
              width: 200,
            ),
            loading
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(30),
                        child: const Text(
                          'Carregando informações...',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation(Colors.green),
                      ),
                    ],
                  )
                : Container(
                    margin: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      child: const Text(
                        'Tentar novamente',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: requestInfo,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
