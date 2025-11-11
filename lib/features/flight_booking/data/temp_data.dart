Map<String, dynamic> bookedData = {
  "booking": {
    "id": 440,
    "booking_reference": "RBMHU8HGBDNL8YJ",
    "user_id": 1,
    "flight_offer_id": "1",
    "flight_data": {
      "id": "1",
      "type": "flight-offer",
      "price": {
        "base": "18840.00",
        "fees": [
          {"type": "SUPPLIER", "amount": "0.00"},
          {"type": "TICKETING", "amount": "0.00"},
          {"type": "FORM_OF_PAYMENT", "amount": "0.00"}
        ],
        "total": "23376.00",
        "currency": "INR",
        "grandTotal": "23376.00",
        "billingCurrency": "INR"
      },
      "source": "GDS",
      "itineraries": [
        {
          "segments": [
            {
              "id": "1",
              "number": "9454",
              "arrival": {
                "at": "2025-11-18T23:20:00",
                "iataCode": "BLR",
                "terminal": "2"
              },
              "aircraft": {"code": "321"},
              "duration": "PT1H5M",
              "departure": {
                "at": "2025-11-18T22:15:00",
                "iataCode": "COK",
                "terminal": "1"
              },
              "operating": {"carrierCode": "IX"},
              "carrierCode": "AI",
              "co2Emissions": [
                {"cabin": "ECONOMY", "weight": 39, "weightUnit": "KG"}
              ],
              "numberOfStops": 0
            }
          ]
        },
        {
          "segments": [
            {
              "id": "2",
              "number": "9451",
              "arrival": {
                "at": "2025-11-23T06:55:00",
                "iataCode": "COK",
                "terminal": "3"
              },
              "aircraft": {"code": "321"},
              "duration": "PT1H20M",
              "departure": {
                "at": "2025-11-23T05:35:00",
                "iataCode": "BLR",
                "terminal": "2"
              },
              "operating": {"carrierCode": "IX"},
              "carrierCode": "AI",
              "co2Emissions": [
                {"cabin": "ECONOMY", "weight": 39, "weightUnit": "KG"}
              ],
              "numberOfStops": 0
            }
          ]
        }
      ],
      "nonHomogeneous": false,
      "pricingOptions": {
        "fareType": ["PUBLISHED"],
        "includedCheckedBagsOnly": true
      },
      "travelerPricings": [
        {
          "price": {
            "base": "9420",
            "taxes": [
              {"code": "P2", "amount": "472.00"},
              {"code": "IN", "amount": "968.00"},
              {"code": "K3", "amount": "488.00"},
              {"code": "YR", "amount": "340.00"}
            ],
            "total": "11688",
            "currency": "INR",
            "refundableTaxes": "1933"
          },
          "fareOption": "STANDARD",
          "travelerId": "1",
          "travelerType": "ADULT",
          "fareDetailsBySegment": [
            {
              "cabin": "ECONOMY",
              "class": "T",
              "fareBasis": "TL1YXYII",
              "segmentId": "1",
              "brandedFare": "ECOVALU",
              "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
            },
            {
              "cabin": "ECONOMY",
              "class": "K",
              "fareBasis": "KL1YXYII",
              "segmentId": "2",
              "brandedFare": "ECOVALU",
              "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
            }
          ]
        },
        {
          "price": {
            "base": "9420",
            "taxes": [
              {"code": "P2", "amount": "472.00"},
              {"code": "IN", "amount": "968.00"},
              {"code": "K3", "amount": "488.00"},
              {"code": "YR", "amount": "340.00"}
            ],
            "total": "11688",
            "currency": "INR",
            "refundableTaxes": "1933"
          },
          "fareOption": "STANDARD",
          "travelerId": "2",
          "travelerType": "ADULT",
          "fareDetailsBySegment": [
            {
              "cabin": "ECONOMY",
              "class": "T",
              "fareBasis": "TL1YXYII",
              "segmentId": "1",
              "brandedFare": "ECOVALU",
              "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
            },
            {
              "cabin": "ECONOMY",
              "class": "K",
              "fareBasis": "KL1YXYII",
              "segmentId": "2",
              "brandedFare": "ECOVALU",
              "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
            }
          ]
        }
      ],
      "lastTicketingDate": "2025-11-11",
      "paymentCardRequired": false,
      "validatingAirlineCodes": ["AI"],
      "instantTicketingRequired": false
    },
    "traveller_details": {
      "adults": [
        {
          "open": true,
          "title": "Ms",
          "lastName": "Mahato",
          "firstName": "Jayanta",
          "dateOfBirth": "2015-10-19",
          "nationality": "India"
        },
        {
          "open": true,
          "title": "Ms",
          "lastName": "Mahato",
          "firstName": "Jayanta",
          "dateOfBirth": "2015-10-26",
          "nationality": "India"
        }
      ],
      "infants": [],
      "children": []
    },
    "billing_address": {
      "city": "Asansol",
      "state": "West Bengal",
      "country": "IN",
      "pinCode": "70009",
      "addressLine1": "Reiselab Headquarters, Asansol, West Bengal, 70009",
      "addressLine2": "Reiselab Headquarters, Asansol, West Bengal, 70009"
    },
    "contact_details": {
      "email": "superadmin@reiselab.com",
      "countryCode": "+91",
      "phoneNumber": "+1234567890"
    },
    "seat_selections": null,
    "meal_selections": null,
    "insurance_selections": null,
    "fare_details": {
      "taxes": 0,
      "markup": 23376,
      "baseFare": 23376,
      "discount": 0,
      "totalFare": 23376,
      "selectedFare": "selection",
      "showTotalFare": true,
      "taxesWithMarkup": 23376,
      "originalSubtotal": 23376
    },
    "total_amount": "23376.00",
    "currency": "INR",
    "booking_status": "confirmed",
    "payment_status": "paid",
    "booking_type": "flight",
    "expires_at": "2025-11-12T07:12:26.329Z",
    "confirmation_number": "CFMHU8HSYBFF6WF",
    "ticket_numbers": null,
    "pnr_number": null,
    "cancellation_policy": {
      "cancellation_fee": 0,
      "refund_percentage": 100,
      "free_cancellation_until": "2025-11-12T07:12:26.329Z"
    },
    "refund_policy": {
      "refundable": true,
      "processing_time": "3-5 business days",
      "refund_deadline": "2025-11-18T07:12:26.329Z"
    },
    "flight_order_id": null,
    "amadeus_order_data": null,
    "created_at": "2025-11-11T07:12:26.329Z",
    "updated_at": "2025-11-11T07:12:42.721Z"
  },
  "payment": {
    "id": 397,
    "booking_id": 440,
    "payment_reference": "PAYMHU8HGH8PBMNI",
    "razorpay_order_id": "order_ReLWb9k2uBNFok",
    "razorpay_payment_id": "pay_ReLWmnvBbv4ETi",
    "razorpay_signature":
        "96621e36187ed7c1acd0bdb4690cd02a0c0ecaf2b91b138ab13f4c2b7bad04df",
    "amount": "23376.00",
    "currency": "INR",
    "payment_method": null,
    "payment_gateway": "razorpay",
    "payment_status": "captured",
    "failure_reason": null,
    "gateway_response": {
      "id": "order_ReLWb9k2uBNFok",
      "notes": {"booking_id": "440", "booking_reference": "RBMHU8HGBDNL8YJ"},
      "amount": 2337600,
      "entity": "order",
      "status": "created",
      "receipt": "booking_440",
      "attempts": 0,
      "currency": "INR",
      "offer_id": null,
      "amount_due": 2337600,
      "created_at": 1762845146,
      "amount_paid": 0
    },
    "refund_amount": "0.00",
    "refund_status": "none",
    "refund_reference": null,
    "processed_at": "2025-11-11T07:12:42.713Z",
    "refunded_at": null,
    "created_at": "2025-11-11T07:12:26.541Z",
    "updated_at": "2025-11-11T07:12:42.713Z",
    "booking": {
      "id": 440,
      "booking_reference": "RBMHU8HGBDNL8YJ",
      "user_id": 1,
      "flight_offer_id": "1",
      "flight_data": {
        "id": "1",
        "type": "flight-offer",
        "price": {
          "base": "18840.00",
          "fees": [
            {"type": "SUPPLIER", "amount": "0.00"},
            {"type": "TICKETING", "amount": "0.00"},
            {"type": "FORM_OF_PAYMENT", "amount": "0.00"}
          ],
          "total": "23376.00",
          "currency": "INR",
          "grandTotal": "23376.00",
          "billingCurrency": "INR"
        },
        "source": "GDS",
        "itineraries": [
          {
            "segments": [
              {
                "id": "1",
                "number": "9454",
                "arrival": {
                  "at": "2025-11-18T23:20:00",
                  "iataCode": "BLR",
                  "terminal": "2"
                },
                "aircraft": {"code": "321"},
                "duration": "PT1H5M",
                "departure": {
                  "at": "2025-11-18T22:15:00",
                  "iataCode": "COK",
                  "terminal": "1"
                },
                "operating": {"carrierCode": "IX"},
                "carrierCode": "AI",
                "co2Emissions": [
                  {"cabin": "ECONOMY", "weight": 39, "weightUnit": "KG"}
                ],
                "numberOfStops": 0
              }
            ]
          },
          {
            "segments": [
              {
                "id": "2",
                "number": "9451",
                "arrival": {
                  "at": "2025-11-23T06:55:00",
                  "iataCode": "COK",
                  "terminal": "3"
                },
                "aircraft": {"code": "321"},
                "duration": "PT1H20M",
                "departure": {
                  "at": "2025-11-23T05:35:00",
                  "iataCode": "BLR",
                  "terminal": "2"
                },
                "operating": {"carrierCode": "IX"},
                "carrierCode": "AI",
                "co2Emissions": [
                  {"cabin": "ECONOMY", "weight": 39, "weightUnit": "KG"}
                ],
                "numberOfStops": 0
              }
            ]
          }
        ],
        "nonHomogeneous": false,
        "pricingOptions": {
          "fareType": ["PUBLISHED"],
          "includedCheckedBagsOnly": true
        },
        "travelerPricings": [
          {
            "price": {
              "base": "9420",
              "taxes": [
                {"code": "P2", "amount": "472.00"},
                {"code": "IN", "amount": "968.00"},
                {"code": "K3", "amount": "488.00"},
                {"code": "YR", "amount": "340.00"}
              ],
              "total": "11688",
              "currency": "INR",
              "refundableTaxes": "1933"
            },
            "fareOption": "STANDARD",
            "travelerId": "1",
            "travelerType": "ADULT",
            "fareDetailsBySegment": [
              {
                "cabin": "ECONOMY",
                "class": "T",
                "fareBasis": "TL1YXYII",
                "segmentId": "1",
                "brandedFare": "ECOVALU",
                "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
              },
              {
                "cabin": "ECONOMY",
                "class": "K",
                "fareBasis": "KL1YXYII",
                "segmentId": "2",
                "brandedFare": "ECOVALU",
                "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
              }
            ]
          },
          {
            "price": {
              "base": "9420",
              "taxes": [
                {"code": "P2", "amount": "472.00"},
                {"code": "IN", "amount": "968.00"},
                {"code": "K3", "amount": "488.00"},
                {"code": "YR", "amount": "340.00"}
              ],
              "total": "11688",
              "currency": "INR",
              "refundableTaxes": "1933"
            },
            "fareOption": "STANDARD",
            "travelerId": "2",
            "travelerType": "ADULT",
            "fareDetailsBySegment": [
              {
                "cabin": "ECONOMY",
                "class": "T",
                "fareBasis": "TL1YXYII",
                "segmentId": "1",
                "brandedFare": "ECOVALU",
                "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
              },
              {
                "cabin": "ECONOMY",
                "class": "K",
                "fareBasis": "KL1YXYII",
                "segmentId": "2",
                "brandedFare": "ECOVALU",
                "includedCheckedBags": {"weight": 15, "weightUnit": "KG"}
              }
            ]
          }
        ],
        "lastTicketingDate": "2025-11-11",
        "paymentCardRequired": false,
        "validatingAirlineCodes": ["AI"],
        "instantTicketingRequired": false
      },
      "traveller_details": {
        "adults": [
          {
            "open": true,
            "title": "Ms",
            "lastName": "Mahato",
            "firstName": "Jayanta",
            "dateOfBirth": "2015-10-19",
            "nationality": "India"
          },
          {
            "open": true,
            "title": "Ms",
            "lastName": "Mahato",
            "firstName": "Jayanta",
            "dateOfBirth": "2015-10-26",
            "nationality": "India"
          }
        ],
        "infants": [],
        "children": []
      },
      "billing_address": {
        "city": "Asansol",
        "state": "West Bengal",
        "country": "IN",
        "pinCode": "70009",
        "addressLine1": "Reiselab Headquarters, Asansol, West Bengal, 70009",
        "addressLine2": "Reiselab Headquarters, Asansol, West Bengal, 70009"
      },
      "contact_details": {
        "email": "superadmin@reiselab.com",
        "countryCode": "+91",
        "phoneNumber": "+1234567890"
      },
      "seat_selections": null,
      "meal_selections": null,
      "insurance_selections": null,
      "fare_details": {
        "taxes": 0,
        "markup": 23376,
        "baseFare": 23376,
        "discount": 0,
        "totalFare": 23376,
        "selectedFare": "selection",
        "showTotalFare": true,
        "taxesWithMarkup": 23376,
        "originalSubtotal": 23376
      },
      "total_amount": "23376.00",
      "currency": "INR",
      "booking_status": "pending",
      "payment_status": "pending",
      "booking_type": "flight",
      "expires_at": "2025-11-12T07:12:26.329Z",
      "confirmation_number": null,
      "ticket_numbers": null,
      "pnr_number": null,
      "cancellation_policy": {
        "cancellation_fee": 0,
        "refund_percentage": 100,
        "free_cancellation_until": "2025-11-12T07:12:26.329Z"
      },
      "refund_policy": {
        "refundable": true,
        "processing_time": "3-5 business days",
        "refund_deadline": "2025-11-18T07:12:26.329Z"
      },
      "flight_order_id": null,
      "amadeus_order_data": null,
      "created_at": "2025-11-11T07:12:26.329Z",
      "updated_at": "2025-11-11T07:12:26.329Z"
    }
  }
};
