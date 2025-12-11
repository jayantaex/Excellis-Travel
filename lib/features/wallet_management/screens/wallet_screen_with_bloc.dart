// import 'package:excellistravel/core/constants/app_styles.dart';
// import 'package:excellistravel/core/utils/app_helpers.dart';
// import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
// import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
// import 'package:excellistravel/core/widgets/trans_white_bg_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import '../bloc/wallet_bloc.dart';
// import '../data/models/withdrawal_request_model.dart';
// import '../widgets/transaction_card_widget.dart';
// import '../widgets/type_card_widget.dart';

// class WalletScreenWithBloc extends StatefulWidget {
//   const WalletScreenWithBloc({super.key});

//   @override
//   State<WalletScreenWithBloc> createState() => _WalletScreenWithBlocState();
// }

// class _WalletScreenWithBlocState extends State<WalletScreenWithBloc>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late ScrollController _scrollController;
//   String selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _scrollController = ScrollController();

//     // Fetch wallet data on init
//     context.read<WalletBloc>().add(const FetchWalletEvent());

//     // Add listener for tab changes
//     _tabController.addListener(() {
//       if (!_tabController.indexIsChanging) {
//         setState(() {
//           switch (_tabController.index) {
//             case 0:
//               selectedFilter = 'all';
//               break;
//             case 1:
//               selectedFilter = 'credit';
//               break;
//             case 2:
//               selectedFilter = 'debit';
//               break;
//           }
//         });
//         // Trigger filter event
//         context.read<WalletBloc>().add(
//               FilterTransactionsEvent(filterType: selectedFilter),
//             );
//       }
//     });

//     // Add scroll listener for pagination
//     _scrollController.addListener(_onScroll);
//   }

