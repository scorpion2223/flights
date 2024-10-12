import 'package:flightes/core/params/remarks_param.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/params/ticketing_agreement_param.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../public/feature/contacts/domain/entities/contacts_entity.dart';
import '../public/feature/travelers/domain/entities/travelers_entity.dart';

class CustomBookingParam {

  final SearchParam paramSearch;
  final RemarksParam paramRemarks;
  final TicketingAgreementParam paramTicketingAgreementParam;
  final TravelersEntity entityTravelers;
final ContactsEntity entityContacts;
  CustomBookingParam(
      {
      required this.paramSearch,
      required this.paramRemarks,
      required this.paramTicketingAgreementParam,
      required this.entityTravelers,
      required this.entityContacts
      });
  Map<String, dynamic> toJson() {
    return {
      "data": {
        "type": "flight-order",
        "originLocationCode": paramSearch.originLocationCode,
        "destinationLocationCode": paramSearch.destinationLocationCode,
        "departureDate":  DateFormat('yyyy-MM-dd').format(paramSearch.departureDate!).toString(),
        "returnDate":  DateFormat('yyyy-MM-dd').format(paramSearch.returnDate!).toString(),
        "adults": paramSearch.adults,
        "max": paramSearch.max,
        "remarks": {
          "general": [
            {
              "subType": "GENERAL_MISCELLANEOUS",
              "text": "ONLINE BOOKING FROM INCREIBLE VIAJES"
            }
          ]
        },
        "ticketingAgreement": {
          "option": "DELAY_TO_CANCEL",
          "delay": "6D"
        },
        "travelers":[
          {
            "id": entityTravelers.travelers!.id,
            "dateOfBirth": entityTravelers.travelers!.dateOfBirth == null?null:"${entityTravelers.travelers!.dateOfBirth!.year.toString().padLeft(4, '0')}-${entityTravelers.travelers!.dateOfBirth!.month.toString().padLeft(2, '0')}-${entityTravelers.travelers!.dateOfBirth!.day.toString().padLeft(2, '0')}",
            "name": entityTravelers.travelers!.name?.toJson(),
            "gender": entityTravelers.travelers!.gender,
            "contact": entityTravelers.travelers!.contact?.toJson(),
            "documents": entityTravelers.travelers!.documents == null ? [] : List<dynamic>.from(entityTravelers.travelers!.documents!.map((x) => x.toJson())),

          }
        ],
        "contacts": entityContacts.contacts == null ? [] : List<dynamic>.from(entityContacts.contacts!.map((x) => x.toJson()))
        // paramSearch.toJson(),
        // paramRemarks.tojson(),
        // paramTicketingAgreementParam.toJson(),
        // entityTravelers.toJson(),
        // entityContacts.toJson()
      }
    };
  }

  Map<String,dynamic> toJsonWithConstants()
  {
    return {
      "data": {
        "type": "flight-order",
        "user_id":userID,
        "originLocationCode": paramSearch.originLocationCode,
        "destinationLocationCode": paramSearch.destinationLocationCode,
        "departureDate":  DateFormat('yyyy-MM-dd').format(paramSearch.departureDate!).toString(),
        "returnDate":  DateFormat('yyyy-MM-dd').format(paramSearch.returnDate!).toString(),
        "adults": paramSearch.adults,
        "max": paramSearch.max,
        "travelers": [
          {
            "id": "1",
            "dateOfBirth": "1982-01-16",
            "name": {
              "firstName": "JORGE",
              "lastName": "GONZALES"
            },
            "gender": "MALE",
            "contact": {
              "emailAddress": "jorge.gonzales833@telefonica.es",
              "phones": [
                {
                  "deviceType": "MOBILE",
                  "countryCallingCode": "34",
                  "number": "480080076"
                }
              ]
            },
            "documents": [
              {
                "documentType": "PASSPORT",
                "birthPlace": "Madrid",
                "issuanceLocation": "Madrid",
                "issuanceDate": "2015-04-14",
                "number": "00000000",
                "expiryDate": "2025-04-14",
                "issuanceCountry": "ES",
                "validityCountry": "ES",
                "nationality": "ES",
                "holder": true
              }
            ]
          },
          {
            "id": "2",
            "dateOfBirth": "2012-10-11",
            "gender": "FEMALE",
            "contact": {
              "emailAddress": "jorge.gonzales833@telefonica.es",
              "phones": [
                {
                  "deviceType": "MOBILE",
                  "countryCallingCode": "34",
                  "number": "480080076"
                }
              ]
            },
            "name": {
              "firstName": "ADRIANA",
              "lastName": "GONZALES"
            }
          }
        ],
        "remarks": {
          "general": [
            {
              "subType": "GENERAL_MISCELLANEOUS",
              "text": "ONLINE BOOKING FROM INCREIBLE VIAJES"
            }
          ]
        },
        "ticketingAgreement": {
          "option": "DELAY_TO_CANCEL",
          "delay": "6D"
        },
        "contacts": [
          {
            "addresseeName": {
              "firstName": "PABLO",
              "lastName": "RODRIGUEZ"
            },
            "companyName": "INCREIBLE VIAJES",
            "purpose": "STANDARD",
            "phones": [
              {
                "deviceType": "LANDLINE",
                "countryCallingCode": "34",
                "number": "480080071"
              },
              {
                "deviceType": "MOBILE",
                "countryCallingCode": "33",
                "number": "480080072"
              }
            ],
            "emailAddress": "support@increibleviajes.es",
            "address": {
              "lines": [
                "Calle Prado, 16"
              ],
              "postalCode": "28014",
              "cityName": "Madrid",
              "countryCode": "ES"
            }
          }
        ]
      }
    };
  }
}
