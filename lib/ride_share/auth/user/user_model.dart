enum UserRole { Driver, Passenger,Developer }
enum UserRequest { Pending, Approved }
UserRole userRoleFromString(String roleString) {
   return UserRole.values.firstWhere(
          (role) => role.name.toString().toLowerCase() == roleString.toLowerCase(),
      orElse: () => UserRole.Passenger, // default value if not found
   );
}
class UserModel {
   final String uId;
   final String username;
   final String email;
   final String idCardNo;
   final String phone;
   final String vehicleNo;
   final String vehicleChassisNo;
   final String userImg;
   final String userDeviceToken;
   final String country;
   final String city;
   final String userAddress;
   final String street;
   final UserRole role;
   final UserRequest requestStatus; // New property
   final bool isActive;
   final dynamic createdAt;

   // Constructor with required parameters
   const UserModel({
      required this.uId,
      required this.username,
      required this.email,
      required this.idCardNo,
      required this.phone,
      required this.vehicleNo,
      required this.vehicleChassisNo,
      required this.userImg,
      required this.userDeviceToken,
      required this.country,
      required this.city,
      required this.userAddress,
      required this.street,
      required this.role,
      required this.requestStatus, // New parameter
      required this.isActive,
      required this.createdAt,
   });

   // Convert to Map
   Map<String, dynamic> toMap() {
      return {
         'uId': uId,
         'username': username,
         'email': email,
         'idCardNo': idCardNo,
         'phone': phone,
         'vehicleNo': vehicleNo,
         'vehicleChassisNo': vehicleChassisNo,
         'userImg': userImg,
         'userDeviceToken': userDeviceToken,
         'country': country,
         'city': city,
         'userAddress': userAddress,
         'street': street,
         'role': role.name,
         'requestStatus': requestStatus.name, // Added to map
         'isActive': isActive,
         'createdAt': createdAt.toString(),
      };
   }

   // Create from Map
   factory UserModel.fromMap(Map<String, dynamic> map) {
      return UserModel(
         uId: map['uId'] ?? '',
         username: map['username'] ?? '',
         email: map['email'] ?? '',
         idCardNo: map['idCardNo'] ?? '',
         phone: map['phone'] ?? '',
         vehicleNo: map['vehicleNo'] ?? '',
         vehicleChassisNo: map['vehicleChassisNo'] ?? '',
         userImg: map['userImg'] ?? '',
         userDeviceToken: map['userDeviceToken'] ?? '',
         country: map['country'] ?? '',
         city: map['city'] ?? '',
         userAddress: map['userAddress'] ?? '',
         street: map['street'] ?? '',
         role: map['role'] != null
             ? UserRole.values.firstWhere((e) => e.name == map['role'])
             : UserRole.Passenger,
         requestStatus: map['requestStatus'] != null // New mapping
             ? UserRequest.values.firstWhere((e) => e.name == map['requestStatus'])
             : UserRequest.Pending, // Default value
         isActive: map['isActive'] ?? false,
         createdAt: map['createdAt'],
      );
   }
}