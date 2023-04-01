def longest_shiritori(words)
  # 単語の先頭文字をキー、単語を値として持つハッシュを作成する
  word_dict = {}
  words.each do |word|
    first_char = word[0]
    if word_dict.has_key?(first_char)
      word_dict[first_char] << word
    else
      word_dict[first_char] = [word]
    end
  end

  # 最長のしりとりの単語の配列を求める
  max_length = 0
  max_shiritori = []

  words.each do |word|
    # しりとりを始める単語として word を選ぶ
    shiritori = [word]
    available_words = words.dup
    available_words.delete(word)

    # しりとりを続ける
    while true
      last_char = shiritori[-1][-1]
      candidates = (word_dict[last_char] || []).select {|w| available_words.include?(w)}

      if candidates.empty?
        break
      end

      next_word = candidates.sample
      shiritori << next_word
      available_words.delete(next_word)
    end

    # 最長のしりとりを更新する
    if shiritori.length > max_length
      max_length = shiritori.length
      max_shiritori = shiritori
    end
  end

  return max_shiritori
end

words = ["めだか", "るすばん", "りんご", "おしるこ", "びわ", "わたあめ", "こまつな", "なすび", "かえる"]
longest = longest_shiritori(words)
puts longest.join(" -> ")
