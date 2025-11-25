Map<String, dynamic> seatData = <String,dynamic >{
  'data': <Map<String, Object>>[
    <String, Object>{
      'id': '1',
      'type': 'seatmap',
      'departure': <String, String>{
        'iataCode': 'NCE',
        'terminal': '2',
        'at': '2023-08-01T06:45:00'
      },
      'arrival': <String, String>{
        'iataCode': 'ORY',
        'terminal': '2',
        'at': '2023-08-01T08:15:00'
      },
      'carrierCode': 'AF',
      'number': '6201',
      'operating': <String, String>{'carrierCode': 'AF'},
      'aircraft': <String, String>{'code': '320'},
      'class': 'X',
      'flightOfferId': '1',
      'segmentId': '1',
      'decks': <Map<String, Object>>[
        <String, Object>{
          'deckType': 'MAIN',
          'deckConfiguration': <String, Object>{
            'width': 7,
            'length': 33,
            'startSeatRow': 1,
            'endSeatRow': 32,
            'startWingsRow': 13,
            'endWingsRow': 13,
            'exitRowsX': <int>[12, 13]
          },
          'facilities': <Map<String, Object>>[
            <String, Object>{
              'code': 'LA',
              'column': 'A',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 0}
            },
            <String, Object>{
              'code': 'G',
              'column': 'F',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 6}
            },
            <String, Object>{
              'code': 'G',
              'column': 'E',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 5}
            },
            <String, Object>{
              'code': 'G',
              'column': 'D',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 4}
            },
            <String, Object>{
              'code': 'CL',
              'column': 'A',
              'row': '1',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 1, 'y': 0}
            },
            <String, Object>{
              'code': 'CL',
              'column': 'B',
              'row': '1',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 1, 'y': 1}
            },
            <String, Object>{
              'code': 'SO',
              'column': 'E',
              'row': '32',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 31, 'y': 5}
            },
            <String, Object>{
              'code': 'SO',
              'column': 'F',
              'row': '32',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 31, 'y': 6}
            },
            <String, Object>{
              'code': 'LA',
              'column': 'A',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 0}
            },
            <String, Object>{
              'code': 'G',
              'column': 'F',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 6}
            },
            <String, Object>{
              'code': 'G',
              'column': 'E',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 5}
            },
            <String, Object>{
              'code': 'G',
              'column': 'D',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 4}
            }
          ],
          'seats': <Map<String, Object>>[
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '1D',
              'characteristicsCodes': <String>['1B', 'A', 'FC', 'K', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 1, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '1E',
              'characteristicsCodes': <String>['1B', '9', 'FC', 'K', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 1, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '1F',
              'characteristicsCodes': <String>['1B', 'FC', 'K', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 1, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2A',
              'characteristicsCodes': <String>['1B', 'FC', 'K', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2B',
              'characteristicsCodes': <String>['1B', '9', 'FC', 'K', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2C',
              'characteristicsCodes': <String>['1B', 'A', 'FC', 'K', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12A',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12B',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12C',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12D',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12E',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12F',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14A',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14B',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14C',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14D',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14E',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14F',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31B',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'DE',
                'RS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'DE',
                'RS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31F',
              'characteristicsCodes': <String>[
                'CH',
                'DE',
                'RS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '32A',
              'characteristicsCodes': <String>[
                '1D',
                'CH',
                'LS',
                'V',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 31, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '32B',
              'characteristicsCodes': <String>[
                '1D',
                'A',
                'CH',
                'LS',
                'V',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 31, 'y': 1}
            }
          ]
        }
      ],
      'aircraftCabinAmenities': <String, Object>{
        'power': <String, Object>{
          'isChargeable': false,
          'powerType': 'USB_PORT',
          'usbType': 'USB_C'
        },
        'seat': <String, Object>{
          'legSpace': 29,
          'spaceUnit': 'INCHES',
          'tilt': 'NORMAL',
          'medias': <Map<String, Object>>[
            <String, Object>{
              'title': 'Comfortable Seats',
              'href':
                  'https://pdt.content.amadeus.com/AncillaryServicesMedia/14223418_395.jpg',
              'description': <String, String>{
                'text':
                    'Settle in with comfortable seats and an ecoTHREAD blanket made from 100% recycled plastic bottles.',
                'lang': 'EN'
              },
              'mediaType': 'image'
            },
            <String, Object>{
              'title': 'Stay Connected',
              'href':
                  'https://pdt.content.amadeus.com/AncillaryServicesMedia/71344149_DFL.jpg',
              'description': <String, String>{
                'text':
                    'Stay connected next time you fly. Choose from our great value Wi-Fi plans.',
                'lang': 'EN'
              },
              'mediaType': 'image'
            },
            <String, Object>{
              'title': 'Be Curious',
              'href':
                  'https://pdt.content.amadeus.com/AncillaryServicesMedia/42266150_401.jpg',
              'description': <String, String>{
                'text':
                    "With special seat,meals, toys, and dedicated children's ice channels, we encourage curious minds and inspire tomorrow's explorers.",
                'lang': 'EN'
              },
              'mediaType': 'image'
            }
          ]
        },
        'wifi': <String, Object>{'isChargeable': true, 'wifiCoverage': 'FULL'},
        'entertainment': <Map<String, Object>>[
          <String, Object>{'isChargeable': false, 'entertainmentType': 'AUDIO_VIDEO_ON_DEMAND'},
          <String, Object>{'isChargeable': false, 'entertainmentType': 'IP_TV'}
        ],
        'food': <String, Object>{'isChargeable': false, 'foodType': 'SNACK'},
        'beverage': <String, Object>{
          'isChargeable': false,
          'beverageType': 'ALCOHOLIC_AND_NON_ALCOHOLIC'
        }
      },
      'availableSeatsCounters': <Map<String, Object>>[
        <String, Object>{'travelerId': '1', 'value': 116},
        <String, Object>{'travelerId': '2', 'value': 116}
      ]
    },
    <String, Object>{
      'id': '2',
      'type': 'seatmap',
      'departure': <String, String>{
        'iataCode': 'ORY',
        'terminal': '3',
        'at': '2023-08-18T06:35:00'
      },
      'arrival': <String, String>{
        'iataCode': 'NCE',
        'terminal': '2',
        'at': '2023-08-18T08:00:00'
      },
      'carrierCode': 'AF',
      'number': '6200',
      'operating': <String, String>{'carrierCode': 'AF'},
      'aircraft': <String, String>{'code': '320'},
      'class': 'X',
      'flightOfferId': '1',
      'segmentId': '4',
      'decks': <Map<String, Object>>[
        <String, Object>{
          'deckType': 'MAIN',
          'deckConfiguration': <String, Object>{
            'width': 7,
            'length': 33,
            'startSeatRow': 1,
            'endSeatRow': 32,
            'startWingsRow': 13,
            'endWingsRow': 13,
            'exitRowsX': <int>[12, 13]
          },
          'facilities': <Map<String, Object>>[
            <String, Object>{
              'code': 'LA',
              'column': 'A',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 0}
            },
            <String, Object>{
              'code': 'G',
              'column': 'F',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 6}
            },
            <String, Object>{
              'code': 'G',
              'column': 'E',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 5}
            },
            <String, Object>{
              'code': 'G',
              'column': 'D',
              'position': 'FRONT',
              'coordinates': <String, int>{'x': 0, 'y': 4}
            },
            <String, Object>{
              'code': 'CL',
              'column': 'A',
              'row': '1',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 1, 'y': 0}
            },
            <String, Object>{
              'code': 'CL',
              'column': 'B',
              'row': '1',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 1, 'y': 1}
            },
            <String, Object>{
              'code': 'SO',
              'column': 'E',
              'row': '32',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 31, 'y': 5}
            },
            <String, Object>{
              'code': 'SO',
              'column': 'F',
              'row': '32',
              'position': 'SEAT',
              'coordinates': <String, int>{'x': 31, 'y': 6}
            },
            <String, Object>{
              'code': 'LA',
              'column': 'A',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 0}
            },
            <String, Object>{
              'code': 'G',
              'column': 'F',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 6}
            },
            <String, Object>{
              'code': 'G',
              'column': 'E',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 5}
            },
            <String, Object>{
              'code': 'G',
              'column': 'D',
              'row': '32',
              'position': 'REAR',
              'coordinates': <String, int>{'x': 32, 'y': 4}
            }
          ],
          'seats': <Map<String, Object>>[
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '1D',
              'characteristicsCodes': <String>['1B', 'A', 'FC', 'K', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 1, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '1E',
              'characteristicsCodes': <String>['1B', '9', 'FC', 'K', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 1, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '1F',
              'characteristicsCodes': <String>['1B', 'FC', 'K', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 1, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2A',
              'characteristicsCodes': <String>['1B', 'FC', 'K', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2B',
              'characteristicsCodes': <String>['1B', '9', 'FC', 'K', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2C',
              'characteristicsCodes': <String>['1B', 'A', 'FC', 'K', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '2F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 2, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '3F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 3, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '4F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 4, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '5F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 5, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6A',
              'characteristicsCodes': <String>['FC', 'LS', 'O', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6B',
              'characteristicsCodes': <String>['9', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6C',
              'characteristicsCodes': <String>['A', 'FC', 'LS', 'O', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6D',
              'characteristicsCodes': <String>['A', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6E',
              'characteristicsCodes': <String>['9', 'FC', 'O', 'RS', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '6F',
              'characteristicsCodes': <String>['FC', 'O', 'RS', 'W', '1'],
              'travelerPricing': <Map<String, String>>[
                <String, String>{'travelerId': '1', 'seatAvailabilityStatus': 'BLOCKED'},
                <String, String>{'travelerId': '2', 'seatAvailabilityStatus': 'BLOCKED'}
              ],
              'coordinates': <String, int>{'x': 6, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '7F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 7, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '8F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 8, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '9F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 9, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10A',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'FC',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '10F',
              'characteristicsCodes': <String>[
                'CH',
                'FC',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 10, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '11F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 11, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12A',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12B',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12C',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12D',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12E',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '12F',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 12, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14A',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14B',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14C',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'LS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14D',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'A',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14E',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                '9',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '14F',
              'characteristicsCodes': <String>[
                '1A',
                '1B',
                'CH',
                'E',
                'IE',
                'L',
                'RS',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '15.00',
                    'base': '15.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 13, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '15F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 14, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '16F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 15, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '17F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 16, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '18F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 17, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '19F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 18, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '20F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 19, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '21F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 20, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '22F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 21, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23A',
              'characteristicsCodes': <String>[
                'C',
                'CH',
                'LS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23B',
              'characteristicsCodes': <String>[
                '9',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23C',
              'characteristicsCodes': <String>[
                'A',
                'C',
                'CH',
                'LS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '23F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 22, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '24F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 23, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '25F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 24, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '26F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 25, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27A',
              'characteristicsCodes': <String>[
                'CH',
                'LS',
                'U',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27B',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27C',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'LS',
                'U',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '27F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 26, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '28F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 27, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '29F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 28, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30B',
              'characteristicsCodes': <String>['9', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30C',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 2}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30D',
              'characteristicsCodes': <String>['A', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30E',
              'characteristicsCodes': <String>['9', 'CH', 'RS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '30F',
              'characteristicsCodes': <String>['CH', 'RS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 29, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31A',
              'characteristicsCodes': <String>['CH', 'LS', 'W', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31B',
              'characteristicsCodes': <String>['A', 'CH', 'LS', '1A_AQC_PREMIUM_SEAT'],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'AVAILABLE',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 1}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31D',
              'characteristicsCodes': <String>[
                'A',
                'CH',
                'DE',
                'RS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 4}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31E',
              'characteristicsCodes': <String>[
                '9',
                'CH',
                'DE',
                'RS',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 5}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '31F',
              'characteristicsCodes': <String>[
                'CH',
                'DE',
                'RS',
                'W',
                '1',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 30, 'y': 6}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '32A',
              'characteristicsCodes': <String>[
                '1D',
                'CH',
                'LS',
                'V',
                'W',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 31, 'y': 0}
            },
            <String, Object>{
              'cabin': 'ECONOMY',
              'number': '32B',
              'characteristicsCodes': <String>[
                '1D',
                'A',
                'CH',
                'LS',
                'V',
                '1A_AQC_PREMIUM_SEAT'
              ],
              'travelerPricing': <Map<String, Object>>[
                <String, Object>{
                  'travelerId': '1',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                },
                <String, Object>{
                  'travelerId': '2',
                  'seatAvailabilityStatus': 'BLOCKED',
                  'price': <String, Object>{
                    'currency': 'EUR',
                    'total': '11.00',
                    'base': '11.00',
                    'taxes': <Map<String, String>>[
                      <String, String>{'amount': '0.00', 'code': 'SUPPLIER'}
                    ]
                  }
                }
              ],
              'coordinates': <String, int>{'x': 31, 'y': 1}
            }
          ]
        }
      ],
      'aircraftCabinAmenities': <String, Object>{
        'power': <String, Object>{
          'isChargeable': false,
          'powerType': 'USB_PORT',
          'usbType': 'USB_C'
        },
        'seat': <String, Object>{
          'legSpace': 29,
          'spaceUnit': 'INCHES',
          'tilt': 'NORMAL',
          'medias': <Map<String, Object>>[
            <String, Object>{
              'title': 'Comfortable Seats',
              'href':
                  'https://pdt.content.amadeus.com/AncillaryServicesMedia/14223418_395.jpg',
              'description': <String, String>{
                'text':
                    'Settle in with comfortable seats and an ecoTHREAD blanket made from 100% recycled plastic bottles.',
                'lang': 'EN'
              },
              'mediaType': 'image'
            },
            <String, Object>{
              'title': 'Stay Connected',
              'href':
                  'https://pdt.content.amadeus.com/AncillaryServicesMedia/71344149_DFL.jpg',
              'description': <String, String>{
                'text':
                    'Stay connected next time you fly. Choose from our great value Wi-Fi plans.',
                'lang': 'EN'
              },
              'mediaType': 'image'
            },
            <String, Object>{
              'title': 'Be Curious',
              'href':
                  'https://pdt.content.amadeus.com/AncillaryServicesMedia/42266150_401.jpg',
              'description': <String, String>{
                'text':
                    "With special seat,meals, toys, and dedicated children's ice channels, we encourage curious minds and inspire tomorrow's explorers.",
                'lang': 'EN'
              },
              'mediaType': 'image'
            }
          ]
        },
        'wifi': <String, Object>{'isChargeable': true, 'wifiCoverage': 'FULL'},
        'entertainment': <Map<String, Object>>[
          <String, Object>{'isChargeable': false, 'entertainmentType': 'AUDIO_VIDEO_ON_DEMAND'},
          <String, Object>{'isChargeable': false, 'entertainmentType': 'IP_TV'}
        ],
        'food': <String, Object>{'isChargeable': false, 'foodType': 'SNACK'},
        'beverage': <String, Object>{
          'isChargeable': false,
          'beverageType': 'ALCOHOLIC_AND_NON_ALCOHOLIC'
        }
      },
      'availableSeatsCounters': <Map<String, Object>>[
        <String, Object>{'travelerId': '1', 'value': 116},
        <String, Object>{'travelerId': '2', 'value': 116}
      ]
    }
  ],
  'dictionaries': <String, Map<String, Object>>{
    'locations': <String, Map<String, String>>{
      'NCE': <String, String>{'cityCode': 'NCE', 'countryCode': 'FR'},
      'ORY': <String, String>{'cityCode': 'PAR', 'countryCode': 'FR'}
    },
    'facilities': <String, String>{
      'LA': 'Lavatory',
      'G': 'Galley',
      'CL': 'Closet',
      'SO': 'Storage Space'
    },
    'seatCharacteristics': <String, String>{
      '1': 'Restricted seat - General',
      '9': 'Center seat (not window, not aisle)',
      'A': 'Aisle seat',
      'RS': 'Right side of aircraft',
      'DE': 'Deportee',
      'C': 'Crew seat',
      'CH': 'Chargeable seats',
      'E': 'Exit row seat',
      'LS': 'Left side of aircraft',
      'K': 'Bulkhead seat',
      'L': 'Leg space seat',
      '1A_AQC_PREMIUM_SEAT': 'Premium seat',
      'O': 'Preferential seat',
      '1A': 'Seat not allowed for infant',
      '1B': 'Seat not allowed for medical',
      '1D': 'Restricted recline seat',
      'U': 'Seat suitable for unaccompanied minors',
      'V': 'Seat to be left vacant or offered last',
      'W': 'Window seat',
      'IE': 'Seat not suitable for child',
      'FC': 'Front of cabin class/compartment'
    }
  }
};
