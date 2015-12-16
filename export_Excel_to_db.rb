#encoding:utf-8
require "rubygems"
require "spreadsheet"
require 'mysql'


Spreadsheet.client_encoding = "UTF-8"

book = Spreadsheet.open("1.xls")
sheet1 = book.worksheet(0)
#row = sheet1.row(0)
#print row



#print $levels,"\n\n",$levels.uniq

m=Mysql.new("localhost","db_name","root","")
$sql=[]
for i in 0..(sheet1.count-1)
  if sheet1.row(i)!=nil
    $sql<<="(3,'"+sheet1.row(i)[1].to_s.strip+"','"+sheet1.row(i)[2].to_s.strip+"','"+sheet1.row(i)[3].to_s.strip+"','"+sheet1.row(i)[4].to_s.strip+"','"+sheet1.row(i)[5].to_s.strip+"')"
  end
end

sql="insert into bglike (type,cs1,cs2,cs3,cs4,cs5) values "+$sql.join(",")

p sql
m.query(sql)

