import 'package:flutter/material.dart';
import './Home1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import './Men.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mensaplan extends StatefulWidget {
  @override
  _MensaplanScreenState createState() => _MensaplanScreenState();
}

class _MensaplanScreenState extends State<Mensaplan> {
  List<dynamic> _mensaplan = [];

  @override
  void initState() {
    super.initState();
    _fetchMensaplan();
  }

  _fetchMensaplan() async {
    final response = await http.get(Uri.parse(
        "https://uni-giessen.maxmanager.xyz/extern/mensa-hochschule-fulda.json"));
    var responseDecoded = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      if (this.mounted) {
        setState(() {
          _mensaplan = responseDecoded["items"];
        });
      }
    } else {
      throw Exception('Failed to load mensaplan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff82a47d),
        body: Stack(
          children: [
            Pinned.fromPins(
              Pin(size: 222.0, middle: 0.5),
              Pin(size: 157.0, start: -8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('lib/assets/images/Logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 111.0, 0.0, 0.0),
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_grnki1,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: _mensaplan == null
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: _mensaplan.length,
                            itemBuilder: (BuildContext context, int index) {
                              var meal = _mensaplan[index];
                              print(meal['beschreibung_clean']);
                              return Column(
                                children: [
                                  getText(DateTime.parse(meal['date'])),
                                  Card(
                                    color: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    child: Container(
                                      width: double.infinity,
                                      height: 350,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              height: 250,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  meal['image'],
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(meal['artikel_clean'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.white)),
                                            ),
                                            SizedBox(height: 5),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  meal['beschreibung_clean'],
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.white)),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                      meal['prices']['student'],
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  SizedBox(width: 5),
                                                  Text('|',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  SizedBox(width: 5),
                                                  Text(meal['prices']['staff'],
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  SizedBox(width: 5),
                                                  Text('|',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  SizedBox(width: 5),
                                                  Text(meal['prices']['guest'],
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(size: 137.0, middle: 0.5017),
              Pin(size: 139.0, end: -70.0),
              child: PageLink(
                links: [
                  PageLinkInfo(
                    pageBuilder: () => Men(),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xfcdedfde),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment(0.0, -0.469),
                      child: SizedBox(
                        width: 39.0,
                        height: 26.0,
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 3.0, start: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff000000),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 3.0, end: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff000000),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 3.0, middle: 0.5217),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff000000),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime? lastDate;

  Widget getText(DateTime date) {
    var text = DateFormat.yMMMMd(Localizations.localeOf(context).toString())
        .format(date);
    if (lastDate == null) {
      lastDate = date;
      return Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      );
    }

    if (lastDate == date) return Text('');

    print(text);
    lastDate = date;
    return Text(text, style: TextStyle(fontSize: 20, color: Colors.white));
  }
}

const String _svg_grnki1 =
    '<svg viewBox="0.0 111.0 430.0 821.0" ><path transform="translate(-4809.22, -105.81)" d="M 4809.2158203125 235.9864654541016 L 4809.2158203125 1037.805908203125 L 5239.2158203125 1037.805908203125 L 5239.2158203125 258.1225891113281 C 5239.2158203125 258.1225891113281 5200.91162109375 302.3948059082031 5135.4228515625 266.7310791015625 C 5106.90185546875 253.0500183105469 5094.7890625 234.965576171875 5042.4404296875 227.2151031494141 C 5003.9365234375 225.0621948242188 4923.466796875 263.3840026855469 4866.3603515625 230.2291717529297 C 4809.25341796875 197.0743560791016 4809.2158203125 235.9864654541016 4809.2158203125 235.9864654541016 Z" fill="#407e39" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

const String _svg_q46b9e =
    '<svg viewBox="0.0 111.0 430.0 821.0" ><path transform="translate(-4809.22, -105.81)" d="M 4809.2158203125 235.9864654541016 L 4809.2158203125 1037.805908203125 L 5239.2158203125 1037.805908203125 L 5239.2158203125 258.1225891113281 C 5239.2158203125 258.1225891113281 5200.91162109375 302.3948059082031 5135.4228515625 266.7310791015625 C 5106.90185546875 253.0500183105469 5097.5078125 231.383544921875 5042.4404296875 227.2151031494141 C 5003.9365234375 225.0621948242188 4923.466796875 263.3840026855469 4866.3603515625 230.2291717529297 C 4809.25341796875 197.0743560791016 4809.2158203125 235.9864654541016 4809.2158203125 235.9864654541016 Z" fill="#407e39" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p6j9lq =
    '<svg viewBox="34.0 306.0 53.0 39.0" ><path transform="translate(34.0, 306.0)" d="M 32 0 L 43.17774963378906 0 L 53 0 L 53 13 C 53 27.35940551757812 41.35940551757812 39 27 39 L 0 39 L 0 32 C 0 14.3268871307373 14.3268871307373 0 32 0 Z" fill="#9fb86c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
