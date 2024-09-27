import 'dart:developer';

import 'package:flightes/core/params/address_param.dart';
import 'package:flightes/core/params/contact_param.dart';
import 'package:flightes/feature/auth/presentation/widgets/EmailFormField.dart';
import 'package:flightes/feature/auth/presentation/widgets/PhoneFormField.dart';
import 'package:flightes/feature/user/presentation/widgets/address/address_building_field.dart';
import 'package:flightes/feature/user/presentation/widgets/address/country_code_mobile_form.dart';
import 'package:flutter/cupertino.dart';

import 'address_area_field.dart';
import 'address_landmark_field.dart';
import 'address_street_field.dart';

class AddressForm extends StatefulWidget {
  final GlobalKey<FormState> formState;
  final ContactParam param;
  final ValueChanged<ContactParam> onChanged;
  final ValueChanged<Phones> onChangedPhone;
  final double width;
  final double height;

  const AddressForm(
      {super.key,
      required this.formState,
      required this.param,
      required this.onChanged,
      required this.width,
      required this.height,
      required this.onChangedPhone});
  @override
  State<StatefulWidget> createState() {
    return _AddressForm();
  }
}

class _AddressForm extends State<AddressForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formState,
        child: SingleChildScrollView(child:  Column(
          children: [
            SizedBox(
              height: widget.height ,
            ),
            SizedBox(
              width: widget.width / 1.2,
              child: AddressAreaField(
                onChanged: (value) => widget
                    .onChanged(widget.param.copyWith(addressFirstName: value)),
                currentValue: widget.param.addressFirstName,
                hintText: "First Name",
                validator: widget.param.emptyValidator,
              ),
            ),
            SizedBox(
              height: widget.height ,
            ),
            SizedBox(
              width: widget.width / 1.2,
              child: AddressStreetField(
                onChanged: (value) => widget
                    .onChanged(widget.param.copyWith(addressLastName: value)),
                currentValue: widget.param.addressLastName,
                hintText: "Last Name",
                validator: widget.param.emptyValidator,
              ),
            ),
            SizedBox(
              height: widget.height ,
            ),
            SizedBox(
              width: widget.width / 1.2,
              child: AddressBuildingField(
                onChanged: (value) =>
                    widget.onChanged(widget.param.copyWith(companyName: value)),
                currentValue: widget.param.companyName,
                hintText: "Company Name",
                validator: widget.param.emptyValidator,
              ),
            ),
            SizedBox(
              height: widget.height ,
            ),
            SizedBox(
              width: widget.width / 1.2,
              child: AddressLandMarkField(
                onChanged: (value) =>
                    widget.onChanged(widget.param.copyWith(purpose: value)),
                currentValue: widget.param.purpose,
                hintText: "purpose",
                validator: widget.param.emptyValidator,
              ),
            ),
            SizedBox(
              height: widget.height ,
            ),
            SizedBox(
              width: widget.width / 1.2,
              child: AddressAreaField(
                onChanged: (value) => widget
                    .onChanged(widget.param.copyWith(addressLines: value)),
                currentValue: widget.param.addressLines,
                hintText: "Address Lines",
                validator: widget.param.emptyValidator,
              ),
            ),
            SizedBox(
              height: widget.height ,
            ),
            SizedBox(
              width: widget.width / 1.2,
              child: EmailFormField(
                onChanged: (value) => widget
                    .onChanged(widget.param.copyWith(emailAddress: value)),
                currentValue: widget.param.emailAddress,
                hintText: "email address",
                validator: widget.param.emptyValidator,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryCodeMobileForm(
                  height: widget.height*40,
                  listWidth: widget.width,
                  listHeight: widget.height*40,
                  onDocumentChanged: (value) {
                    widget.param.phones.countryCallingCode = value;
                    setState(() {
                      log("mobile code: ${ widget.param.phones.countryCallingCode}");
                    });
                  },
                ),
                SizedBox(width: widget.width/1.6,
                child: PhoneFormField(
                    onChanged: (value) => widget.onChangedPhone(
                        widget.param.phones.copyWith(number: value)),
                    currentValue: widget.param.phones.number,
                    hintText: "phone",
                validator: widget.param.emptyValidator,), ),

              ],
            ),
          ],
        )));
  }
}
