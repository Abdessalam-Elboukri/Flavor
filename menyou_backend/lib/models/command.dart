
class Command{
  final String id;
  final String user_id;
  final DateTime date;
  final int total_price;

  Command({required this.id,required this.date,required this.total_price, required this.user_id});

  Command.fromJson(Map<String,dynamic> json):
        id=json['id'],
        date=json['date'],
        total_price=json['total_price'],
        user_id=json['userid'];



  Map<String, dynamic> toJson() {
    return {'id': id, 'date': date, 'total_price': total_price, 'userid':user_id};
  }


}