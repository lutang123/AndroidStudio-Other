const functions = require('firebase-functions');

exports.squarePayments = functions.https.onRequest(async (req, res)=>{
    const jsonBody = req.body;
    const requestBody = JSON.parse(jsonBody);

    var options = {
        method: 'POST',
        url: 'https://connect.squareupsandbox.com/v2/payments', //this is the sandbox version (testing), => Remove the "sandbox" for production
        headers:{
            Accept: 'application/json',
            'content-type': 'application/json',
            Authorization: 'Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' //Replace with your access token
        },
        body:{
            idempotency_key: Date(), //unique id when customer make payment
            autocomplete: true,
            amount_money: { amount: requestBody.price, currency: 'CAD'},
            source_id: requestBody.nonce,
            customer_id: '',
            delay_capture: false,
        },
        json: true,
    };
    const request = require('request');
    request(options, function (error, response, body){
        if(!error && res.statusCode === 200){
            return res.status(200).json(body)
        }else{
            return res.json({'error':'There is a problem with the payment'});
        }
    });
})