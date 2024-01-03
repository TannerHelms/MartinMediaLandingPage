import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:confetti/confetti.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _controller = ConfettiController();

  final _formKey = GlobalKey<FormState>();

  SizedBox verticlePadding = const SizedBox(height: 20);

  TextStyle portfolioText = GoogleFonts.enriqueta(
      fontSize: 27, color: Colors.white, letterSpacing: 4);

  double starSize = 40;
  Color starColor = Colors.amber;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.duration = const Duration(seconds: 4);
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        colorFilter: const ColorFilter.mode(
                            Colors.black26, BlendMode.darken),
                        fit: BoxFit.cover,
                        image: Image.asset('images/top.webp').image,
                      )),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('You\'re Getting Married',
                                style: GoogleFonts.raleway(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center),
                            Text('And we\'re here to celebrate with you!',
                                style: GoogleFonts.raleway(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                      left: 20,
                      top: 20,
                      child: Image(
                          image: AssetImage('images/logo.png'), width: 100)),
                ],
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                margin: const EdgeInsetsDirectional.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        verticlePadding,
                        const Text(
                            'Enter your information to get our wedding packages and a FREE starters guide',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                        verticlePadding,
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                          verticlePadding,
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a email';
                              }
                              return null;
                            },
                          ),
                          verticlePadding,
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              return null;
                            },
                          ),
                          verticlePadding,
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Color.fromRGBO(0, 122, 255, 1)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('processing data')));
                                }
                              },
                              child: const Text('Submit',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          verticlePadding,
                          verticlePadding,
                          const Align(
                              alignment: Alignment.center,
                              child: Text('View the Portfolio',
                                  style: TextStyle(fontSize: 20))),
                          verticlePadding,
                          Row(children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                html.window.open(
                                    'https://youtu.be/hl6QYDvCdlw', 'new tab');
                              },
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: const Image(
                                      image: AssetImage('images/video.webp'),
                                      fit: BoxFit.fill,
                                      color: Colors.black12,
                                      colorBlendMode: BlendMode.darken,
                                    )),
                                Column(
                                  children: [
                                    Text('WEDDING', style: portfolioText),
                                    Text('VIDEOS', style: portfolioText)
                                  ],
                                )
                              ]),
                            )),
                            const SizedBox(width: 10),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                html.window.open(
                                    ' https://gallery.martinmedia.us/-martinmediaweddingphotography',
                                    'new tab');
                              },
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: const Image(
                                      image: AssetImage('images/photo.webp'),
                                      fit: BoxFit.fill,
                                      color: Colors.black12,
                                      colorBlendMode: BlendMode.darken,
                                    )),
                                Column(
                                  children: [
                                    Text('WEDDING', style: portfolioText),
                                    Text('PHOTOS', style: portfolioText)
                                  ],
                                )
                              ]),
                            )),
                          ]),
                          verticlePadding,
                          const Align(
                              alignment: Alignment.center,
                              child: Text(
                                  'We\'ve served 100\'s of happy couples',
                                  style: TextStyle(fontSize: 20))),
                          verticlePadding,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,
                                    color: starColor, size: starSize),
                                Icon(Icons.star,
                                    color: starColor, size: starSize),
                                Icon(Icons.star,
                                    color: starColor, size: starSize),
                                Icon(Icons.star,
                                    color: starColor, size: starSize),
                                Icon(Icons.star,
                                    color: starColor, size: starSize),
                              ]),
                          verticlePadding,
                          Review(
                              verticlePadding: verticlePadding,
                              text:
                                  'Josiah and Tanner are a dream duo!! They’re so personable, professional, and fun to work with! We got to meet with Josiah over Zoom a couple times before the big day to get to know each other and to give him wedding details/ideals, then they both showed up in wedding day ready to rock! My husband is very camera shy so he was a little nervous (and I was a little nervous for him), but Josiah and Tanner did SUCH a good job making it “not a big deal” that there were cameras around us. They put the audio and video coverage together so expertly, and it is absolutely beautiful. Not to mention, MONTHS after the wedding I asked if they were able to make us a video of our speeches, and they were so quick to get some magic to us. The footage is expertly captured and beautifully delivered. Thank you SO much Josiah and Tanner! We’re so happy to have these amazing memories forever.',
                              title: 'Magical Memories',
                              name: 'Erin Z',
                              date: 'married on 06/02/2023'),
                          verticlePadding,
                          const Divider(
                            color: Colors.grey,
                            height: 5,
                          ),
                          verticlePadding,
                          Review(
                            verticlePadding: verticlePadding,
                            text:
                                'Martin Media could not have been more impressive at our wedding. They were professional and helped keep our special day on track. There are so many things you have to worry about on your wedding day and I am so glad that our photography/videography was not one of them. We watch our wedding video frequently and every time we press play it’s like we’re re-living it all over again. Thank you so much to Martin Media for making our special day so special and for giving us memories that will last a lifetime.',
                            title: 'Seamless and Thoughtful Work ',
                            date: 'married on 07/01/2023',
                            name: 'Walker S',
                          ),
                          verticlePadding,
                          const Divider(
                            color: Colors.grey,
                            height: 5,
                          ),
                          verticlePadding,
                          Review(
                              verticlePadding: verticlePadding,
                              text:
                                  'I can honestly say that these guys made my entire wedding experience way better than I could ever imagine. They were so on top of things, they helped so much with the coordination and timing and always made us feel comfortable. Most of the time I never even realized they were there. One thing I can say for sure is that this is not just their job they are so passionate and so good at what they do. I would 110% recommend them to ANYONE. They very quickly felt like friends and I couldn’t imagine anyone else to capture our special day.',
                              title: 'Best ever!',
                              name: 'Darcy I',
                              date: 'married on 06/24/2022')
                        ],
                      ),
                    ),
                    verticlePadding,
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color.fromRGBO(0, 122, 255, 1)),
                        ),
                        onPressed: () {
                          html.window
                              .open('https://martinmedia.us/', 'new tab');
                        },
                        child: const Text('Visit Website',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width / 2,
            top: 0,
            child: ConfettiWidget(
                confettiController: _controller, blastDirection: pi / 2, gravity: 0.5, blastDirectionality: BlastDirectionality.explosive, )),
      ],
    ));
  }
}

class Review extends StatelessWidget {
  const Review(
      {super.key,
      required this.verticlePadding,
      required this.text,
      required this.title,
      required this.date,
      required this.name});

  final SizedBox verticlePadding;
  final String text;
  final String title;
  final String date;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        Text(
          date,
          style: const TextStyle(color: Colors.grey),
        ),
        verticlePadding,
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.justify,
            )),
        const SizedBox(height: 10),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '- $name',
              style: const TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.justify,
            )),
      ],
    );
  }
}
