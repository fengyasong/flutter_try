import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../core/http/http.dart';
import '../../core/utils/toast.dart';
import '../../core/widget/loading_dialog.dart';
import '../../generated/i18n.dart';
import '../../utils/provider.dart';
import '../../utils/sputils.dart';
import '../index.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 响应空白处的焦点的Node
  bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            // leading: _leading(context),
            title: Text(I18n.of(context).login),
            actions: <Widget>[
              TextButton(
                child: Text(I18n.of(context).register,
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Get.to(() => RegisterPage());
                },
              )
            ],
          ),
          body: GestureDetector(
            onTap: () {
              // 点击空白页面关闭键盘
              closeKeyboard(context);
            },
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: buildForm(context),
            ),
          ),
        ),
        onWillPop: () async {
          return Future.value(false);
        });
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          Center(
              heightFactor: 1.5,
              child:Image.asset(
                'images/logo2.png',
                width: 120,
                height: 120,
              ),
              ),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: InputDecoration(
                  labelText: I18n.of(context).loginName,
                  hintText: I18n.of(context).loginNameHint,
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                return v!.trim().length > 0
                    ? null
                    : I18n.of(context).loginNameError;
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: I18n.of(context).password,
                  hintText: I18n.of(context).passwordHint,
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isShowPassWord
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: showPassWord)),
              obscureText: !_isShowPassWord,
              //校验密码
              validator: (v) {
                return v!.trim().length >= 6
                    ? null
                    : I18n.of(context).passwordError;
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(15.0)),
                    child: Text(I18n.of(context).login,
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context)?.validate()??false) {
                        onSubmit(context);
                      }
                    },
                  );
                })),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  //验证通过提交数据
  void onSubmit(BuildContext context) {
    closeKeyboard(context);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
          );
        });

    UserProfile userProfile = Provider.of<UserProfile>(context, listen: false);

    XHttp.postJson("/tokens", {
      "username": _unameController.text,
      "password": _pwdController.text
    }).then((response) {
      print('打印日志=========='+response);
      Navigator.pop(context);
      if (response['errorCode'] == 0) {
        userProfile.nickName = response['data']['nickname'];
        ToastUtils.toast(I18n.of(context).loginSuccess);

        SPUtils.saveUser(response.data);
        SPUtils.saveUserToken(response.data.token);

        Get.off(() => MainHomePage());
      } else {
        ToastUtils.error(response['errorMsg']);
      }
    }).catchError((onError) {
      Navigator.of(context).pop();
      ToastUtils.error(onError);
    });
  }
}
