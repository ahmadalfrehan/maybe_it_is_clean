import 'package:flutter/material.dart';

import '../../data/Models/userModel.dart';
import '../Home/appBar.dart';

class Details extends StatelessWidget {
  final UserModel users;

  const Details({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFf8f8f6),
        appBar: AppBarForMyApp.appBarForMyApp(context, textAppBar: 'معلومات الموظف'),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: size.width >= 500
                      ? EdgeInsets.only(
                          top: (size.width * 0.15) - 1,
                          left: (size.width * 0.4) - 10)
                      : EdgeInsets.only(
                          top: (size.width * 0.09) - 1,
                          left: (size.width * 0.04) - 10),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        child: Text(
                          'صورة الموظف',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.mode_edit_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 5, top: 4),
                  child: Row(
                    children: [
                      Text(
                        'المعلومات الشخصية',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    textFieldAndHisName(
                        context, 'الاسم', users.name.toString(), false),
                    textFieldAndHisName(context, 'اسم المستخدم',
                        users.username.toString(), false),
                  ],
                ),
                Row(
                  children: [
                    textFieldAndHisName(context, 'اسم الشركة',
                        users.company!.name.toString(), false),
                    textFieldAndHisName(
                        context, 'bs', users.company!.bs.toString(), false),
                  ],
                ),
                textFieldAndHisName(context, 'catchPhrase',
                    users.company!.catchPhrase.toString(), true),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 5, top: 4),
                  child: Row(
                    children: [
                      Text(
                        'معلومات التواصل',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                textFieldAndHisName(
                    context, 'رقم الموبايل', users.phone.toString(), true),
                textFieldAndHisName(
                    context, 'الايميل', users.email.toString(), true),
                textFieldAndHisName(
                    context, 'موقع الويب', users.website.toString(), true),
                textFieldAndHisName(
                    context,
                    'العنوان',
                    '${users.address!.street}\\${users.address!.suite}\\${users.address!.street}',
                    true),
                textFieldAndHisName(context, 'zipCode',
                    users.address!.zipcode.toString(), true),
                textFieldAndHisName(
                    context,
                    'geo',
                    '${users.address!.geo!['lat']} , ${users.address!.geo!['lng']}',
                    true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {},
                        child: Text(
                          'حفظ',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldAndHisName(
      BuildContext context, String name, String text, bool isExpanded) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3, right: 5),
              child: Text(
                name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(8),
                width: isExpanded ? size.width / 1.1 : size.width / 2.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(text)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
