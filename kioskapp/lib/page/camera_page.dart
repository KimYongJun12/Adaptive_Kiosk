import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kioskapp/api/naver_api.dart';

import '../singleTon.dart';
import 'order_page.dart';

class cameraPage extends StatefulWidget {
  @override
  _cameraPageState createState() => _cameraPageState();
}

class _cameraPageState extends State<cameraPage> {
  String total = "";
  var  age= SingletonTwo();
  List<String> ageGroup = ['대상 선택 안됨', '20대 남성', '60대 여성'];
  CameraDescription camera_dir;
  bool _cameraInitialized = false;
  CameraController _cameraController;
  var map;
  String gender = '   ';
  String callAge = '   ';
  int midAge = 25;

  @override
  void initState() {
    // 화면에 처음 진입할 때 카메라 사용을 준비 하도록 합니다.
    super.initState();
    readyToCamera();
  }

  @override
  void dispose() {
    // 화면에서 벗어날 때 카메라 제어기를 위해 OS에게 할당 받은 리소스를 정리 합니다.
    if (_cameraController != null) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  void readyToCamera() async {
    if (_cameraController == null) {
      final cameras = await availableCameras();
      if (0 == cameras.length) {
        print("not found any cameras");
        return;
      }

      for (var camera in cameras) {
        if (camera.lensDirection == CameraLensDirection.front) {
          camera_dir = camera;
          break;
        }
      }
    } else {
      final cameras = await availableCameras();
      if (camera_dir.lensDirection == CameraLensDirection.front) {
        for (var camera in cameras) {
          if (camera.lensDirection == CameraLensDirection.back) {
            camera_dir = camera;
            break;
          }
        }
      } else {
        for (var camera in cameras) {
          if (camera.lensDirection == CameraLensDirection.front) {
            camera_dir = camera;
            break;
          }
        }
      }
    }

    _cameraController = CameraController(
        camera_dir, ResolutionPreset.high // 가장 높은 해상도의 기능을 쓸 수 있도록 합니다.
        );
    _cameraController.initialize().then((value) {
      // 카메라 준비가 끝나면 카메라 미리보기를 보여주기 위해 앱 화면을 다시 그립니다.
      setState(() => _cameraInitialized = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _cameraInitialized
            ? Column(
                children: [
                  _mainPage(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                          color: Colors.red,
                          onPressed: () async {
                            final image = await _cameraController.takePicture();
                            print(image.runtimeType);
                            final f = File(image.path);

                            map = await naverApi(f);
                            setState(() {
                              callAge = map['faces'][0]['age']['value'];
                              midAge = getMidAge(callAge);
                              gender = map['faces'][0]['gender']['value'];
                              total= getString();
                            });
                          },
                          child: Text('나이 확인')),
                      _gridAgeGender()
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        readyToCamera();
                      });
                    },
                    child: Text('카메라 바꾸기'),
                  ),
                  Container(
                    color: Colors.green,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          selectAge();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => orderPage()));
                        });
                      },
                      child: Text(total+"메뉴 보기"),
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }

  Widget _mainPage() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(child: CameraPreview(_cameraController)),
        ),
      ],
    );
  }

  Widget _gridAgeGender() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  '나이',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                child: Text(
                  '성별',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  midAge.toString(),
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.end,
                ),
                width: 100,
              ),
              SizedBox(
                child: Text(
                  gender,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.end,
                ),
                width: 100,
              )
            ],
          ),
        ],
      ),
    );
  }

  int getMidAge(String age) {
    var arr = age.split('~');
    return (int.parse(arr[0]) + int.parse(arr[1])) ~/ 2;
  }

  String getString() {
    String result = "";
    if (midAge >= 20 && midAge < 30) {
      result += "20대";
    }else if(midAge >= 60 && midAge < 70){
    result += "60대";
    }
    else{
      result += "??대";
    }

    result+=" ";


    if (gender == "male") {
      result += "남성";
    }else if(gender == "female")
      {
        result += "여성";
      }else{
      result+="성별 미상";
      
    }
    return result;
  }

  void selectAge() {
    for(int i=0;i<ageGroup.length;i++)
      {
        if(ageGroup[i]==total)
          {
            age.selectedAgeGroup = i;
          }
      }

  }

}
