# in_app_call_alert

A new Flutter package to show an alert screen.

## Screenshots
<div>
<img src="https://github.com/KarimMohamed20/InAppCallAlert/blob/master/screenshot1.png" alt="example" width="250"/>
<img src="https://github.com/KarimMohamed20/InAppCallAlert/blob/master/screenshot2.png" alt="package" width="250"/>
</div>

## Usage

[Example](https://github.com/KarimMohamed20/InAppCallAlert/blob/master/example/lib/main.dart)

To use this package :

* add the dependency to your **pubspec.yaml**

``` yaml
  dependencies:
    flutter:
      sdk: flutter
    in_app_call_alert:
```

### How to use

``` dart
CallAlert(
    callerName: 'Karim Mohamed',
    ringtonePath: 'ringtone.mp3',
    onAgree: (){
      Navigator.pop(context);
      print('Working!');
  },
)
```

## ِExample

``` dart
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In App Call Alert'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> CallAlert(callerName: 'Karim Mohamed',
                  ringtonePath: 'ringtone.mp3',
                  onAgree: (){
                    Navigator.pop(context);
                    print('Working!');
                  },
                  )
                ));
              },
              child: Text(
                "Receive Call",
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(12),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            )
          ],
        ),
      ),
    );
  }
}
```
