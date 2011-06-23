# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :series_metainfo do |f|
  f.association(:series)
  f.rmr "MyString"
  f.series_description "MyString"
  f.path "MyString"
  f.scanned_file "MyString"
  f.timestamp "2011-06-20 12:39:05"
  f.glob "MyString"
  f.rep_time "9.99"
  f.bold_reps 1
  f.slices_per_volume 1
  f.thumbnail_file_name "MyString"
  f.thumbnail_content_type "MyString"
  f.thumbnail_file_size 1
  f.thumbnail_updated_at "2011-06-20 12:39:05"
  f.dicom_series_uid "MyString"
  f.dicom_taghash "MyText"
end