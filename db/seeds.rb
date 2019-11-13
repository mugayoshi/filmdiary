[
  ['Spritied Away', 'Hayao Miyazaki', 'a.img', '2004/04/04', '千と千尋の神隠し', 'ja', 'ジブリの映画'],
  ['Joker', 'Tod Philips', 'b.img', '2019/10/04', 'Joker', 'en', 'Arthur turns to Joker']
].each do |title, director, img, date, original_title, lang, desc|
    Film.create!(
      {title: title, director: director, 
      image: img, release_date: date, 
      original_title: original_title, lang: lang, description: desc}
    )
end
