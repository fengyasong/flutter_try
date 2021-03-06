import 'package:flutter/material.dart';
import 'package:web_pages/model/member.dart';

class MemberDetail2 extends StatelessWidget {
  final Member member;

  const MemberDetail2({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: BackButton(
              color: Colors.grey[800],
            ),
            expandedHeight: 300,
            backgroundColor: Colors.pink[50],
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                member.name,
                style: TextStyle(color: Colors.grey[800]),
              ),
              background: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Material(
                        child: Image.network(
                          'https://tse3-mm.cn.bing.net/th/id/OIP-C.PGlORbbqV0KE4vGIwtYxoQHaE7?pid=ImgDet&rs=1',
                          fit: BoxFit.cover,
                        ),
                            elevation: 0,
                      )),
                      Container(height: 1,color: Colors.pink[100],),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(80),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Hero(
                          tag: member.id,
                          child: Material(
                            shape: CircleBorder(),
                            elevation: 8,
                            child: ClipOval(
                              child: Image.network(
                                'https://www.snh48.com/images/member/zp_${member.id}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildInfo("??????", member.pName!),
                _buildInfo("????????????", member.joinDay!),
                _buildInfo("??????", member.tName!),
                _buildInfo("??????", member.pinyin),
                _buildInfo("??????", member.nickname!),
                _buildInfo("??????", member.starSign12),
                _buildInfo("?????????", member.birthPlace!),
                _buildInfo("??????", member.birthDay!),
                _buildInfo("??????", "${member.height} cm"),
                _buildInfo("??????", member.bloodType!),
                _buildInfo("??????", member.speciality!),
                _buildInfo("??????", member.hobby!),
                _buildInfo("??????", member.company!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildInfo(String label, String context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            Expanded(
              flex: 4,
              child: Text(
                context,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
