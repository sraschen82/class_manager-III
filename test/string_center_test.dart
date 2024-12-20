import 'package:class_manager/app/ui/extentions/string_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test(
    'Centralizar String',
    () {
      String str = '322\nMAT';
      print(str);
      print(str.centralized(0));

      expect(str.centralized(10).isNotEmpty, true);
    },
  );

  // test(
  //   'A lista deve ser maior que 10',
  //   () async {
  //     ApiCompany service = BrapiCompanyService();
  //     List<String> symbols = [];
  //     await service.availableCompanies(symbol: '').then(
  //           (value) => symbols.addAll(value.symbolsList),
  //         );

  //     expect(symbols.length > 10, true);
  //   },
  // );
}
