import 'package:unittest/unittest.dart';
import 'package:query_string/query_string.dart';

void main() {

  test('decoding', () {
    var q = '?page=main&action=front&sid=h985jg9034gj498g859gh495&enc=+Hello%20&empty';
    var r = QueryString.parse(q);

    expect(r['page'], 'main');
    expect(r['action'], 'front');
    expect(r['sid'], 'h985jg9034gj498g859gh495');
    expect(r['enc'], ' Hello ');
    expect(r['empty'], '');
  });

  test('encoding only one argument', () {
    var data = {'another': ['str1', 'str2']};
    var result = QueryString.encode(data);
    expect(result, 'another=%5Bstr1%2C%20str2%5D');
  });

  test('encoding several arguments', () {
    var data = {'parameter': 2, 'another': 'String with spaces'};
    var result = QueryString.encode(data);
    expect(result, 'parameter=2&another=String%20with%20spaces');
  });
}
