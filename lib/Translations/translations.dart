import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello World',
      'counter': 'Counter value: ',
    },
    'es_ES': {
      'hello': 'Hola Mundo',
      'counter': 'Valor del contador: ',
    },
  };
}