import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantor Bola'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle the search action here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            'Berita Terbaru'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            'Pertandingan Hari Ini'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(2, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: const Image(
                            height: 300,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.ligaolahraga.com/storage/images/news/2023/10/09/tanpa-messi-dan-neymar-kylian-mbappe-kini-jadi-macan-ompong.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: const Image(
                            height: 300,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt93541453c3ad4653/6522055f0ee4fede87b32c8f/messisad.jpg?auto=webp&format=pjpg&width=3840&quality=60'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: const Image(
                            height: 300,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://radarlampung.disway.id/upload/0d5112b07d970e2fa5eadb07a1b893ba.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: const Image(
                            height: 300,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://cdn.rri.co.id/berita/1/images/1691422061164-F26eBKBWUAA_zok/1691422061164-F26eBKBWUAA_zok.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: const Image(
                            height: 300,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://assets.pikiran-rakyat.com/crop/604x5:1195x837/x/photo/2022/04/25/1071097494.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(5, 5),
                    ),
                  ],
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top 5 Pemain Terbaik',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          String imageUrl =
                              'https://www.ligaolahraga.com/storage/images/news/2023/10/09/tanpa-messi-dan-neymar-kylian-mbappe-kini-jadi-macan-ompong.jpg';
                          String playerName = 'Kylian Mbappé';

                          switch (index) {
                            case 0:
                              imageUrl =
                                  'https://www.ligaolahraga.com/storage/images/news/2023/10/09/tanpa-messi-dan-neymar-kylian-mbappe-kini-jadi-macan-ompong.jpg';
                              playerName = 'Kylian Mbappé';
                              break;
                            case 1:
                              imageUrl =
                                  'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt93541453c3ad4653/6522055f0ee4fede87b32c8f/messisad.jpg?auto=webp&format=pjpg&width=3840&quality=60';
                              playerName = 'Lionel Messi';
                              break;
                            case 2:
                              imageUrl =
                                  'https://radarlampung.disway.id/upload/0d5112b07d970e2fa5eadb07a1b893ba.jpg';
                              playerName = 'Cristiano Ronaldo';
                              break;
                            case 3:
                              imageUrl =
                                  'https://cdn.rri.co.id/berita/1/images/1691422061164-F26eBKBWUAA_zok/1691422061164-F26eBKBWUAA_zok.jpg';
                              playerName = 'Mohamed Salah';
                              break;
                            case 4:
                              imageUrl =
                                  'https://assets.pikiran-rakyat.com/crop/604x5:1195x837/x/photo/2022/04/25/1071097494.jpg';
                              playerName = 'Mesut Özil';
                              break;
                            default:
                              imageUrl = '';
                              playerName = '';
                          }

                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image(
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(imageUrl),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    playerName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
