import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_04_finish_page.dart';
import 'package:npng/models/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  static const String id = '/timer';

  void playSound() {
    final player = AudioCache();
    try {
      player.play('sounds/545913__jose-danielms__alarm.wav',
          mode: PlayerMode.LOW_LATENCY);
    } catch (e) {
      //print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int duration = Provider.of<WorkoutProvider>(context).currentRest;
    CountDownController _controller = CountDownController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularCountDownTimer(
                  // Countdown duration in Seconds
                  duration: duration,

                  // Controller to control (i.e Pause, Resume, Restart) the Countdown
                  controller: _controller,

                  // Width of the Countdown Widget
                  width: MediaQuery.of(context).size.width / 2,

                  // Height of the Countdown Widget
                  height: MediaQuery.of(context).size.height / 2,

                  // Default Color for Countdown Timer
                  ringColor: Colors.white,

                  // Filling Color for Countdown Timer
                  fillColor: (isApple)
                      ? CupertinoTheme.of(context).primaryColor
                      : Theme.of(context).colorScheme.secondary,

                  // Background Color for Countdown Widget
                  backgroundColor: null,

                  // Border Thickness of the Countdown Circle
                  strokeWidth: 5.0,

                  // Text Style for Countdown Text
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 12, //22.0,
                    color: (isApple)
                        ? CupertinoTheme.of(context).primaryColor
                        : Theme.of(context).colorScheme.secondary,
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
                    playSound();
                    Provider.of<WorkoutProvider>(context, listen: false)
                        .incCurrentSet();
                    if (!Provider.of<WorkoutProvider>(context, listen: false)
                        .finished) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        mpPageRoute(
                          builder: (BuildContext context) =>
                              const WorkoutFinishPage(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                MpButton(
                  label: S.of(context).stopRest,
                  onPressed: () {
                    _controller.pause();
                    Provider.of<WorkoutProvider>(context, listen: false)
                        .incCurrentSet();
                    if (!Provider.of<WorkoutProvider>(context, listen: false)
                        .finished) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                          context,
                          mpPageRoute(
                            builder: (BuildContext context) =>
                                const WorkoutFinishPage(),
                          ),
                          (route) => false);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
