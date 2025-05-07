// Obx(() => CustomTextFormField(
//   controller: fullNameController,
//   focusNode: fullNameFocusNode,
//   autofocus: true,
//   textInputAction: TextInputAction.next,
//   keyboardType: TextInputType.text,
//   hintText: "Please enter your full name...",
//   hintFadeDuration: const Duration(seconds: 2),
//   mouseCursor: SystemMouseCursors.text,
//   suffixIcon: Icons.person,
//   helper: _buildValidationHelper(context),
//   onChanged: (value) => validateController.setterUserNameValidateHelper(value, context),
// )),
//
// // Helper method to build the validation UI
// Widget _buildValidationHelper(BuildContext context) {
//   final helperText = validateController.userNameValidateHelper.value;
//   final strength = helperText.length; // Or use your own validation logic
//
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       if (helperText.isNotEmpty)
//         Text(
//           helperText,
//           style: Theme.of(context).textTheme.caption?.copyWith(
//             color: _getTextColorForValidation(helperText),
//           ),
//         ),
//       const SizedBox(height: 4),
//       // Password strength meter style validation indicator
//       Container(
//         height: 4,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.surfaceVariant,
//           borderRadius: BorderRadius.circular(2),
//         ),
//         child: Row(
//           children: [
//             if (strength > 0)
//               Expanded(
//                 flex: strength > 0 ? 1 : 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _getStrengthColor(strength),
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               ),
//             if (strength > 1)
//               Expanded(
//                 flex: strength > 1 ? 1 : 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _getStrengthColor(strength),
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               ),
//             if (strength > 2)
//               Expanded(
//                 flex: strength > 2 ? 1 : 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: _getStrengthColor(strength),
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
//
// Color _getStrengthColor(int strength) {
//   if (strength < 2) return Colors.red;
//   if (strength < 4) return Colors.orange;
//   return Colors.green;
// }
//
// Color _getTextColorForValidation(String text) {
//   if (text.contains("Invalid") || text.contains("Error")) return Colors.red;
//   if (text.contains("Warning")) return Colors.orange;
//   return Colors.green;
// }