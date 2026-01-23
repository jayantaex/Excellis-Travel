import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_drop_down.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../utils/app_date_picker.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../utils/app_toast.dart';
import '../../data/models/flight_offer_price_model.dart';
import '../../data/models/passenger_model.dart';

class AddPassengerScreen extends StatefulWidget {
  const AddPassengerScreen(
      {super.key,
      required BuildContext context,
      required this.travelerType,
      required this.onDone,
      required this.passenger,
      required this.filteredSegments});

  final String travelerType;
  final Function(PassengerModel passenger) onDone;
  final PassengerModel? passenger;
  final List<FareDetailsBySegment>? filteredSegments;

  @override
  State<AddPassengerScreen> createState() => _AddPassengerScreenState();
}

class _AddPassengerScreenState extends State<AddPassengerScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  DateTime? dob;

  final List<String> genderList = <String>['Male', 'Female'];
  String selectedGender = 'Male';
  DateTime firstDate = DateTime(2000);
  DateTime lastDate = DateTime.now();
  DateTime initialDate = DateTime.now();
  int? selectedSegmentIndex;

  @override
  void initState() {
    switch (widget.travelerType) {
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

    if (widget.passenger != null) {
      firstNameController.text = widget.passenger!.firstName ?? '';
      lastNameController.text = widget.passenger!.lastName ?? '';
      mobileNumberController.text = widget.passenger!.number ?? '';
      emailController.text = widget.passenger!.emailAddress ?? '';
      dobController.text = widget.passenger!.dateOfBirth != null
          ? AppHelpers.formatDate(widget.passenger!.dateOfBirth!)
          : '';
      selectedGender = widget.passenger!.gender ?? 'Male';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Passenger'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Passenger Details',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Complete the form by providing necessary information',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                AppPrimaryInput(
                  controller: emailController,
                  hint: 'Enter your email address',
                  label: 'Email',
                  maxCharacters: 320,
                ),
                const SizedBox(height: 12),
                AppPrimaryInput(
                  keyboardType: TextInputType.number,
                  controller: mobileNumberController,
                  hint: 'Enter your Mobile number',
                  label: 'Mobile Number',
                  maxCharacters: 10,
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
                            selectedGender = p0!;
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
                            dob = await showAppDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: firstDate,
                              lastDate: lastDate,
                            );
                            dobController.text =
                                dob != null ? AppHelpers.formatDate(dob!) : '';
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
                if (widget.filteredSegments != null &&
                    widget.filteredSegments!.isNotEmpty)
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
                          itemCount: widget.filteredSegments!.length,
                          itemBuilder: (context, index) => SegmentCard(
                            data: widget.filteredSegments![index],
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
                          onPressed: () {
                            if (firstNameController.text.length < 3) {
                              showToast(
                                  message: 'Please enter valid first name');
                              return;
                            }

                            if (lastNameController.text.length < 3) {
                              showToast(
                                  message: 'Please enter valid last name');
                              return;
                            }

                            if (emailController.text.isNotEmpty &&
                                !AppHelpers.validateEmail(
                                    emailController.text)) {
                              showToast(
                                  message:
                                      'Please enter a valid email address');
                              return;
                            }

                            if (mobileNumberController.text.isNotEmpty &&
                                !AppHelpers.validateMobileNumber(
                                    mobileNumberController.text)) {
                              showToast(
                                  message:
                                      'Please enter a valid mobile number');
                              return;
                            }

                            if (widget.filteredSegments != null &&
                                selectedSegmentIndex == null) {
                              showToast(message: 'Please select a fare option');
                              return;
                            }

                            Navigator.pop(context);
                            widget.onDone(
                              PassengerModel(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                dateOfBirth: dob,
                                emailAddress: emailController.text,
                                number: mobileNumberController.text,
                                gender: selectedGender,
                                type: widget.travelerType,
                              ),
                            );
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
  State<SegmentCard> createState() => _SegmentCardState();
}

class _SegmentCardState extends State<SegmentCard> {
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
