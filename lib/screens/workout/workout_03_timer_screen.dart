import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_04_finish_screen.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/theme.dart';
import 'package:provider/provider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

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
    int duration = Provider.of<WorkoutState>(context).currentRest;
    CountDownController _controller = CountDownController();

    return Scaffold(
      persistentFooterButtons: <Widget>[
        Center(
          child: ElevatedButton(
            child: Text(S.of(context).stopRest),
            onPressed: () {
              _controller.pause();
              Provider.of<WorkoutState>(context, listen: false).incCurrentSet();
              if (!Provider.of<WorkoutState>(context, listen: false).finished) {
                Navigator.pop(context);
              } else {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const WorkoutFinishScreen(),
                    ),
                    (route) => false);
              }
            },
          ),
        ),
      ],
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
                  ringColor: Colors.transparent,

                  // Filling Color for Countdown Timer
                  fillColor: AppTheme.light.primaryColor,

                  // Background Color for Countdown Widget
                  backgroundColor: null,

                  // Border Thickness of the Countdown Circle
                  strokeWidth: 5.0,

                  // Text Style for Countdown Text
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 12, //22.0,
                    color: Theme.of(context).primaryColor,
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
                    Provider.of<WorkoutState>(context, listen: false)
                        .incCurrentSet();
                    if (!Provider.of<WorkoutState>(context, listen: false)
                        .finished) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const WorkoutFinishScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
