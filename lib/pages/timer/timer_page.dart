// import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/pages/timer/train_page.dart';
import 'package:provider/provider.dart';
import 'package:npng/providers/set_rest.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerPage extends StatelessWidget {
  static const String id = '/timer';

  void playSound() {
    // final player = AudioCache();
    // try {
    //   player.play('sounds/444672__tissman__cool-tone.wav');
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    int duration = Provider.of<SetRestProvider>(context).rest;
    CountDownController _controller = CountDownController();

    return MpScaffold(
      //appBar: MpAppBar(title: Text(S.of(context).title)),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularCountDownTimer(
              // Countdown duration in Seconds
              duration: duration,

              // Controller to control (i.e Pause, Resume, Restart) the Countdown
              controller: _controller,

              // Width of the Countdown Widget
              width: MediaQuery.of(context).size.width / 2,

              // Height of the Countdown Widget
              height: MediaQuery.of(context).size.height / 2,

              // Default Color for Countdown Timer
              color: Colors.white,

              // Filling Color for Countdown Timer
              fillColor: Colors.blueAccent,

              // Background Color for Countdown Widget
              backgroundColor: null,

              // Border Thickness of the Countdown Circle
              strokeWidth: 5.0,

              // Text Style for Countdown Text
              textStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 12, //22.0,
                color: Colors.blueAccent,
                //fontWeight: FontWeight.bold,
              ),

              // true for reverse countdown (max to 0), false for forward countdown (0 to max)
              isReverse: true,

              // true for reverse animation, false for forward animation
              isReverseAnimation: true,

              // Optional [bool] to hide the [Text] in this widget.
              isTimerTextShown: true,

              // Function which will execute when the Countdown Ends
              onComplete: () {
                // Here, do whatever you want
                //print('Countdown Ended');
                playSound();

                int curSet =
                    Provider.of<SetRestProvider>(context, listen: false)
                        .currentSet;
                int sets =
                    Provider.of<SetRestProvider>(context, listen: false).sets;

                if (curSet >= sets) {
                  Navigator.popUntil(
                      context, ModalRoute.withName(TrainPage.id));
                } else {
                  Provider.of<SetRestProvider>(context, listen: false)
                      .increaseCurrentSet();
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
