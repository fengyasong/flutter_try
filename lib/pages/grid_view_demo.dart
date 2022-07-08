import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:web_pages/data/common_data.dart';
import 'package:web_pages/model/member.dart';
import 'package:web_pages/pages/member_detail.dart';
import 'package:web_pages/pages/member_detail2.dart';

class GridViewDemo extends StatelessWidget{

  late List<Member> members;

  GridViewDemo(){
    final json = convert.jsonDecode(member);
    members = json['rows'].map<Member>((row)=>
        Member(
              id: row['sid'],
              name: row['sname'],
              pinyin: row['pinyin'],
              starSign12: row['star_sign_12'],
              nickname: row['nickname'],
              birthPlace: row['birth_place'],
              birthDay: row['birth_day'],
              height: row['height'],
              bloodType: row['blood_type'],
              speciality: row['speciality'],
              hobby: row['hobby'],
              experience: row['experience'],
              catchPhrase: row['catch_phrase'],
              pName: row['pname'],
              tName: row['tname'],
              company: row['company'],
              joinDay: row['join_day'],
            )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SNH48 成员'),
      ),
      body: Scrollbar(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount:members.length,
          itemBuilder: (context,index){
            return InkWell(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Hero(
                      tag: '${members[index].id}',
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 32,
                          backgroundImage: NetworkImage('https://www.snh48.com/images/member/zp_${members[index].id}.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      members[index].name,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.pinkAccent
                      ),
                    ),
                    /*Text(
                      members[index].starSign12,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                      ),
                    ),*/
                  ]
              ),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MemberDetail(member: members[index],)),
                );
              },
            );
          },
        ),
      ),
    ) ;
  }

}