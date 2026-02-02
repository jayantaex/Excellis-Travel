import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/app_search_dropdown.dart';
import '../../../../../utils/app_date_picker.dart' show showAppDatePicker;
import '../../../../../utils/app_helpers.dart';
import '../../../../../utils/app_toast.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/primary_input.dart';
import '../../../../../utils/title_case.dart';
import '../../../bloc/travleler_bloc/traveller_bloc.dart';
import '../../../data/models/flight_offer_price_model.dart';
import '../../../data/models/passenger_model.dart';
import '../../../data/models/traveller_data_model.dart';
import '../flight_search/app_drop_down.dart';

Future<void> showAddAndEditPassengerSheet(
    {required BuildContext context,
    required String travellerType,
    required Function(PassengerModel passenger) onDone,
    PassengerModel? passenger,
    List<FareDetailsBySegment>? filteredSegemnts}) async {
  // Capture the existing FlightBloc once to ensure it is available inside the sheet
  final TravellerBloc travellerBloc = context.read<TravellerBloc>();
  final List<String> titleItems = ['Mr', 'Mrs', 'Ms'];
  String? selectedTitle = 'Mr';
  String? selectedCountryCode = 'IN';
  final TextEditingController firstNameController =
      TextEditingController(text: passenger?.firstName);
  final TextEditingController lastNameController =
      TextEditingController(text: passenger?.lastName);
  final TextEditingController dobController = TextEditingController(
    text: passenger?.dateOfBirth != null
        ? AppHelpers.formatDate(passenger!.dateOfBirth!)
        : '',
  );
  DateTime? dob;
  String selectedGender = passenger?.gender ?? 'Male';
  dob = passenger?.dateOfBirth;
  final List<String> genderList = <String>['Male', 'Female'];
  DateTime firstDate = DateTime(2000);
  DateTime lastDate = DateTime.now();
  DateTime initialDate = DateTime.now();
  int? selectedSegmentIndex;
  TravelerDataModel? selectedSavedPassenger;
  final List<DropdownMenuItem<String>> savedPassengerItems =
      <DropdownMenuItem<String>>[];

  // Fetch saved passengers when sheet opens
  try {
    // Use the captured bloc instead of relying on the bottom sheet context
    travellerBloc.add(const GetTravelersEvent());

    savedPassengerItems.clear();
    savedPassengerItems.add(
      const DropdownMenuItem<String>(
        value: '',
        child: Text('None - Add New Passenger'),
      ),
    );
  } catch (e) {
    log('Error fetching saved passengers: $e');
    savedPassengerItems.add(const DropdownMenuItem<String>(
      value: '',
      child: Text('None - Add New Passenger'),
    ));
  }

  if (passenger != null) {
    selectedSavedPassenger = TravelerDataModel(
      id: int.tryParse(passenger.id!),
      firstName: passenger.firstName,
      lastName: passenger.lastName,
      dateOfBirth: passenger.dateOfBirth.toString(),
      gender: passenger.gender,
      type: passenger.type,
      title: passenger.title ?? 'Mr',
    );
  } else {
    selectedSavedPassenger = null;
  }

  switch (travellerType) {
    case 'ADULT':
      {
        // Adults: 12 to 120 years old
        firstDate = DateTime.now().subtract(
          const Duration(days: 365 * 120), // 120 years ago
        );
        lastDate = DateTime.now().subtract(
          const Duration(days: 365 * 12), // 12 years ago
        );
        // Set initial date to 25 years ago (a reasonable default for adults)
        initialDate = DateTime.now().subtract(
          const Duration(days: 365 * 25),
        );
      }
      break;
    case 'CHILD':
      {
        // Children: 2 to 12 years old
        firstDate = DateTime.now().subtract(
          const Duration(days: 365 * 12), // 12 years ago
        );
        lastDate = DateTime.now().subtract(
          const Duration(days: 365 * 2), // 2 years ago
        );
        // Set initial date to 7 years ago (middle of child age range)
        initialDate = DateTime.now().subtract(
          const Duration(days: 365 * 7),
        );
      }
      break;
    case 'HELD_INFANT':
      {
        // Infants: 0 to 2 years old
        firstDate = DateTime.now().subtract(
          const Duration(days: 365 * 2), // 2 years ago
        );
        lastDate = DateTime.now(); // Today
        // Set initial date to 1 year ago (middle of infant age range)
        initialDate = DateTime.now().subtract(
          const Duration(days: 365),
        );
      }
      break;
    default:
  }

  await showModalBottomSheet(
    backgroundColor: AppHelpers.isDarkMode(context)
        ? AppColors.secondaryDark
        : AppColors.white,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) => BlocProvider.value(
      value: travellerBloc,
      child: StatefulBuilder(
        builder: (context, setState) =>
            BlocConsumer<TravellerBloc, TravellerState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is TravellerLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TravellerLoaded) {
              final List<TravelerDataModel> travelers = state.data ?? [];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Passenger Details',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Complete the form by providing necessary information',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.info.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.info.withValues(alpha: 0.3),
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: AppColors.info,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Please ensure all details match your government-issued ID (Passport, Driver\'s License, Aadhaar, etc.) as they will be verified during check-in.',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.info,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (state.data?.isNotEmpty ?? false)
                        SizedBox(
                          height: 55,
                          width: AppHelpers.getScreenWidth(context),
                          child: Builder(
                            builder: (context) => AppSearchDropdown<
                                    TravelerDataModel>(
                                searchFn: (items, value) => items
                                    .where((item) => item.value!.firstName!
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList(),
                                items: travelers
                                    .map((e) => DropdownMenuItem<
                                            TravelerDataModel>(
                                        value: e,
                                        child: Text(
                                            '${toTitleCase(e.firstName ?? '')} ${toTitleCase(e.lastName ?? '')}')))
                                    .toList(),
                                hintText: 'Select saved passenger',
                                labelText: 'View all saved travelers',
                                value: selectedSavedPassenger,
                                onChanged: (TravelerDataModel? value) {
                                  if (value != null) {
                                    selectedSavedPassenger = value;
                                    firstNameController.text =
                                        value.firstName ?? '';
                                    lastNameController.text =
                                        value.lastName ?? '';

                                    selectedGender = value.gender ?? '';
                                    dob =
                                        DateTime.parse(value.dateOfBirth ?? '');
                                    dobController.text =
                                        AppHelpers.formatDate(dob!);
                                    selectedSegmentIndex = null;
                                    setState(() {});
                                  }
                                }),
                          ),
                        ),
                      const SizedBox(height: 12),
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        width: AppHelpers.getScreenWidth(context),
                        decoration: BoxDecoration(
                          color: AppColors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.border.withValues(alpha: 0.3),
                          ),
                        ),
                        child: CountryCodePicker(
                            backgroundColor: AppColors.white,
                            initialSelection: selectedCountryCode,
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: true,
                            favorite: const ['IN'],
                            onChanged: (value) {
                              selectedCountryCode = value.code;
                              setState(() {});
                            }),
                      ),
                      const SizedBox(height: 12),
                      AppDropDown(
                          title: 'Title',
                          value: selectedTitle ?? '',
                          label: 'Title',
                          items: titleItems
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (value) {
                            selectedTitle = value;
                            setState(() {});
                          }),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 50,
                        width: AppHelpers.getScreenWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: AppHelpers.getScreenWidth(context) * 0.45,
                              child: AppPrimaryInput(
                                controller: firstNameController,
                                hint: 'Enter your first name',
                                label: 'First Name *',
                                maxCharacters: 30,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: AppHelpers.getScreenWidth(context) * 0.45,
                              child: AppPrimaryInput(
                                controller: lastNameController,
                                hint: 'Enter your last name',
                                label: 'Last Name *',
                                maxCharacters: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 50,
                        width: AppHelpers.getScreenWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50,
                              width: AppHelpers.getScreenWidth(context) * 0.35,
                              child: AppDropDown(
                                onChanged: (String? p0) {
                                  if (p0 != null && p0.isNotEmpty) {
                                    selectedGender = p0;
                                    setState(() {});
                                  }
                                },
                                label: 'Gender *',
                                title: 'Select Gender',
                                value: selectedGender,
                                items: genderList
                                    .map(
                                      (String e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: AppHelpers.getScreenWidth(context) * 0.54,
                              child: AppPrimaryInput(
                                controller: dobController,
                                onTap: () async {
                                  final DateTime? selectedDate =
                                      await showAppDatePicker(
                                    context: context,
                                    initialDate: dob ?? initialDate,
                                    firstDate: firstDate,
                                    lastDate: lastDate,
                                  );
                                  if (selectedDate != null) {
                                    dob = selectedDate;
                                    dobController.text =
                                        AppHelpers.formatDate(dob!);
                                    setState(() {});
                                  }
                                },
                                hint: 'Enter your date of birth',
                                label: 'Date of Birth',
                                maxCharacters: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (filteredSegemnts != null &&
                          filteredSegemnts.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Select Fare Option *',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppHelpers.isDarkMode(context)
                                      ? AppColors.white
                                      : AppColors.textPrimary,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              width: AppHelpers.getScreenWidth(context),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: filteredSegemnts.length,
                                itemBuilder: (context, index) => SegmentCard(
                                  data: filteredSegemnts[index],
                                  isSelected: selectedSegmentIndex == index,
                                  onTap: () {
                                    setState(() {
                                      selectedSegmentIndex = index;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            width: AppHelpers.getScreenWidth(context) * 0.4,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                          ),
                          SizedBox(
                            height: 50,
                            width: AppHelpers.getScreenWidth(context) * 0.4,
                            child: AppPrimaryButton(
                                onPressed: () async {
                                  // Validate first name
                                  final String firstName =
                                      firstNameController.text.trim();
                                  if (firstName.length < 3) {
                                    showToast(
                                        message:
                                            'Please enter valid first name');
                                    return;
                                  }
                                  if (firstName.split(' ').length > 1) {
                                    showToast(
                                        message:
                                            'First name should not contain spaces');
                                    return;
                                  }

                                  // Validate last name
                                  final String lastName =
                                      lastNameController.text.trim();
                                  if (lastName.length < 3) {
                                    showToast(
                                        message:
                                            'Please enter valid last name');
                                    return;
                                  }

                                  // Validate fare option selection
                                  if (filteredSegemnts != null &&
                                      selectedSegmentIndex == null) {
                                    showToast(
                                        message: 'Please select a fare option');
                                    return;
                                  }

                                  // Validate date of birth matches traveller type
                                  final DateTime now = DateTime.now();
                                  final int ageInYears = dob != null
                                      ? (now.difference(dob!).inDays / 365.25)
                                          .floor()
                                      : 0;

                                  bool isValidAge = false;

                                  if (dob != null) {
                                    switch (travellerType) {
                                      case 'ADULT':
                                        isValidAge = ageInYears >= 12 &&
                                            ageInYears <= 120;
                                        if (!isValidAge) {
                                          showToast(
                                              message:
                                                  'Age must be between 12 and 120 years for adults');
                                          return;
                                        }
                                        break;
                                      case 'CHILD':
                                        isValidAge =
                                            ageInYears >= 2 && ageInYears < 12;
                                        if (!isValidAge) {
                                          showToast(
                                              message:
                                                  'Age must be between 2 and 11 years for children');
                                          return;
                                        }
                                        break;
                                      case 'HELD_INFANT':
                                        isValidAge =
                                            ageInYears >= 0 && ageInYears < 2;
                                        if (!isValidAge) {
                                          showToast(
                                              message:
                                                  'Age must be less than 2 years for infants');
                                          return;
                                        }
                                        break;
                                    }
                                  }

                                  // Create passenger model - use saved passenger ID if one was selected

                                  final Map<String, dynamic> newPassenger = {
                                    'title': selectedTitle,
                                    'firstName': firstName,
                                    'lastName': lastName,
                                    'gender': selectedGender,
                                    'type': travellerType.toLowerCase(),
                                    'nationality': selectedCountryCode,
                                  };
                                  if (dob != null) {
                                    newPassenger['dateOfBirth'] =
                                        AppHelpers.formatDate(dob!,
                                            pattern: 'yyyy-MM-dd');
                                  }

                                  // Save passenger to local DB (fire and forget)
                                  if (selectedSavedPassenger == null) {
                                    travellerBloc.add(CreateTravelerEvent(
                                        body: newPassenger));
                                  }

                                  Navigator.pop(context);
                                  onDone(PassengerModel(
                                    title: selectedTitle,
                                    dateOfBirth: dob,
                                    firstName: firstName,
                                    lastName: lastName,
                                    gender: selectedGender,
                                    type: travellerType,
                                    countryCode: selectedCountryCode,
                                  ));
                                },
                                bgColor: AppHelpers.isDarkMode(context)
                                    ? AppColors.primary
                                    : AppColors.black,
                                title: 'Confirm',
                                isLoading: false),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              );
            }
            if (state is TravellerError) {
              return Center(child: Text(state.error));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    ),
  );
}

class SegmentCard extends StatefulWidget {
  const SegmentCard({
    super.key,
    required this.data,
    this.isSelected = false,
    this.onTap,
  });

  final FareDetailsBySegment data;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  State<SegmentCard> createState() => _SegmenCardState();
}

class _SegmenCardState extends State<SegmentCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 12),
          height: 150,
          width: AppHelpers.getScreenWidth(context) * 0.42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppHelpers.isDarkMode(context)
                ? AppColors.secondaryDark
                : AppColors.white,
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.primary
                  : AppColors.grey.withValues(alpha: 0.3),
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Stack(
            children: [
              // Main Content
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Header - Cabin Class
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: widget.isSelected
                                    ? AppColors.primary
                                    : AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                widget.data.cabin ?? '',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: widget.isSelected
                                      ? AppColors.white
                                      : AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            if (widget.data.fareDetailsBySegmentClass != null)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  widget.data.fareDetailsBySegmentClass!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Branded Fare
                        if (widget.data.brandedFare != null)
                          Text(
                            widget.data.brandedFare!,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppHelpers.isDarkMode(context)
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),

                    // Middle - Fare Basis
                    if (widget.data.fareBasis != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.confirmation_number_outlined,
                              size: 10,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                widget.data.fareBasis!,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Bottom - Baggage Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Divider
                        Container(
                          height: 1,
                          color: AppColors.grey.withValues(alpha: 0.2),
                        ),
                        const SizedBox(height: 6),
                        // Baggage
                        Row(
                          children: [
                            Icon(
                              Icons.luggage_outlined,
                              size: 14,
                              color: widget.isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.data.includedCheckedBags != null
                                  ? '${widget.data.includedCheckedBags!.weight ?? 0} ${widget.data.includedCheckedBags!.weightUnit ?? 'kg'}'
                                  : 'No baggage',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: widget.isSelected
                                    ? AppColors.primary
                                    : AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Selection Indicator
              if (widget.isSelected)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppHelpers.isDarkMode(context)
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 14,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
