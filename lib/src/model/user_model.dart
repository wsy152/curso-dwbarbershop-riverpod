sealed class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;

  UserModel(
      {required this.id, required this.name, required this.email, this.avatar});
}

class UserModelADM extends UserModel {
  final List<String>? workDays;
  final List<int>? workHours;

  UserModelADM({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    this.workDays,
    this.workHours,
  });
}

class UserModelEmployee extends UserModel {
  final int barberShopId;
  final List<String> workDays;
  final List<int> workHours;

  UserModelEmployee({
    required this.barberShopId,
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    required this.workDays,
    required this.workHours,
  });
}


// {
// 	"id": 5,
// 	"name": "Rodrigo Rahman 1",
// 	"email": "rodrigorahman1@gmail.com",
// 	"profile": "ADM",
// 	"work_days": [
// 		"Seg",
// 		"Qua"
// 	],
// 	"work_hours": [
// 		6,
// 		7,
// 		8
// 	]
// }