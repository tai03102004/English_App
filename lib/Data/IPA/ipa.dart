class IPA {
  final String symbol;
  final String description;
  final String mouthPosition;
  final String tonguePosition;
  final List<String> examples;

  IPA({
    required this.symbol,
    required this.description,
    required this.mouthPosition,
    required this.tonguePosition,
    required this.examples,
  });
}

final ipaSounds = [
  IPA(
    symbol: '/ɪ/',
    description:
        'Đây là âm i ngắn, phát âm giống âm “i” của tiếng Việt nhưng ngắn hơn, bật nhanh.',
    mouthPosition: 'Môi hơi mở sang hai bên.',
    tonguePosition: 'Lưỡi hạ thấp.',
    examples: ['sit', 'hit', 'bit', 'kit'],
  ),
  IPA(
    symbol: '/i:/',
    description:
        'Là âm i dài, bạn đọc kéo dài âm “i”, âm phát từ trong khoang miệng chứ không thổi hơi ra.',
    mouthPosition: 'Môi mở rộng hai bên như đang mỉm cười.',
    tonguePosition: 'Lưỡi nâng cao lên.',
    examples: ['see', 'bean', 'keep', 'seat'],
  ),
  IPA(
    symbol: '/e/',
    description: 'Tương tự âm e tiếng Việt nhưng cách phát âm cũng ngắn hơn.',
    mouthPosition: 'Môi mở rộng sang hai bên rộng hơn so với âm /ɪ/.',
    tonguePosition: 'Lưỡi hạ thấp hơn âm /ɪ/.',
    examples: ['bed', 'red', 'set', 'men'],
  ),
  IPA(
    symbol: '/ə/',
    description: 'Âm ơ ngắn, phát như âm ơ tiếng Việt nhưng ngắn và nhẹ hơn.',
    mouthPosition: 'Môi hơi mở rộng.',
    tonguePosition: 'Lưỡi thả lỏng.',
    examples: ['sofa', 'again', 'supply', 'banana'],
  ),
  IPA(
    symbol: '/ɜ:/',
    description:
        'Âm này đọc là âm ơ nhưng cong lưỡi. Bạn phát âm / ə / rồi cong lưỡi lên, phát âm từ trong khoang miệng.',
    mouthPosition: 'Môi hơi mở rộng.',
    tonguePosition: 'Lưỡi cong lên, lưỡi chạm vào vòm miệng khi kết thúc âm.',
    examples: ['burn', 'birthday'],
  ),
  IPA(
    symbol: '/ʊ/',
    description:
        'Âm u ngắn, khá giống âm ư của tiếng Việt.Khi phát âm, không dùng môi mà đẩy hơi rất ngắn từ cổ họng.',
    mouthPosition: 'Môi hơi tròn.',
    tonguePosition: 'Lưỡi hạ thấp.',
    examples: ['good', 'put'],
  ),
  IPA(
    symbol: '/u:/',
    description:
        'Âm u dài, âm phát ra từ khoang miệng nhưng không thổi hơi ra, kéo dài âm u ngắn.',
    mouthPosition: 'Môi tròn.',
    tonguePosition: 'lưỡi nâng cao lên.',
    examples: ['goose', 'school'],
  ),
  IPA(
    symbol: '/ɒ/',
    description: 'Âm o ngắn, tương tự âm o tiếng Việt nhưng phát âm ngắn hơn.',
    mouthPosition: 'Môi hơi tròn.',
    tonguePosition: 'Lưỡi hạ thấp.',
    examples: ['hot', 'box'],
  ),
  IPA(
    symbol: '/ɔ:/',
    description:
        'Phát âm như âm o tiếng Việt nhưng rồi cong lưỡi lên, không phát âm từ khoang miệng.',
    mouthPosition: 'Tròn môi.',
    tonguePosition: 'Lưỡi cong lên chạm vào vòm miệng khi kết thúc âm.',
    examples: ['ball', 'law'],
  ),
  IPA(
    symbol: '/ʌ/',
    description:
        'Âm lai giữa âm ă và âm ơ của tiếng Việt, na ná âm ă hơn. Phát âm phải bật hơi ra.',
    mouthPosition: 'Miệng thu hẹp lại.',
    tonguePosition: 'Lưỡi hơi nâng lên cao.',
    examples: ['come', 'love'],
  ),
  IPA(
    symbol: '/ɑ:/',
    description: 'Âm a đọc kéo dài, âm phát ra từ khoang miệng.',
    mouthPosition: 'Môi mở rộng.',
    tonguePosition: 'Lưỡi hạ thấp.',
    examples: ['start', 'father'],
  ),
  IPA(
    symbol: '/æ/',
    description: 'Âm a bẹt, hơi giống âm a và e, âm có cảm giác bị nén xuống.',
    mouthPosition: 'Miệng mở rộng, môi dưới hạ thấp xuống.',
    tonguePosition: 'Lưỡi hạ rất thấp.',
    examples: ['trap', 'bad'],
  ),
  IPA(
    symbol: '/ɪə/',
    description:
        'Nguyên âm đôi.Phát âm chuyển từ âm / ʊ / rồi dần sang âm /ə/.',
    mouthPosition: 'Môi mở rộng dần nhưng không rộng quá.',
    tonguePosition: 'Lưỡi đẩy dần ra về phía trước.',
    examples: ['near', 'here'],
  ),
  IPA(
    symbol: '/eə/',
    description:
        'Phát âm bằng cách đọc âm  / e / rồi chuyển dần sang âm / ə /.',
    mouthPosition: 'Môi hơi thu hẹp.',
    tonguePosition: 'Lưỡi thụt dần về phía sau.',
    examples: [],
  ),
  IPA(
    symbol: '/ei/',
    description: 'Phát âm bằng cách đọc âm / e / rồi chuyển dần sang âm / ɪ /.',
    mouthPosition: 'Môi dẹt dần sang hai bên.',
    tonguePosition: 'Lưỡi hướng dần lên trên.',
    examples: ['face', 'day'],
  ),
  IPA(
    symbol: '/ɔɪ/',
    description: 'Phát âm bằng cách đọc âm / ɔ: / rồi chuyển dần sang âm /ɪ/.',
    mouthPosition: 'Môi dẹt dần sang hai bên.',
    tonguePosition: 'Lưỡi nâng lên và đẩy dần về phía trước.',
    examples: ['choice', 'boy'],
  ),
  IPA(
    symbol: '/aɪ/',
    description: 'Phát âm bằng cách đọc âm / ɑ: / rồi chuyển dần sang âm /ɪ/.',
    mouthPosition: 'Môi dẹt dần sang hai bên.',
    tonguePosition: 'Lưỡi nâng lên và hơi đẩy dần về trước.',
    examples: ['nice', 'try'],
  ),
  IPA(
    symbol: '/əʊ/',
    description: 'Phát âm bằng cách đọc âm / ə/ rồi chuyển dần sang âm / ʊ /.',
    mouthPosition: 'Môi từ hơi mở đến hơi tròn.',
    tonguePosition: 'Lưỡi lùi dần về phía sau.',
    examples: ['goat', 'show'],
  ),
  IPA(
    symbol: '/aʊ/',
    description: 'Phát âm bằng cách đọc âm / ɑ: / rồi chuyển dần sang âm /ʊ/.',
    mouthPosition: 'Môi Tròn dần.',
    tonguePosition: 'Lưỡi hơi thụt về phía sau.',
    examples: ['mouth', 'cow'],
  ),
  IPA(
    symbol: '/ʊə/',
    description: 'Đọc như uo, chuyển từ âm sau /ʊ/ sang âm giữa /ə/.',
    mouthPosition:
        'Khi bắt đầu, môi mở khá tròn, hơi bè, hướng ra ngoài, mặt lưỡi đưa vào phía trong khoang miệng và hướng lên gần ngạc trên.',
    tonguePosition:
        'Ngay sau đó, miệng hơi mở ra, đưa lưỡi lùi về giữa khoang miệng.',
    examples: ['sure', 'tour'],
  ),
  IPA(
    symbol: '/p/',
    description: 'Đọc gần giống âm P của tiếng Việt.',
    mouthPosition: 'Hai môi chặn luồng không khí trong miệng sau đó bật ra.',
    tonguePosition: ' Cảm giác dây thanh quản rung nhẹ.',
    examples: ['pen', 'copy'],
  ),
  IPA(
    symbol: '/b/',
    description: 'Đọc tương tự âm B trong tiếng Việt.',
    mouthPosition: 'Để hai môi chặng không khí từ trong miệng sau đó bật ra.',
    tonguePosition: ' Thanh quản rung nhẹ.',
    examples: ['back', 'job'],
  ),
];
