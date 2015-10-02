parsed_uta = TSV.parse_file('/Users/kartikeychauhan/Documents/college/COMP5338 Advanced Data Models/hetrec2011-lastfm-2k-2/user_taggedartists.dat').without_header

parsed_uta.each do |x|
  if x[0] === 'userID' then
    next
  end

  u = User.find_or_create_by(userID: x[0])
  a = Artist.find_or_create_by(artistID: x[1])
  t = AllTag.find_or_create_by(tagID: x[2])
  a.tags.create({
    tagID: t.tagID,
    tag_value: t.tag_value,
    timestamp: Date.new(x[5].to_i, x[3].to_i, x[4].to_i)
    })
  a.save
  u.artists << a
  u.save
end
