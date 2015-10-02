parsed_all_tags = TSV.
  parse_file('/Users/kartikeychauhan/Documents/college/COMP5338 Advanced Data Models/hetrec2011-lastfm-2k-2/tags.dat')
  .without_header

parsed_all_tags.each do |x|
  if x[0] === 'tagID' then
    next
  end

  all_tag = AllTag.new
  all_tag.tagID = x[0].to_i
  all_tag.tag_value = x[1]
  all_tag.save
end
