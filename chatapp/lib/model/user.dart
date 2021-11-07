class Userde{
late String userid;
late String emailid;
late String username;

Userde({required this.emailid,required this.userid,required this.username});

factory Userde.fromMap(map) {
  return Userde(
    emailid: map['emailid'],
    userid: map['userid'],
    username: map['username'],

  );
}


Map<String, dynamic> toMap() {
  return {
    'emailid': emailid,
    'userid': userid,
    'username': username,

  };
}

}