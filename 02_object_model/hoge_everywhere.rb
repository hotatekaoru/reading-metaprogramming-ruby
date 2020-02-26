# 次に挙げるクラスのいかなるインスタンスからも、hogeメソッドが呼び出せる
# それらのhogeメソッドは、全て"hoge"という文字列を返す
# - String
# - Integer
# - Numeric
# - Class
# - Hash
# - TrueClass
[String, Integer, Numeric, Class, Hash, TrueClass].each { |klass| klass.define_method(:hoge) { 'hoge' } }
