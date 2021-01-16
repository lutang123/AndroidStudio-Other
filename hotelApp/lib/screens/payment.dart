import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

class Payment extends StatelessWidget {
  _payment(priceValue) async {
    await InAppPayments.setSquareApplicationId(
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'); //replace with your application ID
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails result) {
          backend(result, priceValue);
          try {
            InAppPayments.completeCardEntry(onCardEntryComplete: () => {});
          } catch (ex) {
            InAppPayments.showCardNonceProcessingError(ex.message);
          }
        },
        onCardEntryCancel: () {});
  }

  Future<void> backend(CardDetails result, price) async {
    var chargeURL =
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; //replace with your firebase function
    var body = json.encode({'nonce': result.nonce, 'price': price});
    http.Response response;
    try {
      response = await http.post(
        chargeURL,
        body: body,
        headers: {
          "content-type": 'text/plain',
        },
      );
    } catch (error) {
      print(error.toString());
    }
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      print('Success');
      print(responseBody.toString());
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    int price = 1;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('In App Payment'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  price.toString(),
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                RaisedButton(
                  onPressed: () => _payment(price),
                  child: Text('Pay this $price cent'),
                )
              ],
            ),
          ),
        ));
  }
}
