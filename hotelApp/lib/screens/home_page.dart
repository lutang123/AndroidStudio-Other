import 'package:flutter/material.dart';

import '../hotels.dart';

class HomePage extends StatelessWidget {
  final bool darkMode = false;
  final List<Hotel> hotels = [
    Hotel(
        name: 'Califonia',
        price: 200,
        description: [
          'Wifi included',
          'Exclusive pool',
          'No smoking',
          'Free Food',
          'Free Drinks',
          'Amazing place to sleep',
          'Jacuzzi included',
          'Service room',
          'Big windows'
        ],
        rating: 4,
        image:
            'https://www.choicehotels.com/cms/images/choice-hotels/choice-privileges/img_cp-earn-points-worldwide-hotels/img_cp-earn-points-worldwide-hotels.jpg'),
    Hotel(
        name: 'Rodeo',
        price: 100,
        description: [
          'Wifi included',
          'Exclusive pool',
          'No smoking',
          'Free Food',
          'Free Drinks',
          'Amazing place to sleep',
          'Jacuzzi included',
          'Service room',
          'Big windows'
        ],
        rating: 3,
        image: 'https://media.nomadicmatt.com/hotelreview1a.jpg'),
    Hotel(
        name: 'Bulifa',
        price: 250,
        description: [
          'Wifi included',
          'Exclusive pool',
          'No smoking',
          'Free Food',
          'Free Drinks',
          'Amazing place to sleep',
          'Jacuzzi included',
          'Service room',
          'Big windows'
        ],
        rating: 3,
        image: 'https://i.ytimg.com/vi/09pDca1mITM/maxresdefault.jpg'),
    Hotel(
        name: 'Eagle Hotel',
        price: 500,
        description: [
          'Wifi included',
          'Exclusive pool',
          'No smoking',
          'Free Food',
          'Free Drinks',
          'Amazing place to sleep',
          'Jacuzzi included',
          'Service room',
          'Big windows'
        ],
        rating: 5,
        image:
            'https://qtxasset.com/styles/breakpoint_sm_default_480px_w/s3/hotelmanagement/1516117820/accor-smart-room.jpg'),
    Hotel(
      name: 'Potato',
      price: 50,
      rating: 2,
      image:
          'https://2486634c787a971a3554-d983ce57e4c84901daded0f67d5a004f.ssl.cf1.rackcdn.com/luxe-hotels/media/Luxe-Rodeo-Hotel-Rooms-Superior-King-5baebdcd0cb2e.jpg',
      description: [
        'Wifi included',
        'Exclusive pool',
        'No smoking',
        'Free Food',
        'Free Drinks',
        'Amazing place to sleep',
        'Jacuzzi included',
        'Service room',
        'Big windows'
      ],
    ),
    Hotel(
        name: 'Other',
        price: 220,
        description: [
          'Wifi included',
          'Exclusive pool',
          'No smoking',
          'Free Food',
          'Free Drinks',
          'Amazing place to sleep',
          'Jacuzzi included',
          'Service room',
          'Big windows'
        ],
        rating: 1,
        image:
            'https://specials-images.forbesimg.com/imageserve/5d83837d22254b0008e0d0e2/960x0.jpg'),
    Hotel(
        name: 'Hot-Dogs free hotel',
        price: 800,
        description: [
          'Wifi included',
          'Exclusive pool',
          'No smoking',
          'Free Food',
          'Free Drinks',
          'Amazing place to sleep',
          'Jacuzzi included',
          'Service room',
          'Big windows',
          'UNTILIMITED Hot-Dogs'
        ],
        rating: 5,
        image:
            'https://media.cntraveler.com/photos/58f0dd05cf8aa667ac42bc3b/master/pass/Bedroom-11Howard-NewYork-CRHotel.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      drawer: Drawer(
        child: Container(
          color: darkMode
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).accentColor,
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Hotel App'),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text(
                  'Hotels',
                  style: TextStyle(
                    color: darkMode
                        ? Theme.of(context).accentColor
                        : Theme.of(context).primaryColorDark,
                  ),
                ),
                leading: Icon(
                  Icons.hotel,
                  color: darkMode
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColorDark,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: darkMode
                        ? Theme.of(context).accentColor
                        : Theme.of(context).primaryColorDark,
                  ),
                ),
                leading: Icon(
                  Icons.settings,
                  color: darkMode
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColorDark,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/payment');
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: darkMode ? Theme.of(context).primaryColorDark : Colors.black26,
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: hotels.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/details_page', arguments: hotels[index]);
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GridTile(
                  footer: Container(
                    color: Colors.black87,
                    height: 40,
                    child: Center(
                      child: Text(
                        hotels[index].name,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                  child: Image.network(
                    hotels[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
