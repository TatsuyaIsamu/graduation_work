require 'csv'
# インポートファイルを読み込む
def import_read( file_name )
  lines = CSV.read("db/#{file_name}")
  lines.unshift([])  # index 0番目は空行を入れてスキップさせる

  lines.each_with_index do |line, idx|
    next unless line.length > 0

    yield(line, idx) if block_given?
  end
end

# CSVファイルの取込
import_read('test_shinto.csv') do |line, idx|
  Shinto.seed do |s|
    s.id      = idx
    s.name = line[0]
    s.image = line[1]
    s.address = line[2]
    s.origin_shrine = line[3]
    s.original_url = line[4]
    s.kamisama = line[5]
    s.origin_term = line[6]
    s.origin_history = line[7]
  end
end