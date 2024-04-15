import 'package:flutter/material.dart';
import 'home.dart';
import 'odds.dart';

class CrashPage extends StatefulWidget {
  @override
  _CrashPageState createState() => _CrashPageState();
}

class _CrashPageState extends State<CrashPage> {
  bool showWarning = true;
  bool showContent = false;
  List<double> oddsList = [];
  TextEditingController oddsController = TextEditingController();
  double nextOdd = 0;

  void _dismissWarning() {
    setState(() {
      showWarning = false;
      showContent = true;
    });
  }

  void _addOdds() {
    if (oddsController.text.isNotEmpty) {
      double odds = double.parse(oddsController.text);
      setState(() {
        oddsList.add(odds);
        nextOdd = _calculateNextOdd();
      });
      oddsController.clear();

      if (oddsList.length == 10) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Good Job!'),
              content: Text('You have entered 10 odds.'),
              actions: [
                TextButton(
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  double _calculateNextOdd() {
    double currentSum = oddsList.reduce((value, element) => value + element);
    double nextOdd = currentSum + 1;
    return nextOdd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crash Game'),
      ),
      body: Container(
        color: Color(0xFFCBD0D1),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (showWarning)
              AlertDialog(
                title: Text('Preventive Measures'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '1. Implement strong security measures to protect your game from hacking attempts. Regularly update and patch any vulnerabilities.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '2. Use encryption techniques to secure sensitive data and transactions.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '3. Employ server-side validation and anti-cheat mechanisms to detect and prevent cheating in real-time.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '4. Implement a user reporting system that allows legitimate players to report suspected cheaters or hackers. Encourage your community to report any unusual activity.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '5. When you receive reports, investigate them thoroughly before taking any action. False accusations can harm your reputation and drive away legitimate players.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '6. Avoid engaging in direct confrontations with hackers. Publicly accusing them or engaging in back-and-forths can escalate the situation and attract more malicious activity.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '7. If you have substantial evidence of cheating, consider issuing warnings or temporary suspensions to hackers rather than immediate permanent bans. Give them a chance to reform.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '8. Clearly define your policies on cheating and hacking in your terms of service and community guidelines. Ensure players are aware of the consequences of cheating.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '9. When dealing with a suspected hacker, collect as much evidence as possible. This may include server logs, chat records, or gameplay recordings.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '10. If hacking or cheating poses a severe threat to your game\'s integrity or financial stability, consult with legal professionals to explore options for taking legal action against malicious actors.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '11. Foster a strong community that discourages cheating. Encourage players to play fair and promote sportsmanship within the game.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '12. Continuously update your game and its anti-cheat measures to stay ahead of evolving hacking techniques.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '13. If the hacking problem becomes severe, consider collaborating with cybersecurity experts who specialize in gaming security.',
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '14. Educate your player base about the risks of hacking and cheating, emphasizing that it can lead to loss of accounts and other penalties.                                                                                                                     .',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width:
                                  100, // Set the desired width for the Cancel button
                              height: 30, // Set the desired height
                              decoration: BoxDecoration(
                                color: Colors
                                    .teal, // Change the button color to teal
                                borderRadius: BorderRadius.circular(
                                    10), // Add rounded corners if desired
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .transparent, // Make the ElevatedButton transparent
                                  shadowColor:
                                      Colors.transparent, // Remove the shadow
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors
                                          .white), // Change text color to white
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 25.0), // Add spacing between buttons
                            Container(
                              width:
                                  100, // Set the desired width for the OK button
                              height: 30, // Set the desired height
                              decoration: BoxDecoration(
                                color: Colors
                                    .teal, // Change the button color to teal
                                borderRadius: BorderRadius.circular(
                                    10), // Add rounded corners if desired
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(0, 0, 0,
                                      0), // Make the ElevatedButton transparent
                                  shadowColor:
                                      Colors.transparent, // Remove the shadow
                                ),
                                onPressed: () {
                                  _dismissWarning();
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors
                                          .white), // Change text color to white
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (showContent)
              Column(
                children: [
                  Text(
                    'Enter Last 10 odds',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  TextField(
                    controller: oddsController,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true), // Allow decimal input
                    decoration: InputDecoration(
                      labelText: 'Enter odds',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: oddsList.length == 9
                        ? TextInputAction.done
                        : TextInputAction.next,
                  ),
                  SizedBox(height: 32.0),
                  Container(
                    width: 200, // Set the desired width
                    height: 50, // Set the desired height
                    decoration: BoxDecoration(
                      color: Colors.teal, // Change the button color to teal
                      borderRadius: BorderRadius.circular(
                          10), // Add rounded corners if desired
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Make the ElevatedButton transparent
                        shadowColor: Colors.transparent, // Remove the shadow
                      ),
                      onPressed:
                          _addOdds, // Replace with your onPressed function
                      child: Text(
                        'Add odds',
                        style: TextStyle(
                            color: Colors.white), // Change text color to white
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Odds List:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          height: 200.0,
                          child: ListView.builder(
                            itemCount: oddsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(oddsList[index].toString()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (oddsList.length == 10) ...[
                    SizedBox(height: 40.0),
                    Container(
                      width: 250, // Set the desired width
                      height: 50, // Set the desired height
                      decoration: BoxDecoration(
                        color: Colors.teal, // Change the button color to teal
                        borderRadius: BorderRadius.circular(
                            10), // Add rounded corners if desired
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Make the ElevatedButton transparent
                          shadowColor: Colors.transparent, // Remove the shadow
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return NextOddDialog();
                            },
                          );
                        },
                        child: Text(
                          'What\'s the next odd?',
                          style: TextStyle(
                              color:
                                  Colors.white), // Change text color to white
                        ),
                      ),
                    ),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class NextOddDialog extends StatefulWidget {
  @override
  _NextOddDialogState createState() => _NextOddDialogState();
}

class _NextOddDialogState extends State<NextOddDialog> {
  bool showGif = true;
  bool showNextOdd = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          showGif = false;
          showNextOdd = true;
        });
      }
    });

    Future.delayed(Duration(seconds: 11), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OddsPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Robotic Process Automation',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: 160.0,
        child: Column(
          children: [
            if (showGif)
              Image.asset(
                'images/proc.gif',
                height: 145.0,
                width: 145.0,
              ),
            if (showNextOdd)
              Center(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 20.0), // Adjust the value as needed
                  child: Text(
                    'You will be redirected to the odds page...',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CrashPage(),
  ));
}
