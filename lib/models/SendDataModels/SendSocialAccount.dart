/// accounts : [{"name":"Instagram","url":"jhjhj"},{"name":"Twitter","url":"qwqwq"},{"name":"YouTube","url":"dsd"},{"name":"LinkedIn","url":"sds"}]

class SendSocialAccount {
  SendSocialAccount({
      this.accounts,});

  SendSocialAccount.fromJson(dynamic json) {
    if (json['accounts'] != null) {
      accounts = [];
      json['accounts'].forEach((v) {
        accounts?.add(Accounts.fromJson(v));
      });
    }
  }
  List<Accounts>? accounts;
SendSocialAccount copyWith({  List<Accounts>? accounts,
}) => SendSocialAccount(  accounts: accounts ?? this.accounts,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (accounts != null) {
      map['accounts'] = accounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Instagram"
/// url : "jhjhj"

class Accounts {
  Accounts({
      this.name, 
      this.url,});

  Accounts.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;
Accounts copyWith({  String? name,
  String? url,
}) => Accounts(  name: name ?? this.name,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}