//   void _onScroll() {
//     if (_isBottom) {
//       final state = context.read<WalletBloc>().state;
//       if (state is WalletLoaded && !state.isLoadingMore) {
//         final nextPage = state.wallet.currentPage + 1;
//         if (nextPage <= state.wallet.totalPages) {
//           context.read<WalletBloc>().add(
//                 LoadMoreTransactionsEvent(
//                   page: nextPage,
//                   filterType: selectedFilter == 'all' ? null : selectedFilter,
//                 ),
//               );
//         }
//       }
//     }
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _showWithdrawalSheet() {
//     final state = context.read<WalletBloc>().state;
//     double availableBalance = 0.0;

//     if (state is WalletLoaded) {
//       availableBalance = state.wallet.balance;
//     }

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => _WithdrawalSheet(
//         availableBalance: availableBalance,
//         onSubmit: (request) {
//           context.read<WalletBloc>().add(
//                 SubmitWithdrawalEvent(request: request),
//               );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: AppGradientBg(
//           child: TransWhiteBgWidget(
//             child: SafeArea(
//               child: BlocConsumer<WalletBloc, WalletState>(
//                 listener: (context, state) {
//                   if (state is WithdrawalSubmitted) {
//                     Navigator.pop(context); // Close bottom sheet
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(state.message),
//                         backgroundColor: AppColors.success,
//                       ),
//                     );
//                   } else if (state is WithdrawalError) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(state.message),
//                         backgroundColor: AppColors.error,
//                       ),
//                     );
//                   } else if (state is AddMoneySuccess) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(state.message),
//                         backgroundColor: AppColors.success,
//                       ),
//                     );
//                   } else if (state is AddMoneyError) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(state.message),
//                         backgroundColor: AppColors.error,
//                       ),
//                     );
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state is WalletLoading) {
//                     return const Center(
//                       child: CircularProgressIndicator(
//                         color: AppColors.primary,
//                       ),
//                     );
//                   }

//                   if (state is WalletError) {
//                     return Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.error_outline,
//                             size: 64,
//                             color: AppColors.error,
//                           ),
//                           const SizedBox(height: 16),
//                           Text(
//                             state.message,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: AppColors.textSecondary,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 16),
//                           ElevatedButton(
//                             onPressed: () {
//                               context.read<WalletBloc>().add(
//                                     const FetchWalletEvent(),
//                                   );
//                             },
//                             child: const Text('Retry'),
//                           ),
//                         ],
//                       ),
//                     );
//                   }

//                   if (state is! WalletLoaded) {
//                     return const SizedBox.shrink();
//                   }

//                   final wallet = state.wallet;

//                   return Column(
//                     children: [
//                       // App Bar
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: AppCustomAppbar(
//                           centerTitle: 'My Wallet',
//                         ),
//                       ),

//                       // Balance Section
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 4),
//                             // Total Balance
//                             Text(
//                               '₹${wallet.balance.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 36,
//                                 color: AppColors.white,
//                                 fontWeight: FontWeight.w700,
//                                 letterSpacing: -1,
//                               ),
//                             ),
//                             const SizedBox(height: 2),
//                             const Text(
//                               'Available Balance',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: AppColors.white,
//                                 fontWeight: FontWeight.w500,
//                                 letterSpacing: 0.3,
//                               ),
//                             ),
//                             const SizedBox(height: 12),

//                             // Credit and Debit Cards
//                             SizedBox(
//                               height: 85,
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: TypeCardWidget(
//                                       type: 'cr',
//                                       value:
//                                           wallet.totalCredit.toStringAsFixed(2),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 10),
//                                   Expanded(
//                                     child: TypeCardWidget(
//                                       type: 'dr',
//                                       value:
//                                           wallet.totalDebit.toStringAsFixed(2),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 10),

//                             // Withdrawal Button
//                             SizedBox(
//                               width: double.infinity,
//                               height: 44,
//                               child: ElevatedButton.icon(
//                                 onPressed: _showWithdrawalSheet,
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: AppColors.white,
//                                   foregroundColor: AppColors.primary,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                                 icon: const Icon(Icons.account_balance_outlined,
//                                     size: 18),
//                                 label: const Text(
//                                   'Withdraw Money',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                           ],
//                         ),
//                       ),

//                       // Transaction List Section
//                       Expanded(
//                         child: Container(
//                           width: AppHelpers.getScreenWidth(context),
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(32),
//                               topRight: Radius.circular(32),
//                             ),
//                             color: AppColors.background,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 16),

//                               // Transaction Header
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                                 child: Text(
//                                   'Transaction History',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700,
//                                     color: AppColors.textPrimary,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 12),

//                               // Filter Tabs
//                               Container(
//                                 margin:
//                                     const EdgeInsets.symmetric(horizontal: 20),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(
//                                     color: AppColors.border,
//                                     width: 1,
//                                   ),
//                                 ),
//                                 child: TabBar(
//                                   controller: _tabController,
//                                   indicator: BoxDecoration(
//                                     color: AppColors.primary,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   indicatorSize: TabBarIndicatorSize.tab,
//                                   indicatorPadding: const EdgeInsets.all(4),
//                                   labelColor: AppColors.white,
//                                   unselectedLabelColor: AppColors.textSecondary,
//                                   labelStyle: const TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   unselectedLabelStyle: const TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   dividerColor: Colors.transparent,
//                                   tabs: const [
//                                     Tab(text: 'All'),
//                                     Tab(text: 'Credits'),
//                                     Tab(text: 'Debits'),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 12),

//                               // Transaction List
//                               Expanded(
//                                 child: wallet.transactions.isEmpty
//                                     ? Center(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Icon(
//                                               Icons.receipt_long_outlined,
//                                               size: 64,
//                                               color: AppColors.textHint
//                                                   .withOpacity(0.5),
//                                             ),
//                                             const SizedBox(height: 16),
//                                             const Text(
//                                               'No transactions found',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: AppColors.textSecondary,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 8),
//                                             Text(
//                                               'Your ${selectedFilter == 'all' ? '' : selectedFilter} transactions will appear here',
//                                               style: const TextStyle(
//                                                 fontSize: 13,
//                                                 color: AppColors.textHint,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     : ListView.builder(
//                                         controller: _scrollController,
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 20,
//                                         ),
//                                         itemCount: wallet.transactions.length +
//                                             (state.isLoadingMore ? 1 : 0),
//                                         itemBuilder: (context, index) {
//                                           if (index ==
//                                               wallet.transactions.length) {
//                                             return const Padding(
//                                               padding: EdgeInsets.all(16),
//                                               child: Center(
//                                                 child:
//                                                     CircularProgressIndicator(
//                                                   color: AppColors.primary,
//                                                 ),
//                                               ),
//                                             );
//                                           }

//                                           final transaction =
//                                               wallet.transactions[index];
//                                           final dateFormat =
//                                               DateFormat('d MMM yyyy, h:mm a');

//                                           return TransactionCardWidget(
//                                             title: transaction.title,
//                                             date: dateFormat
//                                                 .format(transaction.date),
//                                             amount: transaction.amount
//                                                 .toStringAsFixed(2),
//                                             type: transaction.type,
//                                             description:
//                                                 transaction.description,
//                                             transactionId:
//                                                 transaction.transactionId,
//                                           );
//                                         },
//                                       ),
//                               ),
//                               const SizedBox(height: 16),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       );
// }

// // Withdrawal Bottom Sheet Widget
// class _WithdrawalSheet extends StatefulWidget {
//   final double availableBalance;
//   final Function(WithdrawalRequestModel) onSubmit;

//   const _WithdrawalSheet({
//     required this.availableBalance,
//     required this.onSubmit,
//   });

//   @override
//   State<_WithdrawalSheet> createState() => _WithdrawalSheetState();
// }

// class _WithdrawalSheetState extends State<_WithdrawalSheet> {
//   final _formKey = GlobalKey<FormState>();
//   final _amountController = TextEditingController();
//   final _accountController = TextEditingController();
//   final _ifscController = TextEditingController();
//   final _nameController = TextEditingController();

//   @override
//   void dispose() {
//     _amountController.dispose();
//     _accountController.dispose();
//     _ifscController.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }

//   void _processWithdrawal() {
//     if (_formKey.currentState?.validate() ?? false) {
//       final request = WithdrawalRequestModel(
//         amount: double.parse(_amountController.text),
//         accountHolderName: _nameController.text,
//         accountNumber: _accountController.text,
//         ifscCode: _ifscController.text.toUpperCase(),
//       );

//       widget.onSubmit(request);
//     }
//   }

//   @override
//   Widget build(BuildContext context) => Container(
//         decoration: const BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(24),
//             topRight: Radius.circular(24),
//           ),
//         ),
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: AppColors.primary.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: const Icon(
//                           Icons.account_balance_outlined,
//                           color: AppColors.primary,
//                           size: 24,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       const Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Withdraw Money',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.textPrimary,
//                               ),
//                             ),
//                             SizedBox(height: 2),
//                             Text(
//                               'Transfer to your bank account',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: AppColors.textSecondary,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () => Navigator.pop(context),
//                         icon: const Icon(Icons.close),
//                         color: AppColors.textSecondary,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   // Available Balance
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: AppColors.primary.withOpacity(0.05),
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: AppColors.primary.withOpacity(0.2),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.account_balance_wallet_outlined,
//                           color: AppColors.primary,
//                           size: 20,
//                         ),
//                         const SizedBox(width: 12),
//                         const Text(
//                           'Available Balance:',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: AppColors.textSecondary,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Spacer(),
//                         Text(
//                           '₹${widget.availableBalance.toStringAsFixed(2)}',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // Amount Field
//                   const Text(
//                     'Withdrawal Amount',
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _amountController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: 'Enter amount',
//                       prefixIcon: const Icon(Icons.currency_rupee, size: 20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                             color: AppColors.primary, width: 2),
//                       ),
//                       filled: true,
//                       fillColor: AppColors.background,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter amount';
//                       }
//                       final amount = double.tryParse(value);
//                       if (amount == null || amount <= 0) {
//                         return 'Please enter a valid amount';
//                       }
//                       if (amount > widget.availableBalance) {
//                         return 'Insufficient balance';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),

//                   // Account Holder Name
//                   const Text(
//                     'Account Holder Name',
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter account holder name',
//                       prefixIcon: const Icon(Icons.person_outline, size: 20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                             color: AppColors.primary, width: 2),
//                       ),
//                       filled: true,
//                       fillColor: AppColors.background,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter account holder name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),

//                   // Account Number
//                   const Text(
//                     'Account Number',
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _accountController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: 'Enter account number',
//                       prefixIcon: const Icon(Icons.account_balance, size: 20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                             color: AppColors.primary, width: 2),
//                       ),
//                       filled: true,
//                       fillColor: AppColors.background,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter account number';
//                       }
//                       if (value.length < 9 || value.length > 18) {
//                         return 'Please enter a valid account number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),

//                   // IFSC Code
//                   const Text(
//                     'IFSC Code',
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _ifscController,
//                     textCapitalization: TextCapitalization.characters,
//                     decoration: InputDecoration(
//                       hintText: 'Enter IFSC code',
//                       prefixIcon: const Icon(Icons.code, size: 20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                             color: AppColors.primary, width: 2),
//                       ),
//                       filled: true,
//                       fillColor: AppColors.background,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter IFSC code';
//                       }
//                       if (value.length != 11) {
//                         return 'IFSC code must be 11 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 24),

//                   // Submit Button
//                   BlocBuilder<WalletBloc, WalletState>(
//                     builder: (context, state) {
//                       final isSubmitting = state is WithdrawalSubmitting;

//                       return SizedBox(
//                         width: double.infinity,
//                         height: 52,
//                         child: ElevatedButton(
//                           onPressed: isSubmitting ? null : _processWithdrawal,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primary,
//                             foregroundColor: AppColors.white,
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: isSubmitting
//                               ? const SizedBox(
//                                   height: 20,
//                                   width: 20,
//                                   child: CircularProgressIndicator(
//                                     color: AppColors.white,
//                                     strokeWidth: 2,
//                                   ),
//                                 )
//                               : const Text(
//                                   'Submit Withdrawal Request',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
// }
