import 'package:flutter/material.dart';
import 'package:food/features/profile/presentation/views/widgets/add_new_address_body_widget.dart';
import 'package:food/features/profile/presentation/views/widgets/location_widget.dart';

class AddNewAddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [LocationWidget(), AddNewAddressBodyWidget()]),
      ),
    );
  }
}
