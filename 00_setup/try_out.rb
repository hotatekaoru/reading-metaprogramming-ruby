class TryOut
  # このクラスの仕様
  # コンストラクタは、2つまたは3つの引数を受け付ける。引数はそれぞれ、ファーストネーム、ミドルネーム、ラストネームの順で、ミドルネームは省略が可能。
  def initialize(first_name, middle_name='', last_name)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    raise ArgumentError if blank?(first_name) || blank?(last_name)
  end

  # full_nameメソッドを持つ。これは、ファーストネーム、ミドルネーム、ラストネームを半角スペース1つで結合した文字列を返す。ただし、ミドルネームが省略されている場合に、ファーストネームとラストネームの間には1つのスペースしか置かない
  def full_name
    name_array.join(' ')
  end

  # first_name=メソッドを持つ。これは、引数の内容でファーストネームを書き換える。
  attr_accessor :first_name, :middle_name, :last_name

  # upcase_full_nameメソッドを持つ。これは、full_nameメソッドの結果をすべて大文字で返す。このメソッドは副作用を持たない。
  def upcase_full_name
    name_array.map(&:upcase).join(' ')
  end

  # upcase_full_name! メソッドを持つ。これは、upcase_full_nameの副作用を持つバージョンで、ファーストネーム、ミドルネーム、ラストネームをすべて大文字に変え、オブジェクトはその状態を記憶する
  def upcase_full_name!
    name_array.map(&:upcase!).join(' ')
  end

  private

  def name_array
    [first_name, middle_name, last_name].reject(&:empty?)
  end

  def blank?(value)
    # https://github.com/rails/rails/blob/6-0-stable/activesupport/lib/active_support/core_ext/object/blank.rb#L19
    value.respond_to?(:empty?) ? !!value.empty? : !value
  end
end
