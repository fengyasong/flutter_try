import 'package:flutter/material.dart';
import 'package:web_pages/model/member.dart';
import 'package:web_pages/pages/member_detail2.dart';

class MemberDetail extends StatelessWidget {
  final Member member;

  const MemberDetail({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MemberDetail2(
                    member: member,
                  ),
                ),
              );
            },
            child: Hero(
              tag: '${member.id}',
              child: Image.network(
                'https://www.snh48.com/images/member/zp_${member.id}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              member.catchPhrase ?? '',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '昵称：${member.nickname}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '${member.birthPlace} ${member.birthDay}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '身高：${member.height} cm  血型：${member.bloodType}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '特长：${member.speciality}  爱好：${member.hobby}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 32.0,
                ),
                Text(
                  "${member.experience.replaceAll('<br>', '\n')}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
