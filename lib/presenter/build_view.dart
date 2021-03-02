import 'package:flutter/material.dart';
import 'package:flutter_app_bit/data/apiService.dart';
import 'package:flutter_app_bit/view/widgets/dialag_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buil_itemList.dart';

class BuildVieW extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildVieW({@required this.viewName, @required this.intNews});

  //Widget get buildItemList => null;

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().GetDio(optionUrl: intNews),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).articlesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildItemList(
                            snapshotData: (snapshot.data).articlesList[index],
                            onTapFav: (news) {
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, //para si o si ejecutar una acción
                                builder: (_) => new AlertDialog(
                                  content: Text(
                                    'Are you sure to add this news favorite list?',
                                    style: GoogleFonts.signika(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20),
                                  ),
                                  actions: [
                                    DialogButton(
                                      text: 'NO',
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    DialogButton(
                                      text: 'YES',
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container();
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }

    return Container();
  }
}
