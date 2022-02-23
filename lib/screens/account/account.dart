import 'package:flutter/material.dart';

import 'account_app_bar.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: AccountAppBar(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                // height: 200,
                // color: Colors.teal,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/id_photo.jpg'))),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Salut, ... ',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //     fontFamily: 'SourceSansPro',
                  //     color: Colors.grey[700]
                  //   ),
                  //   ),
                  Text(
                    'Alain',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'SourceSansPro',
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),
                    ),

                ],
              ),
               Text(
                    'alain@n.n',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic
                      // fontWeight: FontWeight.w600
                    ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